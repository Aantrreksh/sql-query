---

copyright:
  years: 2018, 2022
lastupdated: "2022-11-25"

keywords: data model, data, performance, cost, object storage

subcollection: sql-query

---

{:shortdesc: .shortdesc}
{:new_window: target="_blank"}
{:codeblock: .codeblock}
{:pre: .pre}
{:screen: .screen}
{:tip: .tip}

# Data layout and modeling
{: #datalayout}

{{site.data.keyword.sqlquery_full}} is deprecated. As of 18 February 2024 you can't create new instances, and access to free instances will be removed. Existing Standard plan instances are supported until 18 January 2025. Any instances that still exist on that date will be deleted.
{: deprecated}

Planning your data model and distribution of your data in {{site.data.keyword.cos_full}} can lead to increased performance and lower costs. The article [How to lay out Big Data in IBM Cloud Object Storage for Spark SQL](https://www.ibm.com/cloud/blog/big-data-layout) shares tricks of the trade to impact cost and performance of your SQL queries.

In {{site.data.keyword.sqlquery_full}} you can specify the format and layout in which a result for an SQL query is written. By adding these abilities, {{site.data.keyword.sqlquery}} opens up serverless data transformation in Cloud {{site.data.keyword.cos_short}}. For more information, see [{{site.data.keyword.sqlquery_short}} Releases Serverless Transformation and Partitioning of Data in Open Formats](https://www.ibm.com/cloud/blog/announcements/sql-query-releases-serverless-transformation-and-partitioning-of-data-in-open-formats).
