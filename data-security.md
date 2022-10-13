---

copyright:
  years: 2022
lastupdated: "2022-02-28"

keywords: data encryption in SQL Query, data storage for SQL Query, bring your own keys for SQL Query, BYOK for SQL Query, key management for SQL Query, key encryption for SQL Query, personal data in SQL Query, data deletion for SQL Query, data in SQL Query, data security in SQL Query, KYOK for SQL Query

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# Securing your data in {{site.data.keyword.sqlquery_short}}
{: #securing-data}

To ensure that you can securely manage your data when you use {{site.data.keyword.sqlquery_full}}, it is important to know exactly [what data is stored and encrypted](/docs/sql-query?topic=sql-query-keyprotect#considerations) and how you can delete any stored data. Depending on your security requirements, you can encrypt data with customer-managed keys by integrating with {{site.data.keyword.cloud_notm}} key management services such as {{site.data.keyword.keymanagementserviceshort}}, which supports the bring your own key (BYOK) method.
{: shortdesc}

## How your data is stored and encrypted in {{site.data.keyword.sqlquery_short}}
{: #data-storage} 

All data that is stored in {{site.data.keyword.sqlquery_short}} has by default service-managed encryption. You can also chose to encrypt with BYOK using {{site.data.keyword.keymanagementservicefull}}. SQL query text and error messages can be encrypted by associating a {{site.data.keyword.keymanagementservicefull}} during instance creation. Table metadata is encrypted using the same mechanism for all tables or views created after 23th August 2022.
All table metadata has been created before that date are encrypted using service-managed encryption. You may re-create tables to convert the encryption method to BYOK using {{site.data.keyword.keymanagementservicefull}}.

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

Deleting a key or the containing {{site.data.keyword.keymanagementserviceshort}} instance from the system will shred its contents and any data still encrypted with that key. When it is removed, it cannot be undone or reversed. An {{site.data.keyword.sqlquery_short}} instance that is associated with a deleted key cannot be used for any further queries. You need to create a new {{site.data.keyword.sqlquery_short}} instance for future queries.

The {{site.data.keyword.sqlquery_short}} data retention policy describes how long your data is stored after you delete the service. The data retention policy is included in the {{site.data.keyword.sqlquery_short}} service description, which you can find in the [{{site.data.keyword.cloud_notm}} Terms and Notices](/docs/overview?topic=overview-terms).
