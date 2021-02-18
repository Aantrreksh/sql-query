---

copyright:
  years: 2020, 2021
lastupdated: "2021-01-18"

keywords: best practice, faq, sql query

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# FAQ
{:faq}

## Is {{site.data.keyword.sqlquery_full}} transaction safe?
{:transaction_safe}

{{site.data.keyword.sqlquery_short}} does not support INSERT, UPDATE or DELETE operations, while it can be used 
to create {{site.data.keyword.cos_short}} objects using the INTO clause. For the created objects in {{site.data.keyword.cos_short}}, the question arises if this operation is transaction safe and ACID compliant?
In other words, if you create an object in {{site.data.keyword.cos_short}} using {{site.data.keyword.sqlquery_short}}, can you assume that this creation is transaction safe and if anything happens before the creation is done, it will be rolled back?

The answer is {{site.data.keyword.cos_full}} does not support transactions, but an object is rolled back if you are creating it with a single SQL query job on a non-partitioned object on {{site.data.keyword.cos_short}}, because {{site.data.keyword.cos_short}} itself does object write in an atomic fashion. If you want to write complex hierarchies of objects with a single SQL job, then a) it can happen that the job fails half way and only part of the objects are written, and b) during job execution some objects are already visible while others are still in process to be written.
For the latter scenario, we recommend using Hive-style partitioned tables, meaning that the SQL job writes a new set of objects into a new {{site.data.keyword.cos_short}} prefix location. This does not affect anything in the Hive-style partitioned table. Only when you then also issue an `ALTER TABLE … ADD PARTITION` with the newly written object location, the data will be made available in the Hive-style partitioned table. That ALTER TABLE DDL is in fact also an atomic operation.

## How to handle very large time series data sets?
{:large_ts}

When using time-series queries, in general, the more time series that exist, the better the parallelism.

Example:

```
select 
	key, 
	ts
from table 
using time_series_format(key="key", timetick="time_tick", value="amount") in ts
```

The above query creates one time series per key, and partitions the data based on the key. Anytime a query is run against "ts", 
it will be run in parallel across time series. The issue arises if "ts" is very large and thus does not fit in the memory of one machine. To mitigate this, modify your key as follows:

First, add a date or any granularity of time to your key (in order to generate a smaller time series):

```
select
	concat(cast(to_date(time_tick) as str), "-", key) as date_and_key
	time_tick,
	amount
from table
into table2
```

Second, create your time series with the new `date_and_key` key.

```
select
	date_and_key,
	ts
from table2
using time_series_format(key="date_and_key", timetick="time_tick", value="amount") in ts
```

The final queries will better utilize parallelism by providing a larger set of keys. 
In this case, you will not only have the set of unique keys, but the dates associated with each key, as well. 
By doing so, each time series will be much smaller, and have a better chance of fitting in memory.

## How to avoid exhausting allocated resources/out of memory errors (OOM)?
{:oom}

The most common cause for exhausting allocated resources or out of memory errors is the structure of the query or the layout of the data. The following best practices help to avoid such issues:

- Prepare your data first. Transform input formats, such as .csv or .json to a compressed format, such as Parquet.
- Write results into [partitioned result sets](/docs/sql-query?topic=sql-query-sql-reference#partitionedClause). It is recommended to start with a double digit partition value. An optimal single object size is about 128 MB. For more details, see [the following blog on big data layout](https://www.ibm.com/cloud/blog/big-data-layout).
- Use Parquet as the output format (STORED AS clause) instead of .csv or .json. Avoid working with Gzip objects.
Depending on how a join clause is written, it can cause memory-intensive operations. Avoid using functions in the join clause, such as trim. It is better to cleanse the data first with a preparation step and then to use the cleansed data in the join operation, without needing the functions.
- If you already follow the recommendations above and still get the OOM, try breaking down complex statements into multiple SQL statements.
- When using timeseries functions, look at the following [FAQ](https://cloud.ibm.com/docs/sql-query?topic=sql-query-faq).
