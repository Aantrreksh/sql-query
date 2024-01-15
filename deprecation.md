---

copyright:
  years: 2024
lastupdated: "2024-01-12"

keywords: deprecation, migration

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

<!--This topic is for full service deprecations only. Name your file `deprecation.md` and include it as the first topic in the **Get started** nav group in your `toc.yaml`. -->

# Deprecation of {{site.data.keyword.sqlquery_short}}
{: #deprecation}

<!-- The title of your H1 should be Deprecation of _service-name_, where _service-name_ is the nontrademarked short version keyref. -->

<!-- The short description should be a single, concise paragraph that contains one or two sentences and no more than 50 words. Summarize your service's high-level deprecation details highlighting the deprecation and/or EOS/EOL dates. The following is an example short description._ -->

{{site.data.keyword.sqlquery_full}} is deprecated as of 18 January 2024, and no new instances can be created or purchased starting on 18 February 2024.
The service will no longer be supported by {{site.data.keyword.cloud}} as of 18 January 2025. At the end-of-support date, any instances of 
{{site.data.keyword.sqlquery_short}} that are still running will be permanently disabled and deprovisioned.
{: shortdesc}


## Important dates
{: #deprecation-timeline}

<!-- Fill in the table based on the deprecation timeline for your product working with your PM
Deprecation date is typically when the announcement about the end of support for a currently offered product
End of marketing date is the effective date the product ceases to be active on the price list and can't be ordered or purchased
End of support effective date is the last date IBM Cloud will deliver standard support, imaging, or reload services for a given product or version
End of life date is typically when all existing instances are deprovisioned and customer data is deleted.
-->

| Stage | Date | Description |
| ---------------- | ----------------- | ------------------------------------------------------------ |
| Deprecation announcement | 18 January 2024 | Announcement of the {{site.data.keyword.sqlquery_short}} deprecation. Existing instances will continue to run. |
| End of marketing | 18 February 2024 | No new instances of {{site.data.keyword.sqlquery_short}} can be created or purchased. Existing instances will continue to run. |
| End of support   | 31 August 2024 | You can continue to use any existing instances of {{site.data.keyword.sqlquery_short}}, but support is no longer available.  |
| End of life | 18 July 2025 | Running instances of {{site.data.keyword.sqlquery_short}} are permanently disabled and deprovisioned. |
{: caption="Table 1. Deprecation timeline" caption-side="bottom"}

## Deprecation details
{: #deprecation-details}

<!-- Answer what is happening with your service, why it's being deprecated, state whether there is a replacement product or not, and if so, detail the migration path, etc. See the following example -->

Review the following details about the {{site.data.keyword.sqlquery_short}} deprecation:

* The service will be removed from the {{site.data.keyword.cloud_notm}} catalog on 18 February 2024, and no new instances can be created after that date. 
Your existing instances created before this date will continue to run until 18 January 2025.
* This deprecation means that support including updates, bug fixes, and technical support for the product is no longer available effective 18 January 2025.
* Any remaining instances will be permanently disabled and deleted as of 18 July 2025, including any user data.
* No support cases can be opened after 18 January 2025.
* An equivalent product is available for you to start migrating to today. For more information, see [Migrating to {{site.data.keyword.iae_full}}](#migrate-analytics-engine).
<!-- * An equivalent product is not available for purchase from {{site.data.keyword.IBM}} at this time. -->

## Next steps for current users
{: #deprecation-next-steps}

<!-- How can the current customers migrate to an equivalent offering, upgrade to a new version, delete their instance and data by the EOS date, and get support for additional questions or issues with the deprecation? You can use H2s in this section if multiple processes need to be documented. The following content is just an example. Fill in details that apply to your service. -->

Current users can continue using existing instances of {{site.data.keyword.sqlquery_short}} even though {{site.data.keyword.sqlquery_short}} is deprecated. 
However, it is not recommended as {{site.data.keyword.IBM}} will no longer be providing support, including bug fixes or security updates. 
You can discontinue use and migrate to {{site.data.keyword.iae_full_notm}} starting today. As of 18 July 2025, all running instances will be deleted, 
including any user data.

If you have any further questions about this deprecation, you can contact {{site.data.keyword.cloud_notm}} Support until the end of support date on DD Month YYYY.
{: note}

### Migrating to {{site.data.keyword.iae_full_notm}}
{: #migrate-analytics-engine}

<!-- For use cases where there is a new equivalent offering for customer to move to, you can detail that option here and provide links, steps, or guidance on how to stand up the new service. There's an example included below: -->

The {{site.data.keyword.iae_full_short}} service is now available that offers equivalent functionality. You can start using the 
{{site.data.keyword.iae_full_short}} service as you migrate and delete all {{site.data.keyword.sqlquery_short}} instances and data. 
For more information about {{site.data.keyword.iae_full_short}}, see [Getting started with {{site.data.keyword.iae_full_short}}](/docs/AnalyticsEngine?topic=AnalyticsEngine-getting-started).

### Deleting {{site.data.keyword.sqlquery_short}} instances and data
{: #service-delete}

Existing instances of {{site.data.keyword.sqlquery_short}} can continue to be used until 18 July 2025. 
You can start deleting your service instances and the associated data by using the following steps when you're ready. 
Following this process ensures that all instances and user information stored in the service is permanently deleted.

If you don't manually delete your instances and data before 18 July 2025, it will be done for you on this date.
{: note}

1. <!--Provide steps for a user to successfully delete all instances and any user data -->
1. <!--Provide steps for a user to successfully delete all instances and any user data -->

For more details about data deletion policies, see [Securing your data](/docs/sql-query?topic=sql-query-securing-data).
<!-- All services should be documenting data retention and deletion policies in a topic following this guidance https://test.cloud.ibm.com/docs/writing?topic=writing-data-doc-guidance and you can link here for the steps if they exist in that document. Otherwise, document the steps here.-->
