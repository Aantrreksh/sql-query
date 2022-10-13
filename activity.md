---

copyright:
  years: 2018, 2022
lastupdated: "2022-04-07"

keywords: activity tracker, activity, event

subcollection: sql-query

---

{:shortdesc: .shortdesc}
{:new_window: target="_blank"}
{:codeblock: .codeblock}
{:pre: .pre}
{:screen: .screen}
{:tip: .tip}

# Activity Tracker events
{: #activitytracker}

Use the {{site.data.keyword.at_full}} service to track how users and applications interact with {{site.data.keyword.sqlquery_full}}.

The {{site.data.keyword.at_full_notm}} service records user-initiated activities that change the state of a service in {{site.data.keyword.cloud}}. For more information, see [Getting started with {{site.data.keyword.at_short}}](/docs/Activity-Tracker-with-LogDNA?topic=Activity-Tracker-with-LogDNA-getting-started).

You can use the {{site.data.keyword.sqlquery_short}} service to query {{site.data.keyword.at_short}} archive files that are stored in an {{site.data.keyword.cos_short}} bucket in your account. For more information, see [Searching archive data by using the {{site.data.keyword.sqlquery_short}} service](/docs/activity-tracker?topic=activity-tracker-sqlquery).

You can search activity tracker events with {{site.data.keyword.sqlquery_short}}.

## List of events
{: #events}

The following table lists the actions that generate an event:

Actions  |  Description
--- | ---
`sql-query.sql-job.create` |  An SQL query was submitted.
`sql-query.sql-job.list` |  List of jobs was retrieved.
`sql-query.sql-job.get` |  Details of a job were retrieved.
`sql-query.sql-job.disable` |  An SQL query streaming job was stopped.
`sql-query.catalog-table.list` |  List of catalog tables was retrieved.
`sql-query.catalog-table.get` |  Details of a catalog table were retrieved.
`sql-query.sql-job.disable` |  An SQL query streaming job was stopped.
`sql-query.sql-job.notify` |  An SQL query streaming job can't process all messages before being rolled out of the EventStreams topic.
`sql-query.catalog-table-partition.list`| List of partitions of a table was retrieved.
