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

{{site.data.keyword.sqlquery_full}} provides an external Hive metastore (HMS) service. Hive metastore has an Apache Thrift interface to store metadata, 
such as tables or views in an underlaying Relational Database Management System (RDBMS). Each instance has its own database named *default* that cannot be changed.
The Hive metastore can be used either within {{site.data.keyword.sqlquery_short}} by the internal Spark, for example by the creation of tables or views. 
Or, it can be used by external Spark or Hive clients that support Apache Thrift.

<Bild ?>

## Internal usage
{: #internal_usage}

Hive metastore can be used in {{site.data.keyword.sqlquery_short}} in read and write mode. Seamless access is configured without any configuration steps needed.

The following is an example of internal usage:

```sql
create table 
```

## External usage
{: #external_usage}

Hive metastore can be used externally in Read only mode. In addition, Hive metastore access needs authentication, therefore a special version of the Hive metastore client is 
required in order to access the Hive metastore server. For *user*, specify the CRN and for *password* a valid apikey is required. The Apache Thrift port to use is `9083`.
In case you use Hive metastore within Apache Spark, a simple to configure function is provided, which allows access either through Scala or Python.

The IBM Cloud Spark services (Notebook or {{site.data.keyword.iae_full}}) also offer the special Hive metastore client, as well as the convenient function for simple configuration. 

The following is an example of external usage:

