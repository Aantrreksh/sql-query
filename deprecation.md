---

copyright:
  years: 2024
lastupdated: "2024-03-15"

keywords: deprecation, migration

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}



# Deprecation of {{site.data.keyword.sqlquery_short}}
{: #deprecation}





{{site.data.keyword.sqlquery_full}} is deprecated as of 18 January 2024, and no new instances can be created or purchased starting on 18 February 2024.
The service will no longer be supported by {{site.data.keyword.cloud}} as of 18 January 2025. At the end-of-support date, any instances of 
{{site.data.keyword.sqlquery_short}} that are still running will be permanently disabled and deprovisioned.
{: shortdesc}

## Important dates
{: #deprecation-timeline}



| Stage | Date | Description |
| ---------------- | ----------------- | ------------------------------------------------------------ |
| Deprecation announcement | 18 January 2024 | Announcement of the {{site.data.keyword.sqlquery_short}} deprecation. Existing instances will continue to run. |
| End of marketing | 18 February 2024 | No new instances of {{site.data.keyword.sqlquery_short}} can be created or purchased. Existing instances will continue to run. |
| End of support   | 18 January 2025 | Support is no longer available. Running instances of {{site.data.keyword.sqlquery_short}} are permanently disabled and deprovisioned. |
{: caption="Table 1. Deprecation timeline" caption-side="bottom"}

## Deprecation details
{: #deprecation-details}



Review the following details about the {{site.data.keyword.sqlquery_short}} deprecation:

* The service will be removed from the {{site.data.keyword.cloud_notm}} catalog on 18 February 2024, and no new instances can be created after that date. 
Your existing instances created before this date will continue to run until 18 January 2025.
* This deprecation means that support including updates, bug fixes, and technical support for the product is no longer available effective 18 January 2025.
* Any remaining instances will be permanently disabled and deleted as of 18 January 2025, including any user data.
* No support cases can be opened after 18 January 2025.
* An equivalent product is available for you to start migrating to today. For more information, see [Migrating to {{site.data.keyword.iae_full}}](#migrate-analytics-engine).


## Next steps for current users
{: #deprecation-next-steps}



Current users can continue using existing instances of {{site.data.keyword.sqlquery_short}} even though {{site.data.keyword.sqlquery_short}} is deprecated. 
We encourage users to discontinue use and to immediately migrate their workloads to {{site.data.keyword.iae_full_notm}}, as support is removed on 18 January 2025. As of 18 January 2025, all running instances will be deleted, including any user data.

If you have any further questions about this deprecation, you can contact {{site.data.keyword.cloud_notm}} Support until the end of support date on 18 January 2025.
{: note}

### Migrating to {{site.data.keyword.iae_full_notm}}
{: #migrate-analytics-engine}



The {{site.data.keyword.iae_short}} service is available and can be used as an alternative solution. 
You can start using the {{site.data.keyword.iae_short}} service as you migrate and delete all {{site.data.keyword.sqlquery_short}} instances and data. 
For more information about {{site.data.keyword.iae_short}}, see [Getting started with {{site.data.keyword.iae_short}}](/docs/AnalyticsEngine?topic=AnalyticsEngine-getting-started).

{{site.data.keyword.sqlquery_short}} query format is not accepted by {{site.data.keyword.iae_short}} and you need to follow the [Spark SQL syntax](https://spark.apache.org/docs/latest/sql-ref-syntax.html) to prepare the SQL format accordingly.
{: note}

#### Spark execution
{: #spark-execution}

The batch query script helps to read the data from the Cloud {{site.data.keyword.cos_short}} bucket, execute the query, and write it back to the Cloud {{site.data.keyword.cos_short}} bucket. The streaming script helps to stream the real time data from an {{site.data.keyword.messagehub}} topic to a Cloud {{site.data.keyword.cos_short}} bucket. The sample Python scripts for batch and streaming jobs can be updated or modified based on your requirement.

**Before you begin:**

1. Create an instance of {{site.data.keyword.iae_short}}.
2. Create an instance of Cloud {{site.data.keyword.cos_short}} and a bucket to upload the data and the required script.

**Execute the SQL batch query:**

1. Locate the [Python script](https://github.ibm.com/SqlServiceWdp/tools-for-ops/blob/master/spark-app/read_write_sql_query_data.py) that will execute in the {{site.data.keyword.iae_short}} instance.
2. Upload the Python script and data file into the Cloud {{site.data.keyword.cos_short}} bucket.
3. Find the {{site.data.keyword.iae_short}} API to execute the query:

	 1. In the UI, go to the {{site.data.keyword.iae_short}} details.
	 2. Click on **service credentials**.
	 3. Get the application_api endpoint.<br>
      For example, `https://api.us-south.ae.cloud.ibm.com/v3/analytics_engines/<instance_id>/spark_applications`.
      <br>

         - Method: POST
         - Authorization: Pass bearer token
         - Headers: Content-type application/JSON



                  ```
                  "application_details": {

                  "conf": {

                  "spark.hadoop.fs.cos.service.endpoint": < Get the direct endpoint from cos bucket configuration Endpoints. It should be similer to --> "s3.direct.us-     south.cloud-object-storage.appdomain.cloud">,

                  "spark.hadoop.fs.cos.service.iam.api.key": <Changeme_with_api_key>

                    },

                  "application": <chamge_me_with_cos_bucket_path_with_data_file similar to --> "cos://cos-de-test.service/de_sql_query_app.py">,

                  "runtime": {

                  "spark_version": <change_me_with_runtime like --> "3.3">

                  ```
		              {: codeblock}
		  
   
3. API response structure:

   ```
    "id": "a678f50b-dfb6-45a3-b8a1-4***89ca***c",

    "state": "accepted"
   ```
   {: codeblock}

4. Call the GET endpoint to check the state of job.
   The API endpoint stays the same to get the list of jobs. Alternatively, you can include the jobID at the end to get the state of a specific job.

   - METHOD: GET
   - Authorization: Pass bearer token 
   - Headers: Content-type application/JSON

5. Get call for the response structure:

   ```
   "applications": [

        {

            "id": "a678f50b-dfb6-45a3-b8a1-4***89ca***c",

            "state": "accepted",

            "submission_time": "2024-01-25T10:16:01.522Z",

            "runtime": {

                "spark_version": "3.3"

            }

        },

        {

            "id": "c93d4b3a-ef47-4d98-bab0-***f39****5a",

            "spark_application_id": "spark-application-1706173131046",

            "spark_application_name": "read-write-data-to-cos-bucket",

            "state": "finished",

            "start_time": "2024-01-25T08:58:52Z",

            "finish_time": "2024-01-25T08:58:52Z",

            "end_time": "2024-01-25T08:58:52Z",

            "submission_time": "2024-01-25T08:57:48.425Z",

            "auto_termination_time": "2024-01-28T08:58:52Z",

            "runtime": {

                "spark_version": "3.3"

            }

        }

    ]
    ```
    {: codeblock}
    
6. CURL commands to execute SQL query:

   - Example to submit an application:
   
     ```
     curl -X POST --location --header "Authorization: Bearer $token"   --header "Accept: application/json"   --header "Content-Type: application/json"   --data '{

      "application_details": {

       "conf": {

         "spark.hadoop.fs.cos.service.endpoint": "s3.direct.us-south.cloud-object-storage.appdomain.cloud",

         "spark.hadoop.fs.cos.service.iam.api.key": "changeme_with_apikey"

       },

       "application": "cos://cos-de.service/de_sql_query_app.py",

       "runtime": {

         "spark_version": "3.3"

     ```
     {: codeblock}

   - Example to get an application: 

     ```
     curl -X GET --location --header "Authorization: Bearer $token"   --header "Accept: application/json"   --header "Content-Type: application/json" "https://api.us-      south.ae.cloud.ibm.com/v3/analytics_engines/<instance_id>/spark_applications/<application_id>"

     ```
     {: codeblock}

**Execute the SQL streaming query:**

1. Locate the [Python script](https://github.ibm.com/SqlServiceWdp/tools-for-ops/blob/master/spark-app/streaming_query.py) that will execute in the {{site.data.keyword.iae_short}} instance.
2. Upload the Python script into the Cloud {{site.data.keyword.cos_short}} bucket.
3. Find the {{site.data.keyword.iae_short}} API to execute the query:

	 1. In the UI, go to the {{site.data.keyword.iae_short}} details.
	 2. Click on **service credentials**.
	 3. Get the application_api endpoint.<br>
      For example, `https://api.us-south.ae.cloud.ibm.com/v3/analytics_engines/<instance_id>/spark_applications`.
      <br>

      - Method: POST
      - Authorization: Pass bearer token
      - Headers: Content-Type application/json

                  ```

                  {

                      "application_details": {

                    "application": <chamge_me_with_cos_bucket_path_with_data_file similer to --> "cos://cos-de-test.service/streaming-query-test.py">,

                    "conf": {

                        "spark.cos.url": <chamge_me_with_cos_bucket_path --> "cos://cos-de-test.service">,

                        "spark.hadoop.fs.cos.service.endpoint": < Get the direct endpoint from cos bucket configuration Endpoints. It should be similer to --> "s3.direct.us-south.cloud-object-storage.appdomain.cloud">,

                        "spark.hadoop.fs.cos.service.iam.api.key": <Changeme_with_api_key>,

                        "spark.kafka_bootstrap_servers": <chamge_me_with_beroker_server_list --> "broker-5-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-0-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-3-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-2-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-4-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-1-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093">,

                        "spark.kafka_topic": <Changeme_with_topic_name>,

                        "spark.trigger_time_ms": "30000"

                    },

                    "packages": "org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.2"

                      }

                  }
                  ```
                  {: codeblock}

3. API response structure:

   	```
    {

        "id": "8fad0b9d-72a4-4e5f-****-fa1f9dc***bc",

        "state": "accepted"

    }
    ```
    {: codeblock}

4. Call the GET endpoint to check the state of job.
   The API endpoint stays the same to get the list of jobs. Alternatively, you can include the jobID at the end to get the state of a specific job.

   - METHOD: GET
   - Authorization: Pass bearer token 
   - Headers: Content-type application/json

5. Get call response structure:

	```
	"applications": [

		{

		    "id": "8fad0b9d-72a4-4e5f-****-fa1f9dc***bc",

		    "spark_application_id": "spark-application-******33082**",

		    "spark_application_name": "es-spark",

		    "state": "running",

		    "start_time": "2024-02-28T12:28:29Z",

		    "spark_ui": "https://spark-console.us-south.ae.cloud.ibm.com/v3/analytics_engines/e27f8478-a944-4b08-8cf4-a477883d623e/spark_applications/8fad0b9d-72a4-4e5f-****-fa1f9dc***bc/spark_ui/",

		    "submission_time": "2024-02-28T12:27:17.202Z",

		    "auto_termination_time": "2024-03-02T12:28:29Z",

		    "runtime": {

			"spark_version": "3.3"

		    }

		}

	    ]
	    ```
	    {: codeblock}

6. CURL commands to execute SQL query:

   - Example to submit an application:
   
     ```
      curl -X POST --location --header "Authorization: Bearer $token"   --header "Accept: application/json"   --header "Content-Type: application/json"   --data '{

          "application_details": {

        "application": <chamge_me_with_cos_bucket_path_with_data_file similer to --> "cos://cos-de-test.service/streaming-query-test.py">,

        "conf": {

            "spark.cos.url": <chamge_me_with_cos_bucket_path --> "cos://cos-de-test.service">,

            "spark.hadoop.fs.cos.service.endpoint": < Get the direct endpoint from cos bucket configuration Endpoints. It should be similer to --> "s3.direct.us-south.cloud-object-storage.appdomain.cloud">,

            "spark.hadoop.fs.cos.service.iam.api.key": <Changeme_with_api_key>,

            "spark.kafka_bootstrap_servers": <chamge_me_with_beroker_server_list --> "broker-5-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-0-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-3-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-2-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-4-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093,broker-1-4j8ch21jxy0k5y6q.kafka.svc04.us-south.eventstreams.cloud.ibm.com:9093">,

            "spark.kafka_topic": <Changeme_with_topic_name>,

            "spark.trigger_time_ms": "30000"

        },

        "packages": "org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.2"

          }

        }'   "https://api.us-south.ae.cloud.ibm.com/v3/analytics_engines/<instance_id>/spark_applications"
        ```
          {: codeblock}

   - Example to get an application: 

     ```
	  curl -X GET --location --header "Authorization: Bearer $token"   --header "Accept: application/json"   --header "Content-Type: application/json" "https://api.us-south.ae.cloud.ibm.com/v3/analytics_engines/<instance_id>/spark_applications/<application_id>"
     ```
     {: codeblock}

For more information, see the [IBM Analytics Engine API](/apidocs/ibm-analytics-engine-v3#get-application-state) and the [IBM Analytics Cloud CLI](/docs/AnalyticsEngine?topic=AnalyticsEngine-using-cli#ae-cli-prereqs).


### Deleting {{site.data.keyword.sqlquery_short}} instances and data
{: #service-delete}

Existing instances of {{site.data.keyword.sqlquery_short}} can continue to be used until 18 January 2025. 
You can start deleting your service instances and the associated data when you're ready. 
Following this process ensures that all instances and user information stored in the service is permanently deleted.

If you don't manually delete your instances and data before 18 January 2025, these will be deleted on this date.
{: note}

For more details about data deletion policies, see [Securing your data](/docs/sql-query?topic=sql-query-securing-data).

