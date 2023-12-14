---

copyright:
  years: 2023
lastupdated: "2023-12-14"

keywords: SQL query, Terraform

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Creating a new instance with Terraform
{: #terraform}

{{site.data.keyword.sqlquery_full}} is deprecated. As of 18 February 2024 you can't create new instances, and access to free instances will be removed. Existing Standard plan instances are supported until 18 January 2025. Any instances that still exist on that date will be deleted.
{: deprecated}

Terraform on IBM Cloud® enables predictable and consistent provisioning of IBM Cloud services, so that you can rapidly build complex, multitiered cloud environments following Infrastructure as Code (IaC) principles. Similar to using the IBM Cloud CLI or API, you can automate the provisioning and deletion of your {{site.data.keyword.sqlquery_short}} instances by using HashiCorp Configuration Language (HCL).

## Install the Terraform CLI and configure the IBM Cloud Provider plug-in

Follow the [Terraform on {{site.data.keyword.cloud_notm}} getting started tutorial](/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-getting-started) to install the Terraform CLI and configure the {{site.data.keyword.cloud_notm}} Provider plug-in for Terraform. The plug-in abstracts the {{site.data.keyword.cloud_notm}} APIs that are used to provision, update, or delete {{site.data.keyword.sqlquery_short}} service instances and resources.

## Work with {{site.data.keyword.sqlquery_short}} resources in Terraform

The following steps guide you through an example of creating a {{site.data.keyword.sqlquery_short}} service instance in Terraform.

1. Create a Terraform configuration file that is named *main.tf*. In this file, you declare the {{site.data.keyword.sqlquery_short}} service instance that you want to provision. The following example creates a {{site.data.keyword.sqlquery_short}} service instance that is named *My Data Engine Instance* in the *us-south* region.

    ```
    terraform {
      required_version = ">=1.0.0, <2.0"
      required_providers {
        ibm = {
          source = "IBM-Cloud/ibm"
        }
      }
    }
    provider "ibm" {
    }
    data "ibm_resource_group" "group" {
      name = "default"
    }
    resource "ibm_resource_instance" "resource_instance" {
      name              = "My Data Engine Instance"
      service           = "sql-query"
      plan              = "standard"
      location          = "us-south"
      resource_group_id = data.ibm_resource_group.group.id
    }
    ```


2. Provide the API key to allow Terraform to make the requested changes to your {{site.data.keyword.cloud_notm}} instance. You can provide the API key as environment variable in the session where you also do the Terraform calls.

    ```
    export IC_API_KEY="<ibmcloud_api_key>"
    ```

    See the [Terraform documentation](/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-about) for further options to provide credentials.


3. Initialize the Terraform CLI. 

    ```
    terraform init
    ```

   
4. Create a Terraform execution plan. The Terraform execution plan summarizes all the actions that have to be run to create the {{site.data.keyword.sqlquery_short}} service instance in your account. 

    ```
    terraform plan
    ```


5. Create the {{site.data.keyword.sqlquery_short}} service instance in the {{site.data.keyword.cloud_notm}}.

    ```
    terraform apply
    ```


6. In the [{{site.data.keyword.cloud_notm}} resource dashboard](https://cloud.ibm.com/resources){: external}, find the {{site.data.keyword.sqlquery_short}} service instance that you created.
7. You can also create a {{site.data.keyword.sqlquery_short}} instance with user-managed key encryption (optional). You need the instance ID and the rootkey ID of a {{site.data.keyword.keymanagementserviceshort}} instance. Add the following parameter section into the *main.tf* file.

    ```
    resource "ibm_resource_instance" "resource_instance" {
      name              = "My Data Engine Instance"
      service           = "sql-query"
      plan              = "standard"
      location          = "us-south"
      resource_group_id = data.ibm_resource_group.group.id
      parameters = {
        customerKeyEncrypted: true,
        kms_instance_id: jsonencode({ "guid" = "<kms_instance_guid>", "url" = "https://us-south.kms.cloud.ibm.com" }),
        kms_rootkey_id: "<kms_rootkey_id>"
      }
    }
    ```

    For user-managed key encryption, you need a Standard plan. You cannot change the encryption parameters once the instance is created. 
    {: note}

    Next, give the new {{site.data.keyword.sqlquery_short}} instance [access](/docs/account?topic=account-serviceauth) to your {{site.data.keyword.keymanagementserviceshort}} key.

    ```
    resource "ibm_iam_authorization_policy" "iam_authorization_policy" {
      source_service_name           = "sql-query"
      source_resource_instance_id = ibm_resource_instance.resource_instance.id
      target_service_name         = "kms"
      target_resource_instance_id = "<kms_instance_id>"
      roles                       = ["Reader"]
      description                 = "Service-to-service authorization: Data Engine access to Key Protect"
    }
    ```

