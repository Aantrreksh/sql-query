#!/bin/bash

echo "This script validates your Key Protect setup from command line by creating a custom test key, retrieving it, verifying its correct content and then deleting it again. It takes one optional argument, which is the region name to use for looking for a Key Protect instance in your account. It defaults to \"us-south\"."

if [[ $# -eq 0 ]]; then
	region="us-south"
else
	region=$1
fi

token_raw=`ibmcloud iam oauth-tokens`
if [[ $? -ne 0 ]]; then
	echo "You are not logged on to IBM Cloud. Run \"ibmcloud login --sso\" first and rerun this script."
	exit 1
fi
token=`echo $token_raw | sed 's/IAM token: //g'`

ibmcloud plugin list | grep key-protect
if [[ $? -ne 0 ]]; then
	echo "Key Protect plugin is not installed in IBM Cloud CLI. Install usigg \"ibmcloud plugin install key-protect -r 'IBM Cloud'\"."
	exit 1
fi

echo "Setting key protect region to \"$region\""
ibmcloud kp region-set $region

kp_instances=`ibmcloud resource service-instances --long --service-name kms | grep active | grep service_instance | grep $region`
if [[ $? -ne 0 ]]; then
	echo "Cannot find a Key Protect instance in your account in region $region."
	exit 1
fi

IFS=' ' read -r -a array <<< "$kp_instances"
kp_instance_id=`echo "${array[1]}"`
ibmcloud kp list -c -i $kp_instance_id

validation_key_name="validation_key_$(uuidgen)"

validation_content="validation content"
ibmcloud kp create $validation_key_name -i $kp_instance_id -s -k `echo -ne "$validation_content" | base64`
if [[ $? -ne 0 ]]; then
	echo "Creating validation key resulted in non-0 return code. Exiting."
	exit 1
fi

validation_key=`ibmcloud kp list -c -i $kp_instance_id | grep $validation_key_name`
IFS=' ' read -r -a array <<< "$validation_key"
validation_key_id=`echo "${array[0]}"`

retrieved_validation_content=`curl -X GET "https://$region.kms.cloud.ibm.com/api/v2/keys/$validation_key_id" -H "accept: application/vnd.ibm.collection+json" -H "authorization: $token" -H "bluemix-instance: $kp_instance_id" | jq -r '.resources[].payload' | base64 --decode`

ibmcloud kp delete -i $kp_instance_id $validation_key_id

if [[ "$retrieved_validation_content" != "$validation_content" ]]; then
	echo "There is a problem. The retrieved test key content \"$retrieved_validation_content\" is different from the input test key content \"$validation_content\"."
else
	echo "Successfully verified that the test key can be created and the returned content is the same as the input content."
fi
