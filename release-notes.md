---

copyright:
  years: 2018, 2023
lastupdated: "2023-06-20"

keywords: sql query, data engine, release notes

subcollection: sql-query

content-type: release-note

---

{{site.data.keyword.attribute-definition-list}}

# Release notes for {{site.data.keyword.sqlquery_short}}
{: #sql-query-relnotes}

Use these release notes to learn about the latest {{site.data.keyword.sqlquery_full}} that are grouped by date. Release notes are available for a minimum of three years.
{: shortdesc}

## June 2023
{: #sql-query-jun2023}
{: release-note}

Store passwords and API keys in {{site.data.keyword.secrets-manager_full}}
: You can now store passwords and API keys as secrets in {{site.data.keyword.secrets-manager_short}}. 

## March 2023
{: #sql-query-mar2023}
{: release-note}

Dark mode available in the {{site.data.keyword.sqlquery_short}} UI
: The {{site.data.keyword.sqlquery_short}} UI follows your system theme. You can also choose your theme directly in the profile menu.

## January 2023
{: #sql-query-jan2023}
{: release-note}

Create a new instance with Terraform
: Detailed [documentation](/docs/sql-query?topic=sql-query-terraform) is now available on how to create new {{site.data.keyword.sqlquery_short}} instances with Terraform.

## November 2022
{: #sql-query-nov2022}
{: release-note}

Read as text
: Files with an unstable schema, for example logs, can be read faster by using `STORED AS TEXT`. There is no schema inference and values must further be extracted, as explained in [Query data with an unstable schema](/docs/sql-query?topic=sql-query-overview#query-logs).

## August 2022
{: #sql-query-aug2022}
{: release-note}

Support for BYOK encryption for table metadata
: Table metadata for tables that are created after 23 August 2022 that is associated with an instance that uses BYOK get encrypted by using {{site.data.keyword.keymanagementservicefull}}. See [Securing your data in Data Engine](/docs/sql-query?topic=sql-query-securing-data#data-storage)

Chennai deprecation
: You cannot create new instances in the Chennai region anymore. Existing instances still work but will be fully deprecated on 31 October.

## May 2022
{: #sql-query-may2022}
{: release-note}

Rebranding
: IBM Cloud SQL Query was rebranded to {{site.data.keyword.sqlquery_notm}}.

Hive
:   {{site.data.keyword.sqlquery_short}} provides an external [Hive metastore (HMS) service](/docs/sql-query?topic=sql-query-hive_metastore).  

## November 2021
{: #sql-query-november2021}
{: release-note}

Add columns to Catalog tables
:   You can add columns to existing Catalog tables with the newly supported `ALTER TABLE ... ADD COLUMNS` statement.

## July 2021
{: #sql-query-july2021}
{: release-note}

Stream landing tutorial
:   A detailed [getting started tutorial](https://www.ibm.com/cloud/blog/stream-landing-from-event-streams-kafka-service-to-ibm-cloud-data-lake-on-object-storage) 
for stream landing with {{site.data.keyword.sqlquery_short}} is now available.

New region for stream landing
:   The stream landing capability is now also available in Frankfurt, in addition to Dallas.

## June 2021
{: #sql-query-june2021}

Stream landing support
:   {{site.data.keyword.sqlquery_short}} now supports stream landing that enables you to stream your data in real time from a topic to a bucket of your choice. 
This capability enables efficient analytics on the new objects created.

Connect to data lakes with {{site.data.keyword.cpd_short}}
:   {{site.data.keyword.cpd_full}} now comes with an integrated connector to {{site.data.keyword.sqlquery_short}} that allows to connect to cloud data lakes 
and import data assets into projects and catalogs in {{site.data.keyword.cpd_short}}. For more information, see [Connecting to a Cloud Data Lake with IBM Cloud Pak for Data](https://www.ibm.com/cloud/blog/connecting-to-a-cloud-data-lake-with-ibm-cloud-pak-for-data).

## December 2020
{: #sql-query-december2020}
{: release-note}

Supported regions
:   {{site.data.keyword.sqlquery_short}} is available in Chennai, India. When you provision new instances, you can select whether it is being provisioned in Dallas, Frankfurt, or Chennai.

{{site.data.keyword.cos_full_notm}}
:   {{site.data.keyword.cos_full_notm}} web console discovers SQL-queryable objects and folders and directly starts the {{site.data.keyword.sqlquery_short}} web console with a prefilled SQL statement for seamless interactive data exploration.

## November 2020
{: #sql-query-november2020}
{: release-note}

Modify location of Hive partitions
:   The location of Hive partitions can be modified by using the [`ALTER TABLE SET LOCATION`](/docs/sql-query?topic=sql-query-sql-reference#chapterAlterTableSetLocation) feature.

## October 2020
{: #sql-query-october2020}
{: release-note}

Index management
:   {{site.data.keyword.sqlquery_short}} index management, also referred to as data skipping is generally available with full production support.

New samples category *Reference data statement*
:   {{site.data.keyword.sqlquery_full}} comes with open data out of the box, including geolocation, and demographic data that can be used as reference data to combine with your own data sets. It is based on open data from US Census, Eurostat Census, UNdata, OpenStreetMap, and Natural Earth. Explore it by using the new category **Reference data statements** in SAMPLES.

Time series functions
:   {{site.data.keyword.sqlquery_short}} time series functions: The anchor functions are deprecated and replaced by the new and more powerful expression creation functions.

Python SDK
:   The [ibmcloudsql](https://pypi.org/project/ibmcloudsql) Python SDK significantly expanded in functionality for even more powerful Python analytics with SQL. Take a tour of the functions in the [{{site.data.keyword.sqlquery_short}} Starter Notebook](https://dataplatform.cloud.ibm.com/exchange/public/entry/view/e82c765fd1165439caccfc4ce8579a25?context=cpdaas). The Python SDK also comes with a dedicated [online documentation](https://ibm-cloud.github.io/sql-query-clients/intro.html#ibmcloudsql).

Usage of legacy SoftLayer endpoints discontinued
:   The usage of the legacy SoftLayer endpoints of Cloud {{site.data.keyword.cos_full_notm}} is discontinued. Check out the [Cloud Object Storage announcement](https://cloud.ibm.com/status?component=cloud-object-storage&location=global&selected=announcement&query=2020+Actions) for more details.

## September 2020
{: #sql-query-september2020}
{: release-note}

Use JDBC to connect to business intelligence tools
:   You can use our JDBC driver to connect {{site.data.keyword.sqlquery_short}} to business intelligence tools and other applications. To download and configure the driver, see the [JDBC documentation](/docs/sql-query?topic=sql-query-jdbc).

Monitoring with Sysdig
:   {{site.data.keyword.sqlquery_short}} supports monitoring metrics for submitted jobs by using [{{site.data.keyword.mon_full}}](https://cloud.ibm.com/docs/Monitoring-with-Sysdig?topic=Monitoring-with-Sysdig-getting-started). You can view completed and failed jobs, the number of bytes processed, and the jobs in progress. A default {{site.data.keyword.sqlquery_short}} dashboard exists, and you can define custom dashboards and alerts.

## May 2020
{: #sql-query-may2020}
{: release-note}

Index management
:   {{site.data.keyword.sqlquery_short}} supports index management, also referred to as data skipping. Index management can significantly boost performance and reduce cost of your SQL queries by skipping over irrelevant data.
:   Service access role **Manager** is required to run catalog management or index management commands.

Catalog management
:   {{site.data.keyword.sqlquery_short}} database catalog support is extended to support [views](/docs/sql-query?topic=sql-query-sql-reference#chapterCreateView).
:   {{site.data.keyword.sqlquery_short}} catalog management is out of the Beta stage and can be used with the Standard plan.

## April 2020
{: #sql-query-april2020}
{: release-note}

Database catalog
:   {{site.data.keyword.sqlquery_short}} support for [database catalog](/docs/services/sql-query?topic=sql-query-hivemetastore) is generally available with full production support. The database catalog is based on Hive Metastore and significantly speeds up query execution and decouples data management from SQL users and applications.

## January 2020
{: #sql-query-january2020}
{: release-note}

Support for all endpoints
:   {{site.data.keyword.sqlquery_short}} fully supports all current public and private {{site.data.keyword.cos_full}} endpoints (ending with `appdomain.cloud`, for example, `s3.us.cloud-object-storage.appdomain.cloud`) and all new single data center endpoints (for example, `sng01`).

## December 2019
{: #sql-query-december2019}
{: release-note}

{{site.data.keyword.keymanagementserviceshort}}
:   You can use [{{site.data.keyword.keymanagementserviceshort}}](https://cloud.ibm.com/catalog/services/key-protect) as a secure credential broker to pass credentials to data resources referenced by your queries, thus ensuring safe handling of your secrets. For more information, see the [authentication documentation](/docs/sql-query?topic=sql-query-authentication).

## November 2019
{: #sql-query-november2019}
{: release-note}

`MULTILINE` option
:   You can specify a [`MULTILINE`](/docs/sql-query?topic=sql-query-sql-reference#externalTableSpec) option for JSON input data if individual JSON records are stored across multiple lines.

## October 2019
{: #sql-query-october2019}
{: release-note}

New open source script for uploading large volumes
:   The new open source [cos-upload](https://github.com/IBM-Cloud/data-lake/tree/master/upload/cos-upload) script can be used to efficiently upload large volumes of data to {{site.data.keyword.cos_full_notm}} buckets with Aspera by merely providing an IAM API Key.

JSON parser
:   {{site.data.keyword.sqlquery_short}} JSON parser is processing and extracting all JSON keys in lowercase, so it can work correctly on LogDNA data.

Run automatic SQL-based post processing
:   Storing new objects in {{site.data.keyword.cos_full_notm}} can trigger {{site.data.keyword.sqlquery_short}} executions. It is enabled by the {{site.data.keyword.cos_full_notm}} [event provider](https://www.ibm.com/cloud/blog/announcements/cloud-object-storage-event-provider-enables-hello-serverless-and-more) for {{site.data.keyword.openwhisk}}. By combining it with the SQL [{{site.data.keyword.openwhisk_short}}](https://hub.docker.com/r/ibmfunctions/sqlquery/), you can automatically run SQL-based post processing for new objects.

Query hints
:   {{site.data.keyword.sqlquery_short}} has query hints for SQL queries that have potential for faster execution by using certain features of {{site.data.keyword.sqlquery_short}}. These hints are flagged with a light bulb icon in the job list and the specific hint is available inside the Details pane.

## September 2019
{: #sql-query-september2019}
{: release-note}

Support for ETL to {{site.data.keyword.Db2_on_Cloud_long}}
:   You can specify [Db2 target tables](/docs/sql-query?topic=sql-query-overview#unique) in your SQL queries to process data from {{site.data.keyword.cos_full_notm}} and save the {{site.data.keyword.sqlquery_short}} result into {{site.data.keyword.Db2_on_Cloud_short}}.

## August 2019
{: #sql-query-august2019}
{: release-note}

Support for `DESCRIBE` table transformation function
:   Support for the [`DESCRIBE`](/docs/sql-query?topic=sql-query-sql-reference#tableTransformer) table transformation function that enables easier exploration of the schema of data by returning the schema definition instead of data as the table content. Check out the new Starter Query sample in the UI.

## July 2019
{: #sql-query-july2019}
{: release-note}

JSON preview
:   You can directly preview query results in JSON format in the SQL console. Add `INTO <COS URI> STORED AS JSON` to your SQL statement to produce JSON output and preview it in the web console.

Support for Parquet schema evolution
:   Support for Parquet schema evolution through the [`MERGE SCHEMA`](/docs/sql-query?topic=sql-query-sql-reference#externalTableSpec) sub clause for `STORED AS PARQUET` input data. Check out the new samples in the UI.

New table transformation functions
:   Support for [`CLEANCOLS`](/docs/sql-query?topic=sql-query-sql-reference#tableTransformer) table transformation function that generically cleanses all input column names from characters that are not supported by the Parquet target format. Check out the new Samples.
:   Support for [`FLATTEN`](/docs/sql-query?topic=sql-query-sql-reference#tableTransformer) table transformation function that generically flattens all nested input columns into a flat hierarchy, allowing to easily work with, for example, JSON input data and write the results out to flat CSV files. Check out the new samples in the UI.

## June 2019
{: #sql-query-june2019}
{: release-note}

{{site.data.keyword.sqlquery_short}} now available in Frankfurt
:   {{site.data.keyword.sqlquery_short}} is available in Frankfurt, Germany. When you provision new instances, you can select whether it is being provisioned in Dallas or in Frankfurt.

Support for time series SQL functions
:   Support for [time series SQL functions](/docs/services/sql-query?topic=sql-query-ts_intro) to process time series data, for example, to identify trends and to predict future values based on these trends.

## May 2019
{: #sql-query-may2019}
{: release-note}

Updates to the [SQL reference](/docs/services/sql-query?topic=sql-query-sql-reference)
:   [`JOBPREFIX JOBID/NONE`](/docs/sql-query?topic=sql-query-sql-reference#cosResultClause), you can specify whether you want the job ID to be appended to the target prefix, or not.
:   The [`SORT BY`](/docs/sql-query?topic=sql-query-sql-reference#sortClause) clause for SQL targets is new. You can use it to sort SQL result sets in many ways before you write the results to {{site.data.keyword.cos_full_notm}}. It can be used in combination with [`PARTITIONED BY`](/docs/sql-query?topic=sql-query-sql-reference#partitionedClause), [`PARTITIONED INTO`](/docs/sql-query?topic=sql-query-sql-reference#partitionedClause) (to cluster the results), or without the PARTITIONED clause.
:   [`PARTITIONED INTO BUCKETS`](/docs/sql-query?topic=sql-query-sql-reference#partitionedClause) and [`PARTITIONED INTO OBJECTS`](/docs/sql-query?topic=sql-query-sql-reference#partitionedClause) are both supported, thus you can use them synonymously.

## April 2019
{: #sql-query-april2019}
{: release-note}

Support for encryption with {{site.data.keyword.keymanagementservicefull}}
:   Support for encrypting SQL queries with {{site.data.keyword.keymanagementservicelong_notm}}. {{site.data.keyword.keymanagementservicelong_notm}} is a centralized key management system (KMS) for generating, managing, and destroying encryption keys used by {{site.data.keyword.Bluemix}} services. If you are processing sensitive data in your queries, you can use customer-managed keys to encrypt SQL query texts and error messages that are stored in the job information.
:   {{site.data.keyword.sqlquery_notm}} with {{site.data.keyword.keymanagementservicelong_notm}} for managing encryption keys meets the required IBM controls that are commensurate with the Health Insurance Portability and Accountability Act of 1996 (HIPAA) Security and Privacy Rule requirements.

## February 2019
{: #sql-query-february2019}
{: release-note}

Beta support for JDBC driver
:   Beta support for JDBC driver of {{site.data.keyword.sqlquery_short}}. Request to participate by sending an email to Joshua.Mintz@ibm.com.

Beta support for data skipping
:   Beta support for data skipping indexes. You can create custom indexes on any column for minimum and maximum values, list of values, and geospatial bounding box for any object queried. This significantly reduces I/O and query cost and lower the query execution time.

Beta support for time series
:   Beta support for SQL-native time series in {{site.data.keyword.sqlquery_short}}. This includes functions for time series segmentation, prediction, alignment, temporal joins, and subsequence mining. Request to participate by sending an email to  Joshua.Mintz@ibm.com.

## December 2018
{: #sql-query-december2018}
{: release-note}

New SQl reference guide
:   Release of a complete SQL Reference Guide, an SQL introduction for Cloud SQL/Spark SQL. [The new reference guide](/docs/sql-query?topic=sql-query-sql-reference) includes examples that can be copied and directly pasted into the web UI to be run.

## November 2018
{: #sql-query-november2018}
{: release-note}

Support for hive-style partitioning
:   Support for controlling the layout of SQL results. Including support for creating hive-style partitioning and paginated result data.

Support for Python SDK extensions
:   Support for extensions in [Python SDK](https://pypi.org/project/ibmcloudsql) for result data partitioning, pagination, and exporting SQL job history to {{site.data.keyword.cos_full_notm}}.

## October 2018
{: #sql-query-october2018}
{: release-note}

Control your result's format
:   Support for SELECT INTO to control the format the SQL result is written in.

## August 2018
{: #sql-query-august2018}
{: release-note}

General availability
:   {{site.data.keyword.sqlquery_notm}} is generally available. Its open beta phase ended.

New built-in functions
:   Support for [new built-in SQL functions](https://issues.apache.org/jira/browse/SPARK-20746) released with Apache Spark 2.3.
:   Set of SQL optimizer and ANSI SQL and Hive SQL compliance enhancements that are introduced with Apache Spark 2.3.

## June 2018
{: #sql-query-june2018}
{: release-note}

ORC
:   Support for ORC data (STORED AS ORC).

Geospatial functions
:   Support for geospatial SQL functions for calculations, aggregations, and joins on location data.

ibmcloudsql Node.js client SDK
:   Release of [ibmcloudsql Node.js client SDK](https://www.npmjs.com/package/ibmcloudsql).

## April 2018
{: #sql-query-april2018}
{: release-note}

Introducing {{site.data.keyword.sqlquery_notm}}
:   [{{site.data.keyword.sqlquery_notm}} release beta](https://www.ibm.com/cloud/blog/analyzing-data-with-ibm-cloud-sql-query?mhsrc=ibmsearch_a&mhq=ibm%20sql%20query).

