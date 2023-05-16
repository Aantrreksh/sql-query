---

copyright:
  years: 2023
lastupdated: "2023-05-16"

keywords: json logs, stored as text

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Querying JSON logs
{: #query-json}

To query JSON data where no schema can be inferred, for example, in logs, use the option to read the data `AS TEXT`.
The input is then read without inferring any schema and each line is put into a single column named `value`.

To see how the data is structured, execute a basic select query.

```sql
SELECT *
FROM cos://us-geo/sql/LogDNA/_year=2019/_dayofyear=226/_hour=14 STORED AS TEXT
LIMIT 5
```

You can further extract fields by using the options `get_json_object` or `regexp_extract`.
You can then filter data on the extracted columns.

```sql
WITH logs (
  SELECT get_json_object(value, "$._source._host") as host,
  from_unixtime(get_json_object(value, "$._source._ts") / 1000, 'yyyy-MM-dd HH:mm:ss') as timestamp,
  get_json_object(value, "$._source._file") as file,
  get_json_object(value, "$._source.request_method") as request_method,
  get_json_object(value, "$._source.request_uri") as request_uri
  FROM cos://us-geo/sql/LogDNA/_year=2019/_dayofyear=226/_hour=14 STORED AS TEXT
)
SELECT *
FROM logs
WHERE request_uri LIKE "/iae_instances/%"
ORDER BY timestamp
```

To get the logs for a specific timeframe, use the following query.

```sql
WITH logs (
  SELECT get_json_object(value, "$._source._host") as host,
  get_json_object(value, "$._source._ts") / 1000 as unix_timestamp,
  from_unixtime(get_json_object(value, "$._source._ts") / 1000, 'yyyy-MM-dd HH:mm:ss') as timestamp,
  get_json_object(value, "$._source._file") as file,
  get_json_object(value, "$._source.request_method") as request_method,
  get_json_object(value, "$._source.request_uri") as request_uri
  FROM cos://us-geo/sql/LogDNA/_year=2019/_dayofyear=226/_hour=13 STORED AS TEXT
)
SELECT *
FROM logs
WHERE minute(from_unixtime(unix_timestamp)) >= 40 AND minute(from_unixtime(unix_timestamp)) <= 44
ORDER BY timestamp
```
