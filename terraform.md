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

You can create a {{site.data.keyword.sqlquery_full}} instance with the standard ibm_resource_instance resource in Terraform.

```
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
```

You can also create a {{site.data.keyword.sqlquery_short}} instance with user-managed key encryption.

```
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
```

You cannot change the encryption parameters once the instance is created.
{: note}

