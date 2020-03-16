---

copyright:
  year:  2020
lastupdated: "2020-03-16"

keywords: hive, metastore, catalog, performance, create table, object storage

subcollection: sql-query

---

{:shortdesc: .shortdesc}
{:new_window: target="_blank"}
{:codeblock: .codeblock}
{:pre: .pre}
{:screen: .screen}
{:tip: .tip}
{:note: .note}


# Catalog management ![Beta](beta.png)
{: #hivemetastore}

Beta support for this feature was introduced in March, 2020.
{: note}

Each instance of {{site.data.keyword.sqlquery_full}} includes a database catalog that you can use to register and manage table definitions for your data on {{site.data.keyword.cos_full}}. Catalog syntax is compatible with Hive Metastore syntax. See below how to [work with the catalog](#usage) and refer to the [Catalog Management](/docs/services/sql-query?topic=sql-query-sql-reference#chapterHiveCatalog) section of the SQL reference.

## Benefits
{: #benefits}

You can explore, change, or discover structured data on [Cloud Object Storage](/docs/services/cloud-object-storage/getting-started.html#getting-started-console) by {{site.data.keyword.sqlquery_short}} using SQL syntax. To query data on {{site.data.keyword.cos_short}} without a table in the catalog, you need to specify the data location (the corresponding COS URI) and the data format in your SELECT statement. During query execution, data and schema are dynamically discovered as part of the SQL compilation process. This process, called inference, derives column names, data types, the list of partitions, and individual objects on {{site.data.keyword.cos_short}} that together make up the table data.
 
Inferring all this information and doing it repetitively with every query imposes latency to your queries. The inference process can take up a significant amount of time, especially for text formats (for example, CSV and JSON), or when there are thousands of objects in different table partitions. In some cases, the inference process even accounts for the largest part of the overall query execution time. So, if you are either familiar with the schema, or want to repetitively use the data for queries, create a table in the catalog. Such a table improves performance for repeated query executions.

Another advantage of creating a table in the catalog is that the table name serves as an alias and is decoupled from the data location. This allows to separate the tasks of data engineers and SQL authors. Data engineers deal with the data location and publish registered tables in the catalog using descriptive table names. Hence, SQL authors are able to compose queries without having to know the exact location and format of data on {{site.data.keyword.cos_short}}. If the data location changes, only the table in the catalog must be updated, but the table name remains unchanged. Updates of the physical data structure are simplified and the robustness of SQL statements and applications is increased.

## Usage
{: #usage}

You manage the database catalog in {{site.data.keyword.sqlquery_short}} via Database Definition Language (DDL) statements that you submit just like any other SQL query statement.
The catalog is stored independently of {{site.data.keyword.cos_short}}: No data is written to {{site.data.keyword.cos_short}} when you create or change table definitions, and no data is deleted from {{site.data.keyword.cos_short}} when you drop a table definition.

To register a new table in the catalog, use the `CREATE TABLE` statement, as in the following example:

```sql
CREATE TABLE employees
USING PARQUET
LOCATION cos://us-geo/sql/employees.parquet
```

The statement automatically detects the schema of the data at the given location.

Use the `DESCRIBE TABLE` statement to verify the detected table schema:

```sql
DESCRIBE TABLE employees
```

If the `DESCRIBE TABLE` output shows partition information, you must execute an `ALTER TABLE ... RECOVER PARTITIONS` statement to attach the partitions. See the section on [partitioned tables](#partitioned) below for more information.

You can then query the table by name instead of specifying the {{site.data.keyword.cos_short}} URI directly in the SQL statement:

```sql
SELECT * FROM employees LIMIT 10
```

If you want to use more specific data types than those inferred by automatic schema detection, you can also specify the table schema explicitly:

```sql
CREATE TABLE employees (
  employeeID int,
  lastName string,
  firstName string,
  title string,
  titleOfCourtesy string,
  birthDate timestamp,
  hireDate timestamp,
  address string,
  city string,
  region string,
  postalCode string,
  country string,
  homePhone string,
  extension int,
  photo string,
  notes string,
  reportsTo string,
  photoPath string
)
USING PARQUET
LOCATION cos://us-geo/sql/employees.parquet
```

If accessing the table in a SELECT statement does not work as expected, it is possibly caused by improper specification of the table schema in the `CREATE TABLE` statement. The column names and their data types in your CREATE TABLE statement must match the result of the following query:

```sql
SELECT * FROM describe (<data-location> stored as <storage-format>)
```

Note that column names are case-sensitive. Incorrect column name specification results in an empty column, that is, the column seems to contain no data. To solve such a problem, use the automatic schema detection, reorder the columns, or omit some columns.

The `SHOW TABLES` statement provides you with an overview of the existing tables in your instance.
This statement allows an optional search filter to limit the number of results:

```sql
SHOW TABLES LIKE '*cus*'
```

To clean up catalog entries for unused data, use the `DROP TABLE` statement.
This statement removes the table definition from the catalog without affecting the actual data on {{site.data.keyword.cos_short}}:

```sql
DROP TABLE customers
```


## Partitioned tables
{: #partitioned}

You can manage a table in the catalog that references data organized in multiple partitions on {{site.data.keyword.cos_short}}. The naming of the objects must adhere to the Hive-style partition naming convention: The object names must include the structure `/columm=value/`. The `column` must be a column name that is included in the schema definition of the `CREATE TABLE` statement. You can also have more than one partitioning columns in the object names, such as `/columm1=value/column2=value/`.

Following is an example list of object names on {{site.data.keyword.cos_short}} that is partitioned on the `country` column following the Hive-style partition naming convention:

```
customers_partitioned.csv/country=Germany/cust-1.csv
customers_partitioned.csv/country=Germany/cust-2.csv
customers_partitioned.csv/country=Spain/cust-1.csv
customers_partitioned.csv/country=Austria/cust-1.csv
customers_partitioned.csv/country=Austria/cust-2.csv
customers_partitioned.csv/country=USA/cust-1.csv
customers_partitioned.csv/country=USA/cust-2.csv
customers_partitioned.csv/country=USA/cust-3.csv
customers_partitioned.csv/country=Sweden/cust-1.csv
```

In order to query partitioned tables, you must perform two mandatory steps:

### Step 1: Register the table
{: #step1}

This data partitioning is reflected in the PARTITIONED BY clause of the following CREATE TABLE statement:

```sql
CREATE TABLE customers (
  customerID string,
  companyName string,
  contactName string,
  contactTitle string,
  address string,
  region string,
  postalCode string,
  country string,
  phone string,
  fax string
)
USING CSV
PARTITIONED BY (country)
LOCATION cos://us-geo/sql/customers_partitioned.csv
```

Automatic schema detection also recognizes paritioned tables from the structure of the object names, so the same table definition is created from the following statement:

```sql
CREATE TABLE customers
USING CSV
LOCATION cos://us-geo/sql/customers_partitioned.csv
```

If your data on {{site.data.keyword.cos_short}} does not adhere to this naming convention, you can convert it to a Hive-partitioned layout by using {{site.data.keyword.sqlquery_short}} in a data preparation step.
Use `SELECT *` to copy the data to a new location and specify [PARTITION BY](/docs/services/sql-query?topic=sql-query-sql-reference#partitionedClause) in the INTO clause:

```sql
SELECT * FROM cos://us-geo/sql/customers.csv
INTO cos://us-geo/mybucket/customers_partitioned.csv
PARTITIONED BY (country)
```

### Step 2: Attach table partitions
{: #step2}

After you defined a partitioned table, it is initially empty and you must attach the partitions to it explicitly.
A convenient way to add all partitions that already exist on {{site.data.keyword.cos_short}}, is to use the `RECOVER PARTITIONS` clause as follows:

```sql
ALTER TABLE customers RECOVER PARTITIONS
```

This overwrites the current partition definitions for the table with the structure detected from {{site.data.keyword.cos_short}} data using the location prefix specified for the table. You can also update partition definitions selectively with the `ADD PARTITION` and `DROP PARTITION` clauses of the `ALTER TABLE` statement, for example, to attach additional data to a table that has been uploaded recently.

Once you have added all partitions, the partitioned table is set up to be queried. You get all the German customers, if you submit the following query:

```sql
SELECT customerID FROM customers WHERE country = 'Germany'
```

The query execution only reads the objects under the `cos://us-geo/sql/customers_partitioned.csv/country=Germany/` prefix because the partition definitions are used by the query optimizer to minimize the necessary data transfer.
