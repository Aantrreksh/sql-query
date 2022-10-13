---

copyright:
  years: 2020, 2021
lastupdated: "2021-02-23"

keywords: SQL query, disaster recovery, backup
subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# Disaster recovery and backup
{: #disaster}

{{site.data.keyword.sqlquery_full}} stores information about submitted jobs, such as SQL statements, job status, job IDs, and database catalog information like table and views. If a disaster occurs, the regular backups ensure that no more than 24 hours of data are at risk of loss. Backups are done automatically, so no action is required on your side.

The job results are stored in {{site.data.keyword.cos_full}} and are independent of any {{site.data.keyword.sqlquery_short}} disaster recovery.

If a region becomes unavailable due to a disaster, the {{site.data.keyword.Bluemix}} team works to get the region available again. You can route your workload to a different region by creating a new instance in an available region. In case you worked with tables or views, you must create those tables in the new instance and region again. Indexes are still available, if they are saved in available buckets, such as cross region buckets, but you must set the corresponding base location. Depending on the location and size of your data, it is possible that the jobs take longer.

Until recovery completes, you cannot use your instances that were created in the affected location. When data recovery completes, job history is available for the instances again.

## Restoring a deleted service instance
{: #restore-instance}

After you delete an instance of the {{site.data.keyword.sqlquery_short}} service, you can restore the deleted service instance within the data retention period of seven days. After the seven-day period expires, the service instance is permanently deleted.

To view which service instances are available for restoration, use the [`ibmcloud resource reclamations`](/docs/cli?topic=cli-ibmcloud_commands_resource#ibmcloud_resource_reclamations) command. To restore a deleted service, use the [`ibmcloud resource reclamation-restore`](/docs/cli?topic=cli-ibmcloud_commands_resource#ibmcloud_resource_reclamation_restore) command. To view the details of a resource reclamation, use the [`ibmcloud resource reclamation`](/docs/cli?topic=cli-ibmcloud_commands_resource#ibmcloud_resource_reclamation) command, with the `--output JSON` option.
