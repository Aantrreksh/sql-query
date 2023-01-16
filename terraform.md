---

copyright:
  years: 2023
lastupdated: "2023-01-13"

keywords: SQL query, Terraform

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Creating a new instance with Terraform
{: #terraform}

Terraform on IBM Cloud® enables predictable and consistent provisioning of IBM Cloud services so that you can rapidly build complex, multitiered cloud environments following Infrastructure as Code (IaC) principles. Similar to using the IBM Cloud CLI or API, you can automate the provisioning and deletion of your {{site.data.keyword.sqlquery_full}} instances by using HashiCorp Configuration Language (HCL).

## Step 1. Install the Terraform CLI and configure the IBM Cloud Provider plug-in

Follow the [Terraform on {{site.data.keyword.cloud_notm}} getting started tutorial](/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-getting-started) to install the Terraform CLI and configure the {{site.data.keyword.cloud_notm}} Provider plug-in for Terraform. The plug-in abstracts the {{site.data.keyword.cloud_notm}} APIs that are used to provision, update, or delete {{site.data.keyword.sqlquery_full}} service instances and resources.

## Step 2. Work with Data Engine resources in Terraform

The following is an example of creating a Data Engine service instance in Terraform.

1. Create a Terraform configuration file that is named `main.tf`. In this file, you declare the {{site.data.keyword.sqlquery_full}} service instance that you want to provision. The following example creates a {{site.data.keyword.sqlquery_full}} service instance that is named `My Data Engine Instance` in the `us-south` region.

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
2. Provide the API key 

  Referencing credentials from an environment variable. Set the environment variables on your local machine.
  ```
  export IC_API_KEY="<ibmcloud_api_key>"
  ```
  See Terraform documentation for further options to provide credentials.

3. Initialize the Terraform CLI. 

   ```
   terraform init
   ```
   
4. Create a Terraform execution plan. The Terraform execution plan summarizes all the actions that need to be run to create the {{site.data.keyword.sqlquery_full}} service instance in your account. 

   ```
   terraform plan
   ```
   
5. Create the {{site.data.keyword.sqlquery_full}} service instance in the {{site.data.keyword.cloud_notm}}.

   ```
   terraform apply
   ```
   
6. From the [{{site.data.keyword.cloud_notm}} resource dashboard](https://cloud.ibm.com/resources){: external}, find the {{site.data.keyword.sqlquery_full}} service instance that you created.

7. Optional: User-managed key encryption is desired

  You can also create a {{site.data.keyword.sqlquery_short}} instance with user-managed key encryption. You need the instance id and the rootkey id of a {{site.data.keyword.keymanagementserviceshort}} instance. Add the parameter section as shown below into the main.tf file.

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

  For user-managed key encryption, you need a standard plan. You cannot change the encryption parameters once the instance is created. {: note}

  Then give the new {{site.data.keyword.sqlquery_short}} instance [access](/docs/account?topic=account-serviceauth) to your {{site.data.keyword.keymanagementserviceshort}} key:

  resource "ibm_iam_authorization_policy" "iam_authorization_policy" {
    source_service_name         = "sql-query"
    source_resource_instance_id = ibm_resource_instance.resource_instance.id
    target_service_name         = "kms"
    target_resource_instance_id = "<kms_instance_id>"
    roles                       = ["Reader"]
    description                 = "Service-to-service authorization: Data Engine access to Key Protect"
  }
