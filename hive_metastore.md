---

copyright:
  years: 2022
lastupdated: "2022-05-04"

keywords: Data Engine, SQL query, Hive, metastore

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}
{:beta: .beta}

# Hive metastore
{: #hive_metastore}
{: beta}

{{site.data.keyword.sqlquery_full}} provides an external Hive metastore (HMS) service. The Hive metastore provides an Apache Thrift interface to store metadata, 
such as tables or views in an underlaying Relational Database Management System (RDBMS). Each instance has its own database named *default* that cannot be changed.
The Hive metastore can be used either diretly within {{site.data.keyword.sqlquery_short}}, for example by the creation of tables or views. 
Or, it can be used by external Spark or Hive clients that support Apache Thrift.

As 

## HMS usage within {{site.data.keyword.sqlquery_short}}
{: #internal_usage}

Hive metastore can be used in {{site.data.keyword.sqlquery_short}} in read and write mode. Seamless access is configured without any configuration steps needed.

The following is an example statement to create a table which could be used within {{site.data.keyword.sqlquery_short}} and the metadata is stored in the HMS.

```sql
CREATE TABLE LAX_CARGO
(Extract_Date timestamp, Report_Date timestamp, Arrival_Departure string,
Domestic_International string, Cargo_Type string, Air_Cargo_Tons int)
using csv
location cos://us-geo/sql/LAX_Cargo.csv
options(header=false)
```

More samples how to work with the HMS could be found in the samples tab of the  {{site.data.keyword.sqlquery_short}} UI below "Catalog management statements".

## Usage of the HMS with Apache Spark outside {{site.data.keyword.sqlquery_short}}
{: #external_usage}

Hive metastore can be used externally in read only mode only. The Hive metastore access needs authentication, therefore a special version of the Hive metastore client is 
required in order to access the Hive metastore server. For *user*, specify the CRN and for *password* a valid apikey with access to your {{site.data.keyword.sqlquery_short}} is required. The Apache Thrift port to use is `9083`.
In case you use Hive metastore within Apache Spark, a simple to configure function is provided, which allows usage either through Scala or Python.

In order to use it store the HMS client jar in a directory which is accessable for Spark but not in the classpath. The helper Scala jar should be stored in the classpath of the used Apache Spark.

To download the Hive client jar: https://us.sql-query.cloud.ibm.com/download/hive/hive-metastore-standalone-client-3.1.2-sqlquery.jar
To download helper function in Scala https://us.sql-query.cloud.ibm.com/download/hive/spark-dataengine-integration-1.0.4.jar
and Python: https://us.sql-query.cloud.ibm.com/download/hive/dataengine_spark-1.0.4-py3-none-any.whl

### Usage Helper functions

The following is an example when you run the functions using Python:
```
import sys
from SparkSessionWithDataengine import SparkSessionWithDataengine

if __name__ == '__main__':
    crn = sys.argv[1]
    apikey = sys.argv[2]

    session_builder = SparkSessionWithDataengine.enableDataengine(crn, apikey, "public", "/opt/spark/metastore_jars")
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

    # test payload
    print("Got a spark session, listing all tables")
    spark.sql('show tables').show()

    spark.stop()
```

Example using Scala:
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

In case you do like to control the settings done by yourself see the following requried settings. The special HMS client needs to be availalbe in the specified path.

```
spark = SparkSession.builder.appName('Python-App') \
    .config("spark.sql.pyspark.jvmStacktrace.enabled", True) \
    .config("spark.hive.metastore.truststore.path", "file:///opt/ibm/jdk/jre/lib/security/cacerts") \
    // to access IBM cloud object storage ensure that stocator is available
    .config("fs.cos.impl", "com.ibm.stocator.fs.ObjectStoreFileSystem") \
    .config("fs.stocator.scheme.list", "cos") \
    .config("fs.stocator.cos.impl", "com.ibm.stocator.fs.cos.COSAPIClient") \
    .config("fs.stocator.cos.scheme", "cos") \
    // register the required Cloud Object path used in our application
    .config("spark.hadoop.fs.cos.us-geo.endpoint", "https://s3.us.cloud-object-storage.appdomain.cloud") \
    .config("spark.hadoop.fs.cos.us-geo.iam.endpoint", "https://iam.cloud.ibm.com/identity/token") \
    .config("spark.hadoop.fs.cos.us-geo.iam.api.key", 'YourAPIkey') \
    .config("spark.sql.hive.metastore.version", "3.0") \
    // directory where the HMS client has been stored
    .config("spark.sql.hive.metastore.jars", "/tmp/dataengine_jars/*") \
    .config("spark.hive.metastore.uris", "thrift://catalog.sql-query.cloud.ibm.com:9083") \
    .config("spark.hive.metastore.use.SSL", "true") \
    .config("spark.hive.metastore.truststore.password", "changeit") \
    .config("spark.hive.metastore.client.auth.mode", "PLAIN") \
    .config("spark.hive.metastore.client.plain.username", 'YourDataengineCRN') \
    .config("spark.hive.metastore.client.plain.password", 'YourAPIkey') \
    .config("spark.hive.execution.engine", "spark") \
    .config("spark.hive.stats.autogather", "false") \
    .config("spark.sql.warehouse.dir", "file:///tmp") \
    // only spark as default catalog is allowed
    .config("metastore.catalog.default", "spark") \
    .enableHiveSupport() \
    .getOrCreate()

```


### Usage within IBM Watson Studio notebooks

Currently the required JAR/Wheel files are not available in the Spark environment used by Watson Studio. Therefore they need to be transferred into the existing Spark environment first. 
See below a cell which does transfer the files:

```
!wget https://us.sql-query.cloud.ibm.com/download/hive/dataengine_spark-1.0.4-py3-none-any.whl -O /tmp/dataengine_spark-1.0.9-py3-none-any.whl
// user-libs/spark2 is in the classpath of Spark
!wget https://us.sql-query.cloud.ibm.com/download/hive/spark-dataengine-integration-1.0.4.jar -O user-libs/spark2/spark-dataengine-integration-1.0.9.jar
!wget https://us.sql-query.cloud.ibm.com/download/hive/hive-metastore-standalone-client-3.1.2-sqlquery.jar -O  /tmp/hive-metastore-standalone-client-3.1.2-sqlquery.jar

!pip install --force-reinstall /tmp/dataengine_spark-1.0.9-py3-none-any.whl
```

Afer the above cell has been executed restart the kernel. Otherwise the jar files will not be recognized! Set the required variables and call the helper functions:
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

## Encryption
{: #encryption}

If encryption with Keyprotect is enabled for the used instance the table metadata in the underlaying RDBMS will be stored encrypted. Table created before 6.5.2022 has not been stored encpyted with your Keyprotect key. To enforce this you need to drop and recreate the table.

