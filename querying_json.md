---

copyright:
  years: 2023
lastupdated: "2023-05-16"

keywords: json logs, stored as text

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Running a query
{: #running}

Watch the following video to learn more about {{site.data.keyword.sqlquery_short}} and how you can get started to run a basic query.

![{{site.data.keyword.sqlquery_notm}}: Run Queries from the Console](https://video.ibm.com/embed/channel/23952663/video/csq-run-queries){: video output="iframe" data-script="none" id="watsonmediaplayer" width="560" height="315" scrolling="no" allowfullscreen webkitallowfullscreen mozAllowFullScreen frameborder="0" style="border: 0 none transparent;"}

In SQL, the term *query* is just another way of saying *SELECT statement*. To run a query:

1. In the SQL editor field of the {{site.data.keyword.sqlquery_short}} UI, enter a SELECT statement.
    - After the FROM keyword, specify one or more [unique resource identifiers](#unique) (URIs). Each URI can be thought of as a table. It specifies one or more input objects; each input object can be thought of as a table partition. You must have at least 'Reader' access to the buckets that contain the input objects.
    - If the format of the input objects is CSV, and no special options are required, it is not necessary to specify a `STORED AS` clause. However, if the format is JSON, ORC, Parquet, or AVRO, after the `FROM` clause, specify STORED AS JSON, STORED AS ORC, STORED AS PARQUET, or STORED AS AVRO.
    - If text formats, such as JSON and CSV, are compressed with either gzip or bzip2 and have the extensions `*.gz` and `*.bz`, they automatically get recognized as compressed files. However, do not use these kinds of compressed files due to performance reasons.
    - If the format of the input objects is CSV and a delimiter other than the default `,` (comma) is used, you must specify the delimiter by using the `FIELDS TERMINATED BY` option of the [`STORED AS`](/docs/sql-query?topic=sql-query-sql-reference#externalTableSpec) clause. All single Unicode characters are allowed as delimiters.
    - By default, it is assumed that CSV input objects have a header line that specifies the names of the input columns. If the objects don't have a header line, you must specify `NOHEADER` in the [`STORED AS`](/docs/sql-query?topic=sql-query-sql-reference#externalTableSpec) clause.
    - By default, it is assumed that JSON input objects consist of a single JSON record per line. If individual records span multiple lines, you must specify `MULTILINE` in the [`STORED AS`](/docs/sql-query?topic=sql-query-sql-reference#externalTableSpec) clause.
    - If required, you can use `JOIN` constructs to join data from several input URIs, even if those URIs point to different instances of Cloud {{site.data.keyword.cos_short}}.
    - Use the `INTO` clause of a [query](/docs/sql-query?topic=sql-query-sql-reference#chapterSQLQueryStatement) to specify the output [URI](#unique), that is, the location to which the result is to be written and the wanted result format.

2. The **Target location** field displays where the result is stored. An initial bucket in one of your {{site.data.keyword.cos_short}} instances is automatically created for you when you open the UI. It is then chosen as your default location, if your query does not specify an `INTO` clause. To ensure the automatic setup of an initial bucket, do the following steps in advance:

    - You must create an {{site.data.keyword.cos_short}} instance.
    - You must have at least 'Writer' access to the corresponding {{site.data.keyword.cos_short}} bucket.

    In the *Details* tab of the selected job, you can set any location that you specified in the `INTO` clause as your default location.

3. Click **Run**.

    When the query completes, a preview of the query result is displayed in the query result tab of the UI. The preview function is only available for CSV and JSON result formats. You can run up to five queries simultaneously with a Standard plan instance of {{site.data.keyword.sqlquery_short}}.

## Sample queries
{: #sample}

What does a typical query look like? The following sample queries give you an idea to get you started:

### Example of a table exploration query
{: #exploration}

The following query selects all columns of a table and limits the result to 50 rows.
Use it to explore a particular table.

```sql
SELECT *
FROM cos://us-geo/sql/customers.csv STORED AS CSV
ORDER BY CustomerID
LIMIT 50
```

### Example of an exact target path specification
{: #path}

The following query writes an SQL result into an exact result path. Normally, {{site.data.keyword.sqlquery_short}} always appends `jobid=<jobid>` to the provided target path to ensure a unique result location with each query execution. However, in the following sample query, this suffix is eliminated by adding JOBPREFIX NONE to the path in the INTO clause. Note: This action overwrites all objects that are currently stored in the provided result path.

```sql
SELECT *
FROM cos://us-geo/sql/employees.parquet STORED AS PARQUET
INTO cos://us-south/sql-7fb0b44d-2d76-4c5c-af1e-c746c84f9da1/result/employees.csv JOBPREFIX NONE
```

### Example of a self-join
{: #self-join}

The following query uses a simple self-join to list the employees that are located in the same city as Steven.

```sql
SELECT e1.firstname employee, e2.firstname colleague, e1.city
FROM cos://us-geo/sql/employees.parquet STORED AS PARQUET e1,
     cos://us-geo/sql/employees.parquet STORED AS PARQUET e2
WHERE e2.city = e1.city
      AND e1.employeeid <> e2.employeeid
      AND e1.firstname = 'Steven'
ORDER BY e1.city , e1.firstname
```

## Querying JSON logs
{: #query-json}

To query JSON data where no schema can be inferred, for example, in logs, use the option to read the data `AS TEXT`.
The input is then read without inferring any schema and each line is put into a single column named `value`.

To see how the data is structured, execute a basic select query.

```sql
SELECT *
FROM cos://us-geo/sql/LogDNA/_year=2019/_dayofyear=226/_hour=14 STORED AS TEXT
LIMIT 5
```

You can further extract fields by using the options `get_json_object` or `regexp_extract`.
You can then filter data on the extracted columns.

```sql
WITH logs (
  SELECT get_json_object(value, "$._source._host") as host,
  from_unixtime(get_json_object(value, "$._source._ts") / 1000, 'yyyy-MM-dd HH:mm:ss') as timestamp,
  get_json_object(value, "$._source._file") as file,
  get_json_object(value, "$._source.request_method") as request_method,
  get_json_object(value, "$._source.request_uri") as request_uri
  FROM cos://us-geo/sql/LogDNA/_year=2019/_dayofyear=226/_hour=14 STORED AS TEXT
)
SELECT *
FROM logs
WHERE request_uri LIKE "/iae_instances/%"
ORDER BY timestamp
```

To get the logs for a specific timeframe, use the following query.

```sql
WITH logs (
  SELECT get_json_object(value, "$._source._host") as host,
  get_json_object(value, "$._source._ts") / 1000 as unix_timestamp,
  from_unixtime(get_json_object(value, "$._source._ts") / 1000, 'yyyy-MM-dd HH:mm:ss') as timestamp,
  get_json_object(value, "$._source._file") as file,
  get_json_object(value, "$._source.request_method") as request_method,
  get_json_object(value, "$._source.request_uri") as request_uri
  FROM cos://us-geo/sql/LogDNA/_year=2019/_dayofyear=226/_hour=13 STORED AS TEXT
)
SELECT *
FROM logs
WHERE minute(from_unixtime(unix_timestamp)) >= 40 AND minute(from_unixtime(unix_timestamp)) <= 44
ORDER BY timestamp
```
