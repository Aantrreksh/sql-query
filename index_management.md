---

copyright:
  years:  2020, 2022
lastupdated: "2022-11-25"

keywords: data skipping, performance, cost, data format, indexes, sample data, index management

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Index management
{: #index_management}

Index management, also referred to as data skipping, can significantly boost performance and reduce cost of SQL queries by skipping over irrelevant data.
Data skipping indexes apply to structured data sets in {{site.data.keyword.cos_full}} and store summary metadata for each object in the data set. The indexes are stored in Cloud {{site.data.keyword.cos_short}} in a user-provided bucket, similarly to the data. SQL queries benefit from an index by skipping over all objects whose metadata indicates that they are not relevant to the indicated query.

## Benefits
{: #benefits_ds}

- Boosts performance of your queries
- Reduces cost of your queries

## Overview
{: #overview_ds}

For each of the columns in an object, summary metadata can include minimum and maximum values, a list or bloom filter of the appearing values, or other metadata that represents the data in that column. The summary metadata is then used during query evaluation to skip over objects that do not contain any relevant data. All formats are supported, including Parquet, ORC, CSV, and JSON. Data skipping is used for performance optimization. Data skipping does not affect the content of query results. {{site.data.keyword.sqlquery_full}} currently supports metaindexes only. Metaindexes are indexes on a higher level, thus they index objects instead of rows.

As {{site.data.keyword.sqlquery_short}} charges on a per-query basis based on the amount of data scanned, reducing the number of bytes scanned per query, reduces cost while it improves performance. For data skipping to work well and for good performance overall, use the [best practices for data layout](https://www.ibm.com/cloud/blog/big-data-layout), such as using the Parquet format and adopting Hive-style partitioning. Ideally, create tables by using the [Cloud Object Storage catalog](/docs/services/sql-query?topic=sql-query-hivemetastore).
Data skipping complements these best practices and provides significant cost savings and performance benefits.

To use this feature, you must create indexes on one or more columns of the data set. Start by indexing columns that you query most often in the `WHERE` clause. A full stop ("**.**") in any column name is not supported.

The following four index types are supported:

Index type | Description | Applicable to predicates in `WHERE` clause | Column types
--- | --- | --- | ---
MinMax | Stores minimum or maximum values for a column | <,<=,=,>=,> and geospatial functions where applicable | All types, except for complex types. [Supported Spark SQL data types](https://spark.apache.org/docs/latest/sql-reference.html#data-types)
ValueList | Stores the list of unique values for the column | =,IN,LIKE | All types, except for complex types. [Supported Spark SQL data types](https://spark.apache.org/docs/latest/sql-reference.html#data-types)
BloomFilter | Using bloom filter technique for set membership | =,IN | Byte, string, long, integer, short
Geospatial | Stores a geospatial bounding box | Geospatial functions | [Geometry types](https://www.ibm.com/support/knowledgecenter/en/SSCJDQ/com.ibm.swg.im.dashdb.analytics.doc/doc/geo_datatypes.html)

Use ValueList for a column if the number of distinct values for that column per object is typically much smaller than the total number of values for that column per object (otherwise, the index can be undesirably large). Use BloomFilter if the number of distinct column values per object is high.

Indexes, or data skipping metadata, are stored in a location you specify. Metadata is typically much smaller than the data itself. If changes are made to some of the objects in the data set after index creation, refresh the indexes. Otherwise, data skipping still works correctly, but it cannot skip the changed objects.

## Usage
{: #usage_ds}

### Sample data
{: #sample_data}

The sample data set used in this documentation originates from the *meter_gen* [data generator](https://github.com/gridpocket/project-iostack/tree/master/meter_gen) that was developed by GridPocket in the context of the [IOStack project](http://iostack.eu/).
It generates electricity, water, and gas meter readings, along with their associated timestamps, geospatial locations, and additional information.
The data set is in Parquet format, has 9 GB, and is publicly available to use with {{site.data.keyword.sqlquery_short}} at `cos:\\us-geo\sql\metergen`.
The queries that are listed in the examples are also available in the UI under **Samples** > **Index management**.
Examples for queries when you work on tables are available under **Samples** > **Index management on tables**.
In the UI samples, under **Basic index creation**, you find a fast running index creation example that creates only MinMax indexes.
**Advanced index creation** is an example for using all index types and it takes longer to finish.

### Assigning a base location for data skipping indexes
{: #assigning_base}

Indexes are stored in Cloud {{site.data.keyword.cos_short}} in a bucket of your choice.
Before you start to create indexes, first configure the default location, called base location, for indexes created in your {{site.data.keyword.sqlquery_short}} instance.
When you use Hive tables, you can also configure the index location per Hive table.

To assign your base location, use the following command:

`ALTER METAINDEX SET LOCATION <path>`

The following command includes a path:

`ALTER METAINDEX SET LOCATION cos://us-south/mybucket/mypath/`

### Creating data skipping indexes
{: #creating_ds_indexes}

When you create a data skipping index on a data set, decide which columns to index, and choose an index type for each column.
Your choices depend on your workload and data. In general, index those columns that are queried the most in the `WHERE` clause. The three supported index types are MinMax, ValueList, and BloomFilter.

The following example creates a data skipping index on the `metergen` data set that uses three index types:

```sql
CREATE METAINDEX
MINMAX FOR temp,
MINMAX FOR lat,
MINMAX FOR lng,
BLOOMFILTER FOR vid,
VALUELIST FOR city
ON cos://us-geo/sql/metergen STORED AS parquet
```

In the [Cloud {{site.data.keyword.cos_short}} URI](/docs/sql-query?topic=sql-query-sql-reference#COSURI), specify the top level (the root) of the data set.

It is possible to share indexes across {{site.data.keyword.sqlquery_short}} accounts. Users who have READ access to the base location of an index can use it by setting their base location. However, it is important to avoid multiple users who write indexes for the same data set to the same base location. Users can avoid sharing indexes by using different base locations.

{{site.data.keyword.sqlquery_short}} charges for index creation based on the amount of data scanned. Index creation for Parquet files benefits from the availability of schema information and the possibility of column projection to limit the amount of data scanned. However, index creation for JSON and CSV files requires schema inference that results in extra passes on the input data. To avoid extra passes on the data, create a table in the catalog for the respective data to provide the required schema information.

### Describing an index
{: #describing_index}

To retrieve data skipping index statistics and metadata, use the `DESCRIBE` operation, as in the following example:

```sql
DESCRIBE METAINDEX
ON cos://us-geo/sql/metergen STORED AS parquet
```

The result includes how many objects were indexed, whether the index is up to date, the base location of the indexes, and the
index types that were generated.

### Using data skipping indexes
{: #using_ds_indexes}

When you create a data skipping index, {{site.data.keyword.sqlquery_short}} automatically uses it when it runs queries.
The UI shows the percentage of skipped objects. You also find examples in the UI of queries that benefit from data skipping.

### Geospatial data skipping
{: #geospatial_ds}

Data skipping is supported for queries that use [geospatial functions](https://www.ibm.com/support/knowledgecenter/en/SSCJDQ/com.ibm.swg.im.dashdb.analytics.doc/doc/geo_functions.html).

The following list shows supported geospatial functions:

- ST_Distance
- ST_Intersects
- ST_Contains
- ST_Equals
- ST_Crosses
- ST_Touches
- ST_Within
- ST_Overlaps
- ST_EnvelopesIntersect
- ST_IntersectsInterior

#### Geospatial data skipping with MinMax indexes
{: #geospatial_minmax}

You can use MinMax indexes on latitude and longitude columns for data skipping. 
In the following example, the MinMax indexes on the `lat` and `lng` columns are used. The following query retrieves all of the points in 1 km around the point POINT(6.433881 43.422323).

```sql
SELECT * FROM cos://us-geo/sql/metergen STORED AS PARQUET WHERE
ST_Distance(ST_Point(lng,lat),ST_WKTToSQL('POINT(6.433881 43.422323)')) < 1000.0
```

#### Geospatial data skipping with geospatial indexes
{: #geospatial_ds_geospatial_indexes}

Geospatial indexes on columns with geometry types can also be used for data skipping. For example, the following statement creates a geospatial index. The hospitals data set is available as a {{site.data.keyword.sqlquery_short}} sample and contains a geometry type column called “location”. Geometry type columns can be created by using the Geospatial Toolkit.

```sql
CREATE METAINDEX
GEOSPATIAL FOR location
ON cos://us-geo/sql/hospitals_geometry.parquet STORED AS parquet
```

The following example query that uses this index returns the names of those hospitals that are within a radius of 46800 meters of a specified coordinate.

```sql
SELECT name
FROM cos://us-geo/sql/hospitals_geometry.parquet STORED AS PARQUET
WHERE ST_Intersects(ST_WKTToSQL(location), ST_Buffer(ST_WKTToSQL('POINT (-74.0 42.0)'), 46800.0))
```

### Choosing data formats
{: #choosing_data_formats}

You can use data skipping with all of the formats that are supported by {{site.data.keyword.sqlquery_short}}, except for AVRO. It is best for data layout to use a column-based format, such as Parquet. To infer the schema for CSV and JSON, before you run any queries, the entire data set must first be scanned. Scanning the entire data set is not necessary if you create tables by using the {{site.data.keyword.sqlquery_short}} [catalog](/docs/services/sql-query?topic=sql-query-hivemetastore). Unlike Parquet and ORC, CSV and JSON do not have built-in data skipping capabilities and can potentially benefit more from data skipping.

### Refreshing data skipping indexes
{: #refreshing_ds}

If data is added to a data set, or if modifications are made to a data set after the creation of a data skipping index, the new or changed data is not skipped during queries. When the amount of new data becomes significant, refresh the index incrementally, as follows:

```sql
REFRESH METAINDEX
ON cos://us-geo/sql/metergen STORED AS parquet
```

### Showing data skipping indexes
{: #showing_ds_indexes}

To retrieve existing data skipping indexes under the currently configured metadata base location, use the SHOW operation, as in the following example:

```sql
SHOW METAINDEXES
```

The result includes the currently set metadata base location and a list of indexed data sets.

If you see `DEPRECATED_SUPPORTED` in front of the index, it means that the metadata version is deprecated but supported and skipping works. The next `REFRESH` updates the metadata automatically.
{: note}

### Deleting data skipping indexes
{: #deleting_ds}

To delete a data skipping index, use the following query:

```sql
DROP METAINDEX
ON cos://us-geo/sql/metergen STORED AS parquet

```

Dropping a table does not also drop the table indexes.

## Data skipping on catalog tables
{: #ds_catalog}

Data skipping also supports indexing and skipping on [catalog tables](/docs/services/sql-query?topic=sql-query-hivemetastore). How the index is created differs for partitioned and nonpartitioned tables.

For nonpartitioned tables, indexing must be done by using the [Cloud {{site.data.keyword.cos_short}} URI](/docs/sql-query?topic=sql-query-sql-reference#COSURI). In this case, the same metadata is used whether a query accesses the table by name or by physical location by using the Cloud {{site.data.keyword.cos_short}} URI.

For [partitioned tables](/docs/sql-query?topic=sql-query-hivemetastore#partitioned), indexes that are created in the Cloud {{site.data.keyword.cos_short}} URI are not used when you access a table by name. Instead, all preceding command and query examples must be rewritten by replacing the Cloud {{site.data.keyword.cos_short}} URI with the table name, by using the ON TABLE clause. For example, for the preceding CREATE INDEX statement, to index a table named `metergen` use the following syntax:

```sql
CREATE METAINDEX
MINMAX FOR temp,
MINMAX FOR lat,
MINMAX FOR lng,
BLOOMFILTER FOR vid,
VALUELIST FOR city
ON TABLE metergen
```

Refer to the [SQL reference](/docs/services/sql-query?topic=sql-query-sql-reference) for the full list of query statements and commands.

For partitioned tables, by default, the metadata is saved under the base location you defined. However, if you want to set a custom location for the metadata, use the following command:

```sql
ALTER TABLE metergen SET METAINDEX LOCATION <target-location>
```

If the metadata exists in the location that was set, no indexing is needed.
If the index does not exist and you run this command before you run the CREATE INDEX query, the index is stored under the configured location, instead of the base location.

The location of the metadata for a table is saved in the table properties under the parameter *spark.ibm.metaindex.parquet.mdlocation*.
If this parameter does not exist, a fallback to the base location is in place. Automatic indexing updates the table parameter with the index location.

To remove the parameter from the table, use the following command:

```sql
ALTER TABLE metergen DROP METAINDEX LOCATION
```

### Notes
{: #notes_ds}

The metadata for a partitioned table must be different from the metadata on the physical location (the location that was defined in the LOCATION clause of the CREATE TABLE query) because the table can contain partitions that are not located under the physical location. Therefore, depending on what data skipping metadata was generated for each case, you can get different results by using the table name than by using the Cloud {{site.data.keyword.cos_short}} URI. 

## Limitations
{: #limitations_ds}

- Data skipping sometimes does not work if type *casting* is used in the `WHERE` clause. For example, given a MinMax index on a column with a short data type, the following query does not benefit from data skipping:

    ```sql
    select * from table where shortType > 1
    ```

    Apache Spark evaluates the query as `(cast(shortType#3 as int) > 1)` because the constant 1 is of type *integer*.

    In some cases, Apache Spark automatically casts the literal to the right type. For example, the previous query works for all other numerical types, except for the byte type, as it requires casting, as well. To benefit from data skipping in such cases, ensure that the literal has the same type as the column type, as in the following example:

    ```sql
    select * from table where shortType > cast(1 as short)
    ```
  
- Concurrent `CREATE`/`REFRESH` operations are not supported.
- Indexing nested geospatial field is not supported.
- With the Lite plan, data skipping features, such as `CREATE METAINDEX`, are not allowed.


## References
{: #references_ds}

- [Data skipping for {{site.data.keyword.sqlquery_short}}](https://www.ibm.com/cloud/blog/data-skipping-for-ibm-cloud-sql-query).
- [Data skipping demo at Think 2019](https://www.ibm.com/cloud/blog/ibm-cloud-sql-query-at-think-2019) for the [Danaos use case](https://www.danaos.com/home/default.aspx) of [BigDataStack](https://bigdatastack.eu/?utm_source=IBM-Ta-Shma).
- [How to lay out Big Data in IBM Cloud Object Storage for Spark SQL](https://www.ibm.com/cloud/blog/big-data-layout).
- [Querying Geospatial Data by using {{site.data.keyword.sqlquery_short}}](https://www.ibm.com/cloud/blog/querying-geospatial-data-using-ibm-sql-query).
