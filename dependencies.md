---

copyright:
  years: 2020, 2021
lastupdated: "2021-02-23"

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

The following dependencies of {{site.data.keyword.sqlquery_short}} are considered critical. 
Any loss of connectivity or service of one of these dependencies results in a functional impact to the customer on {{site.data.keyword.sqlquery_short}}.

Service name | Description
--- | ---
Business Support Services for IBM Cloud (BSS) | Used to access information about the IBM Cloud account, service subscription, service usage, and billing.
IBM Analytics Engine (IAE) | Spark engine used to execute the SQL queries. To learn more, see [IBM Analytics Engine](https://cloud.ibm.com/docs/AnalyticsEngine).
IBM Cloudant | Used to store SQL Query's job status, storing SQL query texts, execution, and error information. To learn more, see [IBM Cloudant](https://cloud.ibm.com/docs/Cloudant).
IBM Cloud Databases For PostgreSQL | Used for catalog store (Hive Metastore). Stores metadata that describes customer {{site.data.keyword.cos_full}} data as Spark tables and views. Lo learn more, see [IBM Cloud Databases For PostgreSQL](https://cloud.ibm.com/docs/databases-for-postgresql).
IBM Cloud Identity and Access Management (IAM) | To authenticate requests to the service and authorize user actions, IBM Cloud SQL Query implements platform and service access roles in Identity and Access Management. To learn more, see [IBM Cloud Identity and Access Management](https://cloud.ibm.com/docs/account?topic=account-iamoverview).
IBM Cloud Internet Services (CIS) | Used to manage our external network connectivity, our `ibm.com` domains and distributed proxies with TLS termination to support DDoS, WAF and Caching for HTTPs endpoints. To learn more, see [Cloud Internet Services](https://cloud.ibm.com/docs/cis).
IBM Cloud Kubernetes services | Provides the infrastructure to run the microservices of IBM Cloud SQL Query. To learn more, see [IBM Cloud Kubernetes services](https://cloud.ibm.com/docs/containers).
IBM Cloud Messages for RabbitMQ | Queues used for internal communication between microservices. To learn more, see [IBM Cloud Messages For RabbitMQ](https://cloud.ibm.com/docs/messages-for-rabbitmq).
{{site.data.keyword.cos_short}} | The service instance that is owned by the service contains out of the box sample data sets, backups of Cloudant data and IAE bootstrap config. To learn more, see [IBM Cloud Object Storage](https://cloud.ibm.com/docs/cloud-object-storage).
IBM Cloud Resource Controller and IBM Cloud catalog | Used to load required information about your service instance and offering plan. To learn more, see [IBM Cloud Resource Controller API](https://cloud.ibm.com/apidocs/resource-controller/resource-controller).

### Dependencies to IBM service instances owned and managed by you
{: #dependencies_service_instances}

Service name | Description
--- | ---
{{site.data.keyword.cos_short}} | The service instance that is owned by the customer who controls access to the instance by using IAM policies contains customer data, SQL Query results, and metaindex information that describes value distribution in actual data objects. All data is encrypted in transit and at rest. To learn more, see [IBM Cloud Object Storage](https://cloud.ibm.com/docs/cloud-object-storage).
IBM Db2 on Cloud | Used to store SQL results in user-provided instances. To learn more, see [Db2 on Cloud](https://cloud.ibm.com/docs/Db2onCloud).
IBM Key Protect for IBM Cloud | The user-provided instances provide keys for envelope encryption of customer data in the job status database (IBM Cloudant) and passwords or apikeys for access to customer Db2. To learn more, see [IBM Key Protect for IBM Cloud](https://cloud.ibm.com/docs/key-protect).
IBM Cloud Activity Tracker with LogDNA | IBM Cloud SQL Query integrates with IBM Cloud Activity Tracker with LogDNA to forward location audit events to the IBM Cloud Activity Tracker with LogDNA service instance that is set up and owned by you. To learn more, see [IBM Cloud Activity Tracker with LogDNA](https://cloud.ibm.com/docs/Activity-Tracker-with-LogDNA).

### Other dependencies 
{: #other_dependencies}

Service name | Description
--- | ---
IBM Cloud Databases for Redis | Used as UI session store and for caching of Cloudant data. To learn more, see [IBM Cloud Databases for Redis](https://cloud.ibm.com/docs/databases-for-redis).

## Dependencies to third-party services
{: #third_party_dependencies}

Service name | Description
--- | ---
Amplitude, Segment | Amplitude and Segment are used to monitor user behavior in the IBM Cloud console, such as page hits or click-through paths. This information is used for IBM-internal marketing and data analytics purposes.
NewRelic, Slack | Those Services are used for external monitoring aggregation, problem determination and alerting.
