---

copyright:
  years: 2018, 2022
lastupdated: "2022-02-28"

keywords: encryption, key protect, query, key management system

subcollection: sql-query

---

{:shortdesc: .shortdesc}
{:new_window: target="_blank"}
{:codeblock: .codeblock}
{:pre: .pre}
{:screen: .screen}
{:tip: .tip}

# Encrypting SQL queries with Key Protect
{: #keyprotect}

By default, {{site.data.keyword.sqlquery_full}} uses server-managed encryption at rest for all job information that is recorded about your stored queries. If you are processing sensitive data in your queries that is governed by special regulations, you can additionally use customer-managed keys to encrypt the SQL query texts and error messages that are stored in the job information.

{{site.data.keyword.keymanagementservicefull}} is a centralized key management system (KMS) for generating, managing, and destroying encryption keys that are used by {{site.data.keyword.cloud}} services. You can associate a key that is managed in {{site.data.keyword.keymanagementservicelong_notm}} with an SQL query instance to encrypt your queries. Customer key encryption can be configured only when you are creating the SQL query instance, and that configuration cannot be changed later. However, you can always create a new SQL query instance with a different configuration and use that for future queries. Encryption is only available for instances based on the {{site.data.keyword.sqlquery_short}} Standard plan.

## About customer-managed keys
{: #about-encryption}

{{site.data.keyword.sqlquery_short}} uses [envelope encryption](#x9860393){: term} to implement customer-managed keys. Envelope encryption describes encrypting one encryption key with another encryption key. The key used to encrypt the actual data is known as a [data encryption key (DEK)](#x4791827){: term}. The DEK itself is never stored but is wrapped by a second key that is known as the key encryption key (KEK) to create a wrapped DEK. To decrypt data, the wrapped DEK is unwrapped to get the DEK. This process is possible only by accessing the KEK, which in this case is your root key that is stored in {{site.data.keyword.keymanagementserviceshort}}.

You own the KEK, which you create as a root key in the {{site.data.keyword.keymanagementserviceshort}} service. The {{site.data.keyword.sqlquery_short}} service never sees the root (KEK) key. Its storage, management, and use to wrap and unwrap the DEK is performed entirely within the key management service. If you disable or delete the key, the data can no longer be decrypted.

{{site.data.keyword.keymanagementserviceshort}} keys are secured by FIPS 140-2 Level 3 certified cloud-based [hardware security modules (HSMs)](#x6704988){: term}. For more information, see [Bringing your encryption keys to the cloud](/docs/key-protect?topic=key-protect-importing-keys).

### Working with customer-managed keys
{: #working-with-keys}

You can use {{site.data.keyword.cloudaccesstraillong}} to audit the lifecycle events of your keys, such as creating a key, deleting a key, rotating a key, and more. For more information, see [{{site.data.keyword.cloudaccesstraillong_notm}} events for {{site.data.keyword.keymanagementserviceshort}}](/docs/key-protect?topic=key-protect-at-events).
{: tip}

## Setting up Key Protect encryption
{: #encryption}

1. Provision [Key Protect](/docs/services/key-protect?topic=key-protect-about) on your {{site.data.keyword.cloud_notm}} account.
2. Go to to your instance of {{site.data.keyword.keymanagementserviceshort}} and generate or enter a [root key](/docs/services/key-protect?topic=key-protect-getting-started-tutorial).
3. Create a new Standard plan instance of {{site.data.keyword.sqlquery_short}} and select the {{site.data.keyword.keymanagementserviceshort}} key for encrypting your queries. For performance reasons, create both the {{site.data.keyword.keymanagementserviceshort}} and {{site.data.keyword.sqlquery_short}} instances in the same {{site.data.keyword.cloud_notm}} region.
4. Give the new {{site.data.keyword.sqlquery_short}} instance [access](/docs/account?topic=account-serviceauth) to your {{site.data.keyword.keymanagementserviceshort}} key.

    - Open your {{site.data.keyword.cloud_notm}} dashboard.
    - From the menu bar, click **Manage** > **Access (IAM)**, and select **Authorizations**.
    - Click **Create**.
    - In the source service menu, select **IBM SQL Query**.
    - In the source service instance menu, select the service instance to authorize.
    - In the target service menu, select **IBM Key Protect**.
    - In the target service instance menu, select the service instance to authorize.
    - Enable the **Reader** role.
    - Click **Authorize**.

## Further considerations
{: #considerations}

Customer key encryption in {{site.data.keyword.sqlquery_short}} applies to the queries that you are processing.
With each query, you explicitly specify {{site.data.keyword.cos_full}} locations for input and target data, which is not controlled by {{site.data.keyword.sqlquery_short}}.
So, if you are processing sensitive data, make sure that your query results are written to an {{site.data.keyword.cos_full_notm}} location that has appropriate protection. Default target locations, where results are stored by default if no other result locations are specified, are not and cannot be encrypted.

{{site.data.keyword.cos_full_notm}} documents how to configure customer key encryption for the Cloud Object Storage buckets in [Managing encryption](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-encryption)
storing the actual data.

If you use {{site.data.keyword.keymanagementserviceshort}} to encrypt your queries, IBM staff cannot view the encrypted query texts and error messages. Therefore, provide this data explicitly to IBM service in a support case, so you can make sure that no sensitive information is exposed.

## Deleting a key or an instance
{: #deleting_key}

Deleting a key or the containing {{site.data.keyword.keymanagementserviceshort}} instance from the system will shred its contents and any data still encrypted with that key. When it is removed, it cannot be undone or reversed. An {{site.data.keyword.sqlquery_short}} instance that is associated with a deleted key cannot be used for any further queries. You need to create a new {{site.data.keyword.sqlquery_short}} instance for future queries.
