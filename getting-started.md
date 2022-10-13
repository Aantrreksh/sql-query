---

copyright:
  years: 2018, 2022
lastupdated: "2022-06-01"

keywords: SQL, query, object storage, bucket, sample, instance, analyze, CSV, JSON, ORC, Parquet, Data Engine

subcollection: sql-query

---

{:shortdesc: .shortdesc}
{:new_window: target="_blank"}
{:codeblock: .codeblock}
{:pre: .pre}
{:screen: .screen}
{:tip: .tip}

# Getting started with {{site.data.keyword.sqlquery_notm}}
{: #getting-started}

In this {{site.data.keyword.sqlquery_full}} tutorial, we set you up to begin querying rectangular data in {{site.data.keyword.cos_full}} and storing the results in {{site.data.keyword.cos_short}}.
{: shortdesc}

![Get started with {{site.data.keyword.sqlquery_notm}}](https://video.ibm.com/embed/channel/23952663/video/csq-provision){: video output="iframe" data-script="none" id="watsonmediaplayer" width="560" height="315" scrolling="no" allowfullscreen webkitallowfullscreen mozAllowFullScreen frameborder="0" style="border: 0 none transparent;"}

## Before you begin
{: #prereqs}

Before you can run SQL queries, you need to have one or more Cloud {{site.data.keyword.cos_short}} buckets to hold the data to be analyzed and to hold the query results. Cloud {{site.data.keyword.cos_short}} offers several plans, including a Lite plan at no cost.
To create a Cloud {{site.data.keyword.cos_short}} instance, do the following steps.

1. Go to the [**IBM Cloud catalog > Storage > Object Storage**](https://cloud.ibm.com/objectstorage/create) page.
2. Select one of the plans and create the service. If you want to find your Cloud {{site.data.keyword.cos_short}} instance later, go to your [**IBM Cloud resource list > Storage**](https://cloud.ibm.com/dashboard/apps).

You can now manage and browse the buckets and data the instance contains.
Click [here](/docs/services/cloud-object-storage/getting-started.html#getting-started-console)
for more information about how to use Cloud {{site.data.keyword.cos_short}}.

## Create your {{site.data.keyword.sqlquery_short}} service instance
{: #sql_query}

1. Go to the [**IBM Cloud catalog**](https://cloud.ibm.com/catalog) and search for **{{site.data.keyword.sqlquery_short}}**.
2. Click **{{site.data.keyword.sqlquery_short}}** to open the catalog details page.
3. Select the Lite plan and click **Create** to create an instance of the service.
4. Click **Launch {{site.data.keyword.sqlquery_short}} UI** on the Dashboard page to open the {{site.data.keyword.sqlquery_short}} Console.

   When you open the Console for the first time, the {{site.data.keyword.sqlquery_short}} service automatically creates a bucket for you in your Cloud {{site.data.keyword.cos_short}} instance. It uses this bucket as the default target for your query results.

## Run one of the samples to see how to use the service
{: #samples}

1. Select a sample query. The query automatically gets loaded into the editor. The input data that is used by the sample query is available in a publicly accessible bucket.
2. The **Target** field is automatically completed with the unique resource identifier (URI) of your default bucket. You can use this bucket or specify an `INTO` clause in your query.
3. Click **Run** to run the query. The query result is displayed.
4. Each sample data set is available in each of the supported input data formats (CSV, JSON, ORC, and Parquet). If you want to experiment with different formats, edit the selected sample query and change the specified file name and format. For example, change `orders.parquet STORED AS PARQUET` to `orders.orc STORED AS ORC`.

## Next steps
{: #next_steps}

To analyze your own data (CSV, JSON, ORC, or Parquet), upload it to a Cloud {{site.data.keyword.cos_short}} instance and [run SQL queries](/docs/services/sql-query?topic=sql-query-overview#running).

For more advanced capabilities, check out the following video tutorials.

- [IBM Cloud {{site.data.keyword.sqlquery_short}} introduction](/docs/sql-query?topic=sql-query-video#video_samples_notebooks_api)
- [How to connect to IBM Cloud Object Storage through the Command Line](/docs/sql-query?topic=sql-query-video#video_command_line)
- [How to use the {{site.data.keyword.sqlquery_short}} REST API](/docs/sql-query?topic=sql-query-video#video_rest_api)
- [How to operationalize SQL code and call it from an application](/docs/sql-query?topic=sql-query-video#video_samples_notebooks_api)
