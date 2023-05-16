---

copyright:
  years: 2023
lastupdated: "2023-05-16"

keywords: crn, uri, db2 table uri, database location

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Database locations
{: #db-location}

Two ways to specify database locations exist, CRN URIs, and Db2 table URIs. Which one you choose depends on the target database plan and the access you have to that database. The number of parallel Db2 connections affects performance. The more parallel connections there are, the better the performance gets, depending on the allowed connections to Db2 and the current free resources of {{site.data.keyword.sqlquery_short}}. Check how many connections your [Db2 plan](https://cloud.ibm.com/catalog/services/db2) allows.

## CRN URI location
{: #crn-uri-location}

If the {{site.data.keyword.Db2_on_Cloud_short}} instance is in an {{site.data.keyword.Bluemix_notm}} account that is accessible to the SQL user, and if the SQL user can see the credentials for that instance (requires the Operator privilege), the user can specify the database location by using its instance CRN. The access to the database is performed with the username and password that is found in the service credentials for this Db2 instance. Newly created Db2 instances don't have any service credentials; to create them, select the instance in the {{site.data.keyword.Bluemix_notm}} console and choose **Service credentials** > **New credential**.

You can optionally override the username and password in the credentials with a custom user and password or a custom API key. Store the password or key into {{site.data.keyword.keymanagementservicefull}} and specify an [access secret clause](/docs/sql-query?topic=sql-query-sql-reference#accessSecrets) in your query. For more information, see the [security documentation](/docs/sql-query?topic=sql-query-authentication).

This option is typically used with Db2 Lite plans, which provide restricted access for a single user in a shared database. It can also be used with Standard plans, but the service credentials for Standard plans always allow full administrator access. If the SQL user has only restricted access to the target database, use the subsequent "Db2 table URI location" option.

The CRN table has the form:

**`<db service crn>/<table name>`**

You retrieve the **`<db service crn>`** by opening the resource list in the {{site.data.keyword.Bluemix_notm}} dashboard. Scroll down to the database service instance and click in any of the columns other than the first column. An overlay panel to the right opens where you find a field that is labeled `CRN:` with the value and an option to copy it to your clipboard.

The **`<table name>`** part specifies the table that is created in your database. It has the format **`<schemaname>.<tablename>`**. If you omit the **`<schemaname>`** part, the table is created in the schema of the `"username"` in the credentials of your database service instance &ndash; for a Db2 Lite plan, it is the only schema that you have access to. The table name is case-preserving, so use uppercase to match database defaults.

An example for a CRN table is: `crn:v1:bluemix:public:dashdb-for-transactions:us-south:s/c3882b7e-00c4-4e7c-a63b-cded1c298f25:23eb50c5-723d-41e0-b7d8-603feaa79ccc:cf-service-instance:/RWS46052.QUERY_RESULT`

## Db2 table URI location
{: #db2-table-uri-location}

If the SQL user cannot access the service credentials for the {{site.data.keyword.Db2_on_Cloud_short}} instance (because the user does not have access to the account that contains the database instance, or is not granted Operator privilege on the instance), the user can specify the database location by using a URI with the Db2 database hostname.

By default the access to this database is performed with the IAM identity of the user who submitted the query. This default requires that the database is enabled for IAM authentication. Also, before you use this option, make sure that the IBMid of the user was added as a database user. For more information, see [Console user experience](https://www.ibm.com/support/knowledgecenter/en/SS6NHC/com.ibm.swg.im.dashdb.security.doc/doc/iam.html) in the *Identity and access management (IAM) on IBM Cloud* documentation. This option is not available for Db2 Lite plans because they don't support IAM authentication in the database.

If you cannot or do not want to use the default mechanism of IAM user authentication, you can instead specify a custom user and password or a custom API key. To do so, store the password or key into {{site.data.keyword.keymanagementservicefull}} and specify an [access secret clause](/docs/sql-query?topic=sql-query-sql-reference#accessSecrets) in your query. For more information, see the [security documentation](/docs/sql-query?topic=sql-query-authentication#accessauthentication). With this option, you can connect to *any* Db2 database that is accessible from the IBM public cloud network.

The Db2 table URI has the following form:

**`db2://<db2 host name>[:<db2 port number>]/<table name>`**

The **`<db2 host name>`** is the hostname of the Db2 instance that is used to access the Db2 web console and is also used for Java database connectivity (JDBC).

The **`<db2 port number>`** is optional. It is the port number of the DRDA endpoint of the Db2 instance that is used by client JDBC drivers. The default value is **`50001`**. For {{site.data.keyword.dashdblong}} instances, this port number is fixed and you can omit it. For {{site.data.keyword.Db2_on_Cloud_long}} instances, the port number can vary. Check the instance configuration to get the correct port number.

The **`<table name>`** part specifies the table that is created in your database. It has the format **`<schemaname>.<tablename>`**.
If you omit the **`<schemaname>`** part, the table is created in the schema of database user that was created for the IBMid of the SQL user. The table name is case-preserving, so use uppercase to match database defaults.

The following URI is an example of a Db2 table URI:

`db2://db2w-vqplkwx.us-south.db2w.cloud.ibm.com/MYSCHEMA.QUERY_RESULT`
