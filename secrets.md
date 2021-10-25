---

copyright:
  year: 2018, 2021
lastupdated: "2021-02-26"

keywords: security, custom secrets, key protect, access

subcollection: sql-query

---

{:shortdesc: .shortdesc}
{:new_window: target="_blank"}
{:codeblock: .codeblock}
{:pre: .pre}
{:screen: .screen}
{:tip: .tip}


# Setting up custom secrets in Key Protect
{: #kpsetup}

{{site.data.keyword.keymanagementservicefull}} is the service for storing and managing secrets in {{site.data.keyword.Bluemix_notm}}. It also allows you to upload custom secrets and manages them for you. {{site.data.keyword.keymanagementserviceshort}} ensures that only those users and services whom you explicitly granted permission are able to access and use secrets. {{site.data.keyword.sqlquery_short}} uses {{site.data.keyword.keymanagementserviceshort}} as its secure and trusted credential broker for custom access secrets to data resources as the following diagram shows.

![Secure Credential Passing in SQL Query](accesssecrets.svg)

Make sure that you provisioned or received access to an instance of {{site.data.keyword.keymanagementserviceshort}} in 
{{site.data.keyword.Bluemix_notm}}. The following description uses the command-line interface to set up a new custom key. 
Alternatively, you can also use the {{site.data.keyword.Bluemix_notm}} console.

1. Log on to {{site.data.keyword.Bluemix_notm}} with `ibmcloud login --sso`.
2. Install the {{site.data.keyword.keymanagementserviceshort}} CLI plug-in, if it is not already installed: `ibmcloud plugin install key-protect -r 'IBM Cloud'`. 
For more information, see the [Key Protect documentation](/docs/services/key-protect?topic=key-protect-set-up-cli).
3. List your {{site.data.keyword.keymanagementserviceshort}} service instances and identify the ID and region of the instance where you want to store the secret: `ibmcloud resource service-instances --long --service-name kms`. The instance ID is in output column "GUID", the region in column "Location".
4. Select the appropriate target region with `ibmcloud kp region-set <region>`.
5. Optionally review the existing keys in the instance with following command:  `ibmcloud kp list -c -i <kp instance id>`.
6. {{site.data.keyword.keymanagementserviceshort}} accepts only base64 encoded secret data. Issue the following command to add a custom secret as properly encoded content to Key Protect: ``ibmcloud kp create "<key name>" -i <kp instance id> -s -k `echo -ne "<your custom secret>" | base64` ``. The key name that you provide is for your reference only and can be an arbitrary string.
7. List the keys again (as in step 5) to retrieve the key ID and CRN for the new key that you created. Use the key CRN in an 
[access secret clause](/docs/sql-query?topic=sql-query-sql-reference#accessSecrets) of an SQL query.

You can verify the correct setup and function of your IBM Cloud CLI by downloading and running [this script](https://raw.githubusercontent.com/ibm-cloud-docs/sql-query/master/kp_check.sh) in your command line. It performs some tests for creating and verifying a test key in one of your Key Protect instances.

You cannot use the CLI or web console to review actual key content after it is uploaded. However, you can use the 
[REST API](https://cloud.ibm.com/apidocs/key-protect#retrieve-a-key-by-id) directly to review existing custom key content by issuing the following command:
```
curl -X GET "https://us-south.kms.cloud.ibm.com/api/v2/keys/<key id>" \
  -H "accept: application/vnd.ibm.collection+json" \
  -H "authorization: <Bearer token>" \
  -H "bluemix-instance: <kp instance id>" \
| jq -r '.resources[].payload' | base64 --decode
```
Replace `us-south` in the REST API URL with the appropriate region. The `<key id>` is the one you obtained in step 7. The required `<Bearer token>` can be retrieved with `ibmcloud iam oauth-tokens`. For more information, see to the {{site.data.keyword.keymanagementserviceshort}} [CLI documentation](/docs/key-protect?topic=key-protect-cli-reference#ibmcloud-kp-commands).

## Managing access to custom secrets
{: #kpauthorization}

Use IAM access policies to manage access to your keys. You can do so for an entire service instance or for an individual key. Refer to the [documentation](/docs/services/key-protect?topic=key-protect-grant-access-keys) for further details.
