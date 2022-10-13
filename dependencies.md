---

copyright:
  years: 2020, 2022
lastupdated: "2022-02-18"

keywords: SQL query, dependencies, cloud

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# Dependencies
{: #dependencies}

## Dependencies to other IBM Cloud Services
{: #dependencies_cloud}

In general, customer data is not leaving the region or country, in which an instance of {{site.data.keyword.sqlquery_full}} was provisioned. This rule excludes customer data that is used by dependant service instances that are under customer responsibility.

### Critical Dependencies
{: #critical}

The following dependencies of {{site.data.keyword.sqlquery_short}} are considered critical. Any loss of connectivity or service of one of these dependencies results in a functional impact to the customer on {{site.data.keyword.sqlquery_short}}.

Service name | Description
--- | ---
Business Support Services for IBM Cloud (BSS) | Used to access information about the {{site.data.keyword.Bluemix}} account, service subscription, service usage, and billing.
{{site.data.keyword.iae_full}} (IAE) | Spark engine used to execute the SQL queries. To learn more, see [IBM Analytics Engine](https://cloud.ibm.com/docs/AnalyticsEngine).
{{site.data.keyword.cloudantfull}} | Used to store {{site.data.keyword.sqlquery_short}}'s job status, storing SQL query texts, execution, and error information. To learn more, see [{{site.data.keyword.cloudant}}](https://cloud.ibm.com/docs/Cloudant).
{{site.data.keyword.databases-for-postgresql_full}} | Used for catalog store (Hive Metastore). Stores metadata that describes customer {{site.data.keyword.cos_full}} data as Spark tables and views. Lo learn more, see [{{site.data.keyword.databases-for-postgresql_full_notm}}](https://cloud.ibm.com/docs/databases-for-postgresql).
{{site.data.keyword.iamlong}} (IAM) | To authenticate requests to the service and authorize user actions, {{site.data.keyword.sqlquery_short}} implements platform and service access roles in Identity and Access Management. To learn more, see [{{site.data.keyword.iamshort}}](https://cloud.ibm.com/docs/account?topic=account-iamoverview).
{{site.data.keyword.cis_full}} (CIS) | Used to manage our external network connectivity, our `ibm.com` domains and distributed proxies with TLS termination to support DDoS, WAF and Caching for HTTPs endpoints. To learn more, see [{{site.data.keyword.cis_full_notm}}](https://cloud.ibm.com/docs/cis).
{{site.data.keyword.containerlong}} | Provides the infrastructure to run the microservices of {{site.data.keyword.sqlquery_short}}. To learn more, see [{{site.data.keyword.containerlong_notm}}](https://cloud.ibm.com/docs/containers).
{{site.data.keyword.messages-for-rabbitmq_full}} | Queues used for internal communication between microservices. To learn more, see [{{site.data.keyword.messages-for-rabbitmq}}](https://cloud.ibm.com/docs/messages-for-rabbitmq).
{{site.data.keyword.cos_full_notm}} | The service instance that is owned by the service contains out of the box sample data sets, backups of Cloudant data and IAE bootstrap config. To learn more, see [{{site.data.keyword.cos_full_notm}}](https://cloud.ibm.com/docs/cloud-object-storage).
IBM Cloud Resource Controller and IBM Cloud Catalog | Used to load required information about your service instance and offering plan. To learn more, see [IBM Cloud Resource Controller API](https://cloud.ibm.com/apidocs/resource-controller/resource-controller).
{: caption="Table 1. "Critical dependencies" caption-side="bottom"}

### Dependencies to IBM service instances owned and managed by you
{: #dependencies_service_instances}

Service name | Description
--- | ---
{{site.data.keyword.cos_full_notm}} | The service instance that is owned by the customer who controls access to the instance by using IAM policies contains customer data, SQL query results, and metaindex information that describes value distribution in actual data objects. All data is encrypted in transit and at rest. To learn more, see [{{site.data.keyword.cos_full_notm}}](https://cloud.ibm.com/docs/cloud-object-storage).
{{site.data.keyword.Db2_on_Cloud_long}} | Used to store SQL results in user-provided instances. To learn more, see [{{site.data.keyword.Db2_on_Cloud_long_notm}}](https://cloud.ibm.com/docs/Db2onCloud).
{{site.data.keyword.keymanagementservicefull}} | The user-provided instances provide keys for envelope encryption of customer data in the job status database ({{site.data.keyword.cloudant}}) and passwords or apikeys for access to customer Db2. To learn more, see [{{site.data.keyword.keymanagementservicefull_notm}}](https://cloud.ibm.com/docs/key-protect).
{{site.data.keyword.cloudaccesstraillong}} with LogDNA | {{site.data.keyword.sqlquery_short}} integrates with {{site.data.keyword.cloudaccesstraillong_notm}} with LogDNA to forward location audit events to the {{site.data.keyword.cloudaccesstraillong_notm}} service instance that is set up and owned by you. To learn more, see [{{site.data.keyword.cloudaccesstraillong_notm}}](https://cloud.ibm.com/docs/Activity-Tracker-with-LogDNA).
{{site.data.keyword.messagehub_full}} | The user provided instance contains the data that is streamed from a topic to a bucket of your choice. To learn more, see [Stream landing](/docs/sql-query?topic=sql-query-event-streams-landing).
{: caption="Table 2. "Dependencies to IBM service instances" caption-side="bottom"}

### Other dependencies 
{: #other_dependencies}

Service name | Description
--- | ---
{{site.data.keyword.databases-for-redis_full}} | Used as UI session store and for caching of Cloudant data. To learn more, see [{{site.data.keyword.databases-for-redis_full_notm}}](https://cloud.ibm.com/docs/databases-for-redis).
{: caption="Table 3. "Other dependencies" caption-side="bottom"}

## Dependencies to third-party services
{: #third_party_dependencies}

Service name | Description
--- | ---
Amplitude, Segment | Amplitude and Segment are used to monitor user behavior in the {{site.data.keyword.Bluemix_notm}} console, such as page hits or click-through paths. This information is used for IBM-internal marketing and data analytics purposes.
ServiceNow, Slack | Those Services are used for problem determination and alerting.
{: caption="Table 4. "Dependencies to third-party services" caption-side="bottom"}
