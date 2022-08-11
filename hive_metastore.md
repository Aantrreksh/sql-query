---

copyright:
  years: 2022
lastupdated: "2022-05-09"

keywords: Data Engine, SQL query, Hive, metastore, catalog

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}
{:beta: .beta}

# Connecting Apache Spark to {{site.data.keyword.sqlquery_short}}
{: #hive_metastore}
{: beta}

{{site.data.keyword.sqlquery_full}} catalog provides an interface that is compatible with Apache Hive metastore. This unified metadata repository enables any Big Data engine, such as Apache Spark, to use {{site.data.keyword.sqlquery_short}} as metastore. The same definition for tables and views can be created once and used from any connected engine. Each instance of {{site.data.keyword.sqlquery_short}} exports its catalog as a database named *default*.
{: beta}


## Catalog usage within {{site.data.keyword.sqlquery_short}}
{: #internal_usage}

Catalog can be used in {{site.data.keyword.sqlquery_short}} in read and write mode. Seamless access is configured without any configuration steps needed.

## Connecting Apache Spark with {{site.data.keyword.sqlquery_short}}
{: #external_usage}

When using the hive metastore compatible interface, access is limited to read only operations. This means that existing tables and views can be used, but not modified.

In order to connect to your catalog, download the files from the following links:

### Apache Hive metastore version 3.1.2 compatible client
{: #hive_compatible_client}

Download the [Hive-compatible client](https://us.sql-query.cloud.ibm.com/download/catalog/hive-metastore-standalone-client-3.1.2-sqlquery.jar) and place it in a directory of your Apache Spark cluster that is not on the classpath. This step is necessary, as the client is loaded into an isolated classloader to avoid version conflicts.
Note that in the examples the files are placed in `/tmp/dataengine`, when you use a different folder, adjust the example accordingly.

The client differs from the Hive version 3.1.2 release by additional enhancements that add support for TLS and authentication through {{site.data.keyword.iamlong}}.
For *user*, specify the CRN and for *password* a valid API key with access to your {{site.data.keyword.sqlquery_short}}. Find the endpoint to use in the following table.

| Region | Endpoint |
|--------|----------|
| us-south | thrift://catalog.us.dataengine.cloud.ibm.com:9083 |
| eu-de | thrift://catalog.eu-de.dataengine.cloud.ibm.com:9083 |
| in-che | thrift://catalog.in-che.dataengine.cloud.ibm.com:9083 |

### Usage within {{site.data.keyword.DSX}} notebooks
{: #usage_watson_notebooks}

The required JAR/Wheel files are not available in the Spark environment used by {{site.data.keyword.DSX_full}}. Therefore, transfer them into the existing Spark environment first.

Use the following cell to transfer the files:

```sql
!mkdir /tmp/dataengine
!wget https://us.sql-query.cloud.ibm.com/download/catalog/dataengine_spark-1.0.10-py3-none-any.whl -O /tmp/dataengine/dataengine_spark-1.0.10-py3-none-any.whl
# user-libs/spark2 is in the classpath of Spark
!wget https://us.sql-query.cloud.ibm.com/download/catalog/dataengine-spark-integration-1.0.10.jar -O user-libs/spark2/dataengine-spark-integration-1.0.10.jar
!wget https://us.sql-query.cloud.ibm.com/download/catalog/hive-metastore-standalone-client-3.1.2-sqlquery.jar -O  /tmp/dataengine/hive-metastore-standalone-client-3.1.2-sqlquery.jar

!pip install --force-reinstall /tmp/dataengine/dataengine_spark-1.0.10-py3-none-any.whl

print("Restart your kernel!")
```

After the cell is executed, restart the kernel to ensure that Spark loaded the jar. Set the required variables and call the helper functions:

```sql
# change the CRN and the APIkey according to your instance
crn='yourDataengineCRN'
apikey='yourAPIkey'

from dataengine import SparkSessionWithDataengine

# call the helper function
session_builder = SparkSessionWithDataengine.enableDataengine(crn, apikey, "public", "/tmp/dataengine")
spark = session_builder.appName("Spark DataEngine integration test").getOrCreate()

```

Display your tables and run an SQL statement:

```sql
spark.sql('show tables').show(truncate=False)

# replace yourTable with a valid table. Do not use the sample tables as you do not have access to the data!
spark.sql('select * from yourTable').show()
```

### Apache Spark Data Engine integration
{: #spark_data_engine_integration}

While the {{site.data.keyword.sqlquery_short}} catalog is compatible with the Hive metastore and can be used as any other external Hive metastore server, an SDK is provided to minimize the steps that are needed to configure Apache Spark. The SDK simplifies connecting to both, metastore and IBM Cloud Object storage, buckets referenced by tables or views.

Download both, the Scala and the Python SDK, and place them in a folder that is in the classpath of your Apache Spark cluster.

- [spark-dataengine-scala](https://us.sql-query.cloud.ibm.com/download/catalog/dataengine-spark-integration-1.0.10.jar)
- [spark-dataengine-python](https://us.sql-query.cloud.ibm.com/download/catalog/dataengine_spark-1.0.10-py3-none-any.whl)

Use the following examples to get started with {{site.data.keyword.iae_full}}(IAE) or Spark runtimes in {{site.data.keyword.dsx}}.

Submit the following Python application using a notebook or the `spark-submit` command:

```sql
import sys
from SparkSessionWithDataengine import SparkSessionWithDataengine

if __name__ == '__main__':
    crn = sys.argv[1]
    apikey = sys.argv[2]


    session_builder = SparkSessionWithDataengine.enableDataengine(crn, apikey, "public", "/tmp/dataengine")

    spark = session_builder.appName("Spark DataEngine integration") \
          .config("fs.cos.impl", "com.ibm.stocator.fs.ObjectStoreFileSystem") \
          .config("fs.stocator.scheme.list", "cos") \
          .config("fs.stocator.cos.impl", "com.ibm.stocator.fs.cos.COSAPIClient") \
          .getOrCreate()

    print("Dumping session config...")
    for conf in spark.sparkContext.getConf().getAll():
        key = conf[0]
        value = "***" if apikey == conf[1] else conf[1]
        print(key, value)
    print("Got a spark session, listing all tables")
    spark.sql('show tables').show()

    spark.stop()
```

If you use Scala, run the following application:

```sql
package com.ibm.cloud.dataengine

import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.SparkSession.{Builder => SessionBuilder}
import SparkSessionBuilderAddOn._

object SparkSessionBuilderHMSConfigTest {
  def main(args: Array[String]) = {
    val spark = SparkSession
      .builder()
      .appName("Spark DataEngine integration")
      .enableDataengine(args(0), args(1), "public")
      .config("fs.cos.impl", "com.ibm.stocator.fs.ObjectStoreFileSystem")
      .config("fs.stocator.scheme.list", "cos")
      .config("fs.stocator.cos.impl", "com.ibm.stocator.fs.cos.COSAPIClient")
      .config("fs.stocator.cos.scheme", "cos")
      .getOrCreate()
    println("Dumping session config...")
    val config = spark.sparkContext.getConf.getAll
    for (conf <- config)
      println(conf._1 +", "+ conf._2)
    println("Got a spark session, listing all tables")
    val sqlDF = spark.sql("SHOW TABLES")
    sqlDF.show()
  }
}
```

### Required settings for native Spark builder
{: #settings_native_spark}

For self-hosted Apache Spark installations, or in case you don't want to use the integration SDK, use the following instructions.

1.  Ensure that [Stocator](https://github.com/CODAIT/stocator) is installed according to the instructions provided.
2.  Download the Hive-compatible client with the provided [instructions](#apache-hive-metastore-3.1.2-compatible-client).
3.  Set the following settings in SparkContext: 

    ```
    spark = SparkSession.builder.appName('Python-App') \
        .config("spark.sql.pyspark.jvmStacktrace.enabled", True) \
        .config("spark.hive.metastore.truststore.path", "file:///opt/ibm/jdk/jre/lib/security/cacerts") \
        // to access IBM cloud object storage ensure that stocator is available
        .config("fs.cos.impl", "com.ibm.stocator.fs.ObjectStoreFileSystem") \
        .config("fs.stocator.scheme.list", "cos") \
        .config("fs.stocator.cos.impl", "com.ibm.stocator.fs.cos.COSAPIClient") \
        .config("fs.stocator.cos.scheme", "cos") \
        // register the required Cloud Object path used in our application, add endpoints for all buckets
        .config("spark.hadoop.fs.cos.us-geo.endpoint", "https://s3.us.cloud-object-storage.appdomain.cloud") \
        .config("spark.hadoop.fs.cos.us-geo.iam.endpoint", "https://iam.cloud.ibm.com/identity/token") \
        .config("spark.hadoop.fs.cos.us-geo.iam.api.key", '<YourAPIkey>') \
        .config("spark.sql.hive.metastore.version", "3.0") \
        // directory where the Hive client has been placed
        .config("spark.sql.hive.metastore.jars", "/tmp/dataengine/*") \
        .config("spark.hive.metastore.uris", "thrift://catalog.<region>.sql-query.cloud.ibm.com:9083") \
        .config("spark.hive.metastore.use.SSL", "true") \
        .config("spark.hive.metastore.truststore.password", "changeit") \
        .config("spark.hive.metastore.client.auth.mode", "PLAIN") \
        .config("spark.hive.metastore.client.plain.username", '<YourDataengineCRN>') \
        .config("spark.hive.metastore.client.plain.password", '<YourAPIkey>') \
        .config("spark.hive.execution.engine", "spark") \
        .config("spark.hive.stats.autogather", "false") \
        .config("spark.sql.warehouse.dir", "file:///tmp") \
        // only spark as default catalog is allowed
        .config("metastore.catalog.default", "spark") \
        .enableHiveSupport() \
        .getOrCreate()

    ```
