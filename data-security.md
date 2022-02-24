---

copyright:
  years: 2022
lastupdated: "2022-02-21"

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

To ensure that you can securely manage your data when you use {{site.data.keyword.sqlquery_full}}, it is important to know exactly what data is stored and encrypted 
and how you can delete any stored data. Depending on your security requirements, you can encrypt data with customer-managed keys by integrating with 
{{site.data.keyword.cloud_notm}} key management services such as {{site.data.keyword.keymanagementserviceshort}}, which supports the bring your own key (BYOK) method, 
or {{site.data.keyword.hscrypto}}, which supports the keep your own key (KYOK) method.
{: shortdesc}

## How your data is stored and encrypted in {{site.data.keyword.sqlquery_short}}
{: #data-storage}

_Document how your offering stores and encrypts user data as it relates to user activities. What data is encrypted and what is not? How is data encrypted?_  

All data that is stored in {{site.data.keyword.sqlquery_short}} is encrypted with {{site.data.keyword.keymanagementservicefull}}.

## Protecting your sensitive data in {{site.data.keyword.sqlquery_short}}
{: #data-encryption}

You can add a higher level of encryption protection and control to your data at rest (when it is stored) and data in motion (when it is transported) by enabling 
integration with {{site.data.keyword.keymanagementservicefull}}.

The data that you store in {{site.data.keyword.cloud_notm}} is encrypted at rest by using a randomly generated key. If you need to control the encryption keys, 
you can integrate {{site.data.keyword.keymanagementserviceshort}}. This process is commonly referred to as Bring your own keys (BYOK). 
With {{site.data.keyword.keymanagementserviceshort}} you can create, import, and manage encryption keys. You can assign access policies to the keys, 
assign users or service IDs to the keys, or give the key access only to a specific service. The first 20 keys are free.

-->> Should we replace this with our Key Protect topic? Or leave this as is and keep our Key Protect topic?

<!-- Some other examples that support both Key Protect and Hyper Protect Crypto Services:
Event Streams: https://test.cloud.ibm.com/docs/EventStreams?topic=EventStreams-managing_encryption
https://test.cloud.ibm.com/docs/appid?topic=appid-mng-data -->

### About customer-managed keys
{: #about-encryption}

{{site.data.keyword.sqlquery_short}} uses [envelope encryption](#x9860393){: term} to implement customer-managed keys. Envelope encryption describes encrypting one encryption key with another encryption key. The key used to encrypt the actual data is known as a [data encryption key (DEK)](#x4791827){: term}. The DEK itself is never stored but is wrapped by a second key that is known as the key encryption key (KEK) to create a wrapped DEK. To decrypt data, the wrapped DEK is unwrapped to get the DEK. This process is possible only by accessing the KEK, which in this case is your root key that is stored in {{site.data.keyword.keymanagementserviceshort}}.

You own the KEK, which you create as a root key in the {{site.data.keyword.keymanagementserviceshort}} service. The {{site.data.keyword.sqlquery_short}} service never sees the root (KEK) key. Its storage, management, and use to wrap and unwrap the DEK is performed entirely within the key management service. If you disable or delete the key, the data can no longer be decrypted.

{{site.data.keyword.keymanagementserviceshort}} keys are secured by FIPS 140-2 Level 3 certified cloud-based [hardware security modules (HSMs)](#x6704988){: term}. For more information, see [Bringing your encryption keys to the cloud](/docs/key-protect?topic=key-protect-importing-keys).

### Enabling customer-managed keys for {{site.data.keyword.sqlquery_short}}
{: #using-byok}

_Document the steps a customer must take to get their keys or bring their keys to encrypt their data with your service. As an example, see: https://test.cloud.ibm.com/docs/services/watson?topic=watson-keyservice#keyservice-steps and https://test.cloud.ibm.com/docs/EventStreams?topic=EventStreams-managing_encryption#enabling_encryption and https://test.cloud.ibm.com/docs/appid?topic=appid-mng-data#enable-customer-keys-kp_

### Working with customer-managed keys for {{site.data.keyword.sqlquery_short}}
{: #working-with-keys}

_Document any common scenarios that can help your customers know how to use their keys to protect data within the service. As an example, see: https://test.cloud.ibm.com/docs/services/watson?topic=watson-keyservice#keyservice-using and https://test.cloud.ibm.com/docs/EventStreams?topic=EventStreams-managing_encryption#using_encryption. Document scenarios such as key rotation and temporarily preventing and restoring access. For any lifecycle events that your service does not support, such as key rotation, you must document it here._ 

_Add a note like the following example, so that customers know they can audit the lifecycle of these keys by using the events from the key management service. Use what applies to your use case._

You can use {{site.data.keyword.cloudaccesstraillong}} to audit the lifecycle events of your keys, such as creating a key, deleting a key, rotating a key, and more. For more information, see [{{site.data.keyword.cloudaccesstraillong_notm}} events for {{site.data.keyword.keymanagementserviceshort}}](/docs/key-protect?topic=key-protect-at-events).
{: tip}

## Deleting your data in {{site.data.keyword.sqlquery_short}}
{: #data-delete}

Your data is deleted 30 days after you delete an instance. There is no mechanism for you to delete your own data. 

### Deleting {{site.data.keyword.sqlquery_short}} instances
{: #service-delete}

_Include information about whether deleting the service fully erases all data. If deleting the service doesn't remove all personal data, include information about how users can completely delete their data._

_Information about how long services keep data after instances are deleted is covered in the service description. Include the following reference for users to find their data retention period._

Deleting a key or the containing {{site.data.keyword.keymanagementserviceshort}} instance from the system will shred its contents and any data still encrypted with that key. When it is removed, it cannot be undone or reversed. An {{site.data.keyword.sqlquery_short}} instance that is associated with a deleted key cannot be used for any further queries. You need to create a new {{site.data.keyword.sqlquery_short}} instance for future queries.

The {{site.data.keyword.sqlquery_short}} data retention policy describes how long your data is stored after you delete the service. The data retention policy is included in the {{site.data.keyword.sqlquery_short}} service description, which you can find in the [{{site.data.keyword.cloud_notm}} Terms and Notices](/docs/overview?topic=overview-terms).

### Restoring deleted data for {{site.data.keyword.sqlquery_short}}
{: #data-restore}

_If users can restore deleted data within your service, include this optional section and the task that users can complete to do so._

_Important: Don't include information about restoring your resource via the reclamation controller because it's available only on a limited basis._

You can restore your instance within 30 days after deletion. 
