---

copyright:
  years: 2023
lastupdated: "2023-12-14"

keywords: reading, writing, cos

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Reading and writing Cloud {{site.data.keyword.cos_short}}
{: #reading}

## Table unique resource identifier
{: #unique}

{{site.data.keyword.sqlquery_full}} is deprecated. As of 18 February 2024 you can't create new instances, and access to free instances will be removed. Existing Standard plan instances are supported until 18 January 2025. Any instances that still exist on that date will be deleted.
{: deprecated}

Different types of table unique resource identifiers exist, depending on the type of target service used. You can either specify Cloud {{site.data.keyword.cos_short}} locations or database locations. The latter is only supported for target locations of an SQL query, and only for {{site.data.keyword.Db2_on_Cloud_long}} and {{site.data.keyword.dashdblong}} database services.

### Cloud Object Storage locations
{: #cos-location}

This identifier points to a location on Cloud {{site.data.keyword.cos_short}} with a URI format. The access to this Cloud {{site.data.keyword.cos_short}} bucket is given through the {{site.data.keyword.iamlong}} (IAM) identity of the user that submitted the SQL statement to {{site.data.keyword.sqlquery_short}}. So, make sure that the user's IAM identity has the necessary access rights that are granted on the Cloud {{site.data.keyword.cos_short}} bucket.

The identifier has the following form:

&nbsp;&nbsp;**`cos://<endpoint>/<bucket>/<path>`**

Where:

**`<endpoint>`**
The [endpoint](#endpoints) of your Cloud {{site.data.keyword.cos_short}} instance or its [alias](#endpoints).

**`<bucket>`**
The bucket name:
- For an input URI, the bucket that contains the input object or objects.
- For an output URI, the bucket to which the output objects are to be written.

**`<path>`**
A more exact specification of the object or objects:

- The specified path is interpreted in a similar way as listing file system contents with `ls`, interpreting slashes `/` in object names as a folder hierarchy.

    - If the path is identical to the name of an existing (nonempty) object, it matches only that single object.
    - If the path is a prefix of multiple objects at a slash `/` character, it matches all those objects that are not empty. For example, the path `mydir/test1` (or `mydir/test1/`) matches objects `mydir/test1/object1`, `mydir/test1/nested/object2`, but not `mydir/test100`.
    - The usage of a * wildcard depends on how the object structure was created:
          - If the object structure was created as Hive-partitioned structure, for example as {{site.data.keyword.sqlquery_short}} result output, and the result objects are starting with the prefix `part-`, wildcards are not supported. Using SQL constructs based on the Hive structure is always the preferred method to restrict the number of objects to be read during query processing.
	   - If the object structure was created as Hive-partitioned structure, but by using arbitrary file names, the usage of wildcards is supported. The wildcard matches all objects with the indicated path prefix. For example, `mydir/test1*`, matches objects `mydir/test100`, and `mydir/test101/nested/object`.

- For an output URI, it is the prefix under which the [result objects](#result) are to be written.

### Composite input tables
{: #compositeInput}

As noted previously, the URI for an input table on Cloud {{site.data.keyword.cos_short}} can match multiple objects, forming a "composite" input table. When you run a query over composite input, ensure that the schema of each matching object is appropriate within the context of the SELECT statement. The schemas of the objects do not need to be identical; depending on the input format, the schemas of multiple objects can be merged:
- For CSV format, columns are matched based on their *order*. Some input objects can contain more columns than others, but common columns must always use the same order across objects. The number of columns in the composite input is the maximum number of columns from all matched objects.
- For JSON and Parquet format, columns are matched based on their *name*. The set of columns in the composite input is the union of all column names from matched objects. For Parquet format, you must use the `MERGE SCHEMA` option of the [`STORED AS`](/docs/sql-query?topic=sql-query-sql-reference#externalTableSpec) clause to indicate that schema merging is to be performed.
- Input schema merging is not supported for AVRO and ORC formats. The first object determines the set of columns in the composite input, all columns that do not occur in the first object are ignored. The same behavior applies to Parquet, if the `MERGE SCHEMA` option is not specified.

Matching columns must have compatible data types across all objects where they appear. If a column does not appear in some of the input objects, it is padded with NULL values in the composite input.

## Object result set
{: #result}

By default, the following three objects are written to Cloud {{site.data.keyword.cos_short}} as a result set per job:

1. `<target>/jobid=<job_id>`
2. `<target>/jobid=<job_id>/_SUCCESS`
3. `<target>/jobid=<job_id>/<part-number>`

Only the last object contains the result set. The other two objects are empty and don't contain any data. It is important not to delete any of the objects if you want to use the result set for subsequent queries. By default, the object names include the job ID. For example, if you specify `mydir/out` or `mydir/out/` as the target directory, the result objects are written under `mydir/out/jobid=<job_id>`. So, when a query is run multiple times, the result set is not overwritten. You can change this behavior with the [`JOBPREFIX`](/docs/sql-query?topic=sql-query-sql-reference#cosResultClause) option of the `INTO` clause.

You can use the result set from one query as input data for further SQL queries.
If you want to specify a result of a single query execution as input in your SQL query, specify the first (`<target>/jobid=<job_id>`) or the third one (`<target>/jobid=<job_id>/<part-number>`). You can also use the [partitioning clause](/docs/sql-query?topic=sql-query-sql-reference#partitionedClause) to split the result set into multiple objects. Either the entire result set or individual objects can then serve as input for further queries.

A query can even process the output of multiple previous query executions by omitting the `jobid=<job_id>` part in the object name. For example, you can run some setup queries writing to `cos://us-geo/my-bucket/tempstore`, where each query creates new objects inside that prefix with a distinct `jobid=<job_id>` name. You can then run an aggregate query over all of the setup results by using `cos://us-geo/my-bucket/tempstore` as a [composite input table](#compositeInput). The aggregate query treats `jobid` as if it were a column in the input table (for example, in a WHERE clause). This concept is the Hive-style partitioning concept that Hadoop SQL engines employ for data that is stored in Hadoop Distributed File System (HDFS).

If you want to run a query over the combined results of multiple previous queries, ensure that these have compatible outputs so that their schemas can be merged. For more information, see the section on [composite input tables](#compositeInput). To make this work properly for CSV format, all setup queries must use the same column names and sequence in their `SELECT` clause, so the results have compatible schemas. If you later need to introduce new columns in extra setup queries, add these columns to the end of the column list. If not, the structure of the composite `tempstore` data set gets corrupted, causing unreadable objects, corrupted data, or unreliable results.

## Cloud {{site.data.keyword.cos_short}} endpoints
{: #endpoints}

Your Cloud {{site.data.keyword.cos_short}} instance has one of the supported endpoints. {{site.data.keyword.sqlquery_short}} supports all [public and private {{site.data.keyword.cos_short}} endpoints](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-endpoints). To save space, you can use the alias that is shown instead of the full endpoint name.

Aliases to tethering endpoints (specific endpoints within cross region domains, for example, `dal-us-geo`) are considered legacy. They continue to work until further notice but are planned to be deprecated sometime in the future. To be prepared, update your applications to use the alias of the corresponding cross region endpoint (for example, `us-geo`).

{{site.data.keyword.sqlquery_short}} always uses the internal endpoint to interact with {{site.data.keyword.cos_short}}, even if an external endpoint was specified in the query. The result location for a query always indicates the external endpoint name. When you interact with {{site.data.keyword.sqlquery_short}} programmatically through the API, you can use the internal endpoint name to read results instead of the external endpoint name that is returned by the API.
{: note}

The following tables list some examples of currently supported {{site.data.keyword.sqlquery_short}} endpoints.

Cross region endpoint name | Alias
--- | ---
`s3.us.cloud-object-storage.appdomain.cloud` | `us-geo`
`s3.eu.cloud-object-storage.appdomain.cloud` | `eu-geo`
`s3.ap.cloud-object-storage.appdomain.cloud` | `ap-geo`
{: caption="Cross region endpoints" caption-side="bottom"}

Regional endpoint name | Alias
--- | ---
`s3.eu-de.cloud-object-storage.appdomain.cloud` | `eu-de`
`s3.eu-gb.cloud-object-storage.appdomain.cloud` | `eu-gb`
`s3.us-south.cloud-object-storage.appdomain.cloud | `us-south`
{: caption="Regional endpoints" caption-side="bottom"}

Single data center endpoint name | Alias
--- | ---
`s3.ams03.cloud-object-storage.appdomain.cloud` | `ams03`
`s3.mon01.cloud-object-storage.appdomain.cloud` | `mon01`
`s3.sng01.cloud-object-storage.appdomain.cloud` | `sng01`
{: caption="Single data center endpoints" caption-side="bottom"}

## Availability zones
{: #availability}

Regions | Availability zones
--- | ---
Dallas | 3
Frankfurt | 3
{: caption="Regions" caption-side="bottom"}

For Availability Service Level Agreements, see the [Cloud Services terms](https://cloud.ibm.com/docs/overview?topic=overview-slas).
