---

copyright:
  years: 2023
lastupdated: "2023-01-11"

keywords: SQL query, Terraform

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Creating a new instance with Terraform
{: #terraform}

there is no special resource for Data Engine in the terraform ibm provider, however, you can create a Data Engine instance with the standard ibm_resource_instance resource:

data "ibm_resource_group" "group" {
 name = "Default"
}
resource "ibm_resource_instance" "resource_instance" {
 name       = "My Data Engine Instance"
 service      = "sql-query"
 plan       = "standard"
 location     = "us-south"
 resource_group_id = data.ibm_resource_group.group.id
}

You can indeed create a data engine instance with user-managed key encryption, for example:
data "ibm_resource_group" "group" {
name = "Default"
}
resource "ibm_resource_instance" "resource_instance" {
name = "My Data Engine Instance"
service = "sql-query"
plan = "standard"
location = "us-south"
resource_group_id = data.ibm_resource_group.group.id
parameters = {
customerKeyEncrypted: true,
kms_instance_id: jsonencode({ "guid" = "38f4c306-6009-4015-bf90-ccfe300ec11e", "url" = "https://us-south.kms.cloud.ibm.com" }),
kms_rootkey_id: "58f0252c-8b60-4429-9d14-1765800d0043"
}
}
Note that you cannot change the encryption parameters once the instance is created.

____________________________________________________________________

Jupyter Notebooks are web-based environments for interactive computing. You can run small pieces of code that process your data, and you can immediately view the results of your computation. Notebooks include all of the building blocks that you need to work with data.

Check out the following Notebooks to get familiar with {{site.data.keyword.sqlquery_full}}:

- Learn how to use the {{site.data.keyword.sqlquery_short}} API to run SQL statements in a programmatic way for data analytics and ETL, by using the ibmcloudsql Python library in [Using {{site.data.keyword.sqlquery_notm}}](https://dataplatform.cloud.ibm.com/exchange/public/entry/view/e82c765fd1165439caccfc4ce8579a25?context=cpdaas). The Notebook also demonstrates the library features and how to combine {{site.data.keyword.sqlquery_short}} with visualization libraries, such as PixieDust. 

- Learn how to combine {{site.data.keyword.sqlquery_short}} with visualization libraries, such as PixieDust, folium, or matplotlib to explore particulate matter data in [Explore particulate matter data by using {{site.data.keyword.sqlquery_short}}](https://eu-gb.dataplatform.cloud.ibm.com/exchange/public/entry/view/5d686c16d14491f4c3997b67fe11506d).
