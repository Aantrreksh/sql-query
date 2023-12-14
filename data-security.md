---

copyright:
  years: 2022, 2023
lastupdated: "2023-12-14"

keywords: data encryption, data storage, bring your own key method, BYOK, key management, key encryption, personal data, data deletion, data security, KYOK

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Securing your data in {{site.data.keyword.sqlquery_short}}
{: #securing-data}

{{site.data.keyword.sqlquery_full}} is deprecated. As of 18 February 2024 you can't create new instances, and access to free instances will be removed. Existing Standard plan instances are supported until 18 January 2025. Any instances that still exist on that date will be deleted.
{: deprecated}

To ensure that you can securely manage your data when you use {{site.data.keyword.sqlquery_short}}, it is important to know exactly [what data is stored and encrypted](/docs/sql-query?topic=sql-query-keyprotect#considerations) and how you can delete any stored data. Depending on your security requirements, you can encrypt data with customer-managed keys by integrating with {{site.data.keyword.cloud_notm}} key management services such as {{site.data.keyword.keymanagementserviceshort}}, which supports the Bring Your Own Key (BYOK) method.
{: shortdesc}

## How your data is stored and encrypted in {{site.data.keyword.sqlquery_short}}
{: #data-storage}

All data that is stored in {{site.data.keyword.sqlquery_short}} has by default service-managed encryption. You can also choose to encrypt with BYOK using {{site.data.keyword.keymanagementservicefull}}. SQL query text and error messages can be encrypted by associating a {{site.data.keyword.keymanagementservicefull}} during instance creation. Table metadata is encrypted by using the same mechanism for all tables or views that were created after August 23rd, 2022.
All table metadata that was created before that date is encrypted by using service-managed encryption. You can re-create tables to convert the encryption method to BYOK.

The following elements of table metadata cannot be encrypted with BYOK by design: table names and partition names that are generated from values of a partitioning column.

Do not include PII or sensitive data in table names, and do not use columns containing PII or sensitive data as partitioning columns.

If you are processing sensitive data, ensure that the actual data storage locations on which {{site.data.keyword.sqlquery_short}} works (for example COS buckets, {{site.data.keyword.messagehub}} queues, or Db2 tables) are adequately protected. Refer to the documentation of the respective cloud service for configuring security for these storage locations.

## Protecting your sensitive data in {{site.data.keyword.sqlquery_short}}
{: #data-encryption}

You can add a higher level of encryption protection and control to your data at rest (when it is stored) by enabling integration with {{site.data.keyword.keymanagementserviceshort}}. The data that you store in {{site.data.keyword.cloud_notm}} is encrypted at rest by using a service-managed key. If you need to control the encryption keys, you can integrate {{site.data.keyword.keymanagementserviceshort}}. This process is commonly referred to as Bring your own keys (BYOK).
With {{site.data.keyword.keymanagementserviceshort}} you can create, import, and manage encryption keys. You can assign access policies to the keys,
assign users or service IDs to the keys, or give the key access only to a specific service. The first 20 keys are free.

### Enabling customer-managed keys for {{site.data.keyword.sqlquery_short}}
{: #using-byok}

Follow the steps to [set up {{site.data.keyword.keymanagementserviceshort}} encryption](/docs/sql-query?topic=sql-query-keyprotect#encryption) when you create your instance.

## Deleting your data in {{site.data.keyword.sqlquery_short}}
{: #data-delete}

Your data is deleted 30 days after you delete an instance. If you use {{site.data.keyword.keymanagementserviceshort}} integration, you can destroy your data immediately by destroying the key in {{site.data.keyword.keymanagementserviceshort}}.

### Deleting {{site.data.keyword.sqlquery_short}} instances
{: #service-delete}

Deleting a key or the containing {{site.data.keyword.keymanagementserviceshort}} instance from the system will shred its contents and any data still encrypted with that key. When it is removed, it cannot be undone or reversed. A {{site.data.keyword.sqlquery_short}} instance that is associated with a deleted key cannot be used for any further queries. You need to create a new {{site.data.keyword.sqlquery_short}} instance for future queries.

The {{site.data.keyword.sqlquery_short}} data retention policy describes how long your data is stored after you delete the service. The data retention policy is included in the {{site.data.keyword.sqlquery_short}} service description, which you can find in the [{{site.data.keyword.cloud_notm}} Terms and Notices](/docs/overview?topic=overview-terms).
