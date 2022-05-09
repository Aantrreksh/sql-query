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

# Hive compatible metastore
{: #hive_metastore}
{: beta}

{{site.data.keyword.sqlquery_full}} catalog provides an Apache Hive metastore compatible interface. This unified metadata repository enables any Big Data engine, like Apache Spark, to use {{site.data.keyword.sqlquery_full}} as metastore. The same definition for tables and views can be created once and used from any connected engine. Each instance of {{site.data.keyword.sqlquery_full}} exports its catalog as database named *default*.


## Catalog usage within {{site.data.keyword.sqlquery_short}}
{: #internal_usage}

Catalog can be used in {{site.data.keyword.sqlquery_short}} in read and write mode. Seamless access is configured without any configuration steps needed.

## Connecting Apache Spark with {{site.data.keyword.sqlquery_short}}
{: #external_usage}

When using the hive metastore compatible interface, access is limited to read only operations. This means that existing tables and views can be used, but not modified.

In order to connect to your catalog, download the following files from the links below:

### Apache Hive Metastore 3.1.2 compatible client

Download the hive compatible client from [here](https://us.sql-query.cloud.ibm.com/download/hive/hive-metastore-standalone-client-3.1.2-sqlquery.jar) and place it in a directory that of your Apache Spark cluster that is not on the classpath. This is necessary as the client will be loaded into an isolated classloader to avoid version conflicts.
Note that the examples below assume the files have been placed in `/tmp/dataengine_jars/`, when using a different folder, adjust the example accordingly.

The client differs from the Hive 3.1.2 release by addditional enhancements that add support for TLS and authentication through IAM.
For *user*, specify the CRN and for *password* a valid apikey with access to your {{site.data.keyword.sqlquery_short}}. Find the endpoint to use in the table below.

| Region | Endpoint |
|--------|----------|
| us-south | thrift://catalog.us.dataengine.cloud.ibm.com:9083 |
| eu-de | thrift://catalog.eu-de.dataengine.cloud.ibm.com:9083 |
| in-che | thrift://catalog.in-che.dataengine.cloud.ibm.com:9083 |




### Usage within IBM Watson Studio notebooks

The required JAR/Wheel files are not available in the Spark environment used by Watson Studio. Therefore they need to be transferred into the existing Spark environment first.

Use the cell below to transfer the files:

```
!wget https://us.sql-query.cloud.ibm.com/download/hive/dataengine_spark-1.0.4-py3-none-any.whl -O /tmp/dataengine_spark-1.0.9-py3-none-any.whl
// user-libs/spark2 is in the classpath of Spark
!wget https://us.sql-query.cloud.ibm.com/download/hive/spark-dataengine-integration-1.0.4.jar -O user-libs/spark2/spark-dataengine-integration-1.0.9.jar
!wget https://us.sql-query.cloud.ibm.com/download/hive/hive-metastore-standalone-client-3.1.2-sqlquery.jar -O  /tmp/hive-metastore-standalone-client-3.1.2-sqlquery.jar

!pip install --force-reinstall /tmp/dataengine_spark-1.0.9-py3-none-any.whl
```

After the above cell has been executed restart the kernel to ensure Spark has loaded the jar. Set the required variables and call the helper functions:
```
// change the CRN and the APIkey according your instance
crn='yourDataengineCRN'
apikey='yourAPIkey'

from dataengine import SparkSessionWithDataengine

// call the helper function
session_builder = SparkSessionWithDataengine.enableDataengine(crn, apikey, "public", "/tmp/dataengine_jars")
spark = session_builder.appName("Spark DataEngine integration test").getOrCreate()

```

Display your tables and run a sql statement:
```
spark.sql('show tables').show(truncate=False)

spark.sql('select * from yourTable').show()
```


### Apache Spark Data Engine integration

While {{site.data.keyword.sqlquery_full}} catalog is hive metastore compatible and can be used like any other external hive metastore server, a sdk is provided to minimize the steps needed to configure Apache Spark.
The SDK simplifies connecting to both metastore and IBM Cloud Objectstorage buckets referenced by tables or views

Download both, the scala and the python SDK and place them in a folder that is in the classpath of your Apache Spark cluster.
[spark-dataengine-scala](https://us.sql-query.cloud.ibm.com/download/hive/spark-dataengine-integration-1.0.9.jar)
[spark-dataengine-python](https://us.sql-query.cloud.ibm.com/download/hive/dataengine_spark-1.0.9-py3-none-any.whl)


Use the examples below to get started for IBM Analytics Engine or Spark runtimes in Watson studio.

Submit the following Python application using a Notebook or spark-submit:
```
import sys
from SparkSessionWithDataengine import SparkSessionWithDataengine

if __name__ == '__main__':
    crn = sys.argv[1]
    apikey = sys.argv[2]

    session_builder = SparkSessionWithDataengine.enableDataengine(crn, apikey, "public", "/tmp/dataengine_jars/")
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

If you're using Scala, run this application:
```
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

For self-hosted Apache Spark installations, or in case you don't want to use the integration SDK, use instructions below:

- Make sure [stocator](https://github.com/CODAIT/stocator) is installed according to the instructions provided.
- Download the hive compatible client per [instructions](#apache-hive-metastore-3.1.2-compatible-client
- Set the following settings in SparkContext:
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
    .config("spark.sql.hive.metastore.jars", "/tmp/dataengine_jars/*") \
    .config("spark.hive.metastore.uris", "thrift://catalog.<region>.sql-query.cloud.ibm.com:9083") \
    .config("spark.hive.metastore.use.SSL", "true") \
    .config("spark.hive.metastore.truststore.password", "changeit") \
    .config("spark.hive.metastore.client.auth.mode", "PLAIN") \
    .config("spark.hive.metastore.client.plain.username", '<YourDataengineCRN>') \
    .config("spark.hive.metastore.client.plain.password", '<YourAPIkey>') \
    .config("spark.hive.execution.engine", "spark") \
    .config("spark.hive.stats.autogather", "false") \
    .config("spark.sql.warehouse.dir", "file:///tmp") \
    // only spark as default catalog exists
    .config("metastore.catalog.default", "spark") \
    .enableHiveSupport() \
    .getOrCreate()

```
