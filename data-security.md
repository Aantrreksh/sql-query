---

copyright:
  years: 2022
lastupdated: "2022-02-25"

keywords: data encryption in SQL Query, data storage for SQL Query, bring your own keys for SQL Query, BYOK for SQL Query, key management for SQL Query, 
key encryption for SQL Query, personal data in SQL Query, data deletion for SQL Query, data in SQL Query, data security in SQL Query, 
KYOK for SQL Query

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# Securing your data in {{site.data.keyword.sqlquery_short}}
{: #mng-data}

To ensure that you can securely manage your data when you use {{site.data.keyword.sqlquery_full}}, it is important to know exactly [what data is stored and encrypted](/docs/sql-query?topic=sql-query-keyprotect#considerations) and how you can delete any stored data. Depending on your security requirements, you can encrypt data with customer-managed keys by integrating with {{site.data.keyword.cloud_notm}} key management services such as {{site.data.keyword.keymanagementserviceshort}}, which supports the bring your own key (BYOK) method.
{: shortdesc}

## How your data is stored and encrypted in {{site.data.keyword.sqlquery_short}}
{: #data-storage} 

All data that is stored in {{site.data.keyword.sqlquery_short}} has by default server-managed encryption. You can also chose to encrypt with BYOK using {{site.data.keyword.keymanagementservicefull}}. SQL query text and error messages can be encrypted by associating a {{site.data.keyword.keymanagementservicefull}} during instance creation. Table metadata is encrypted with a service-managed key.

## Protecting your sensitive data in {{site.data.keyword.sqlquery_short}}
{: #data-encryption}

You can add a higher level of encryption protection and control to your data at rest (when it is stored) by enabling integration with {{site.data.keyword.keymanagementserviceshort}}.

The data that you store in {{site.data.keyword.cloud_notm}} is encrypted at rest by using a service-managed key. If you need to control the encryption keys, 
you can integrate {{site.data.keyword.keymanagementserviceshort}}. This process is commonly referred to as Bring your own keys (BYOK). 
With {{site.data.keyword.keymanagementserviceshort}} you can create, import, and manage encryption keys. You can assign access policies to the keys, 
assign users or service IDs to the keys, or give the key access only to a specific service. The first 20 keys are free.

### About customer-managed keys
{: #about-encryption}

{{site.data.keyword.sqlquery_short}} uses [envelope encryption](#x9860393){: term} to implement customer-managed keys. Envelope encryption describes encrypting one encryption key with another encryption key. The key used to encrypt the actual data is known as a [data encryption key (DEK)](#x4791827){: term}. The DEK itself is never stored but is wrapped by a second key that is known as the key encryption key (KEK) to create a wrapped DEK. To decrypt data, the wrapped DEK is unwrapped to get the DEK. This process is possible only by accessing the KEK, which in this case is your root key that is stored in {{site.data.keyword.keymanagementserviceshort}}.

You own the KEK, which you create as a root key in the {{site.data.keyword.keymanagementserviceshort}} service. The {{site.data.keyword.sqlquery_short}} service never sees the root (KEK) key. Its storage, management, and use to wrap and unwrap the DEK is performed entirely within the key management service. If you disable or delete the key, the data can no longer be decrypted.

{{site.data.keyword.keymanagementserviceshort}} keys are secured by FIPS 140-2 Level 3 certified cloud-based [hardware security modules (HSMs)](#x6704988){: term}. For more information, see [Bringing your encryption keys to the cloud](/docs/key-protect?topic=key-protect-importing-keys).

### Enabling customer-managed keys for {{site.data.keyword.sqlquery_short}}
{: #using-byok}

Follow the steps to [set up {{site.data.keyword.keymanagementserviceshort}} encryption](/docs/sql-query?topic=sql-query-keyprotect#encryption) when you create your instance.

### Working with customer-managed keys for {{site.data.keyword.sqlquery_short}}
{: #working-with-keys}

You can use {{site.data.keyword.cloudaccesstraillong}} to audit the lifecycle events of your keys, such as creating a key, deleting a key, rotating a key, and more. For more information, see [{{site.data.keyword.cloudaccesstraillong_notm}} events for {{site.data.keyword.keymanagementserviceshort}}](/docs/key-protect?topic=key-protect-at-events).
{: tip}

## Deleting your data in {{site.data.keyword.sqlquery_short}}
{: #data-delete}

Your data is deleted 30 days after you delete an instance. If you use {{site.data.keyword.keymanagementserviceshort}} integration, you can destroy your data immediately by destroying the key in {{site.data.keyword.keymanagementserviceshort}}.

### Deleting {{site.data.keyword.sqlquery_short}} instances
{: #service-delete}

Deleting a key or the containing {{site.data.keyword.keymanagementserviceshort}} instance from the system will shred its contents and any data still encrypted with that key. When it is removed, it cannot be undone or reversed. An {{site.data.keyword.sqlquery_short}} instance that is associated with a deleted key cannot be used for any further queries. You need to create a new {{site.data.keyword.sqlquery_short}} instance for future queries.

The {{site.data.keyword.sqlquery_short}} data retention policy describes how long your data is stored after you delete the service. The data retention policy is included in the {{site.data.keyword.sqlquery_short}} service description, which you can find in the [{{site.data.keyword.cloud_notm}} Terms and Notices](/docs/overview?topic=overview-terms).

### Restoring deleted data for {{site.data.keyword.sqlquery_short}}
{: #data-restore}

You cannot restore deleted data.
