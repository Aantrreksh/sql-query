---

copyright:
  years: 2019, 2023
lastupdated: "2023-12-14"

keywords: SQL query, time series, SQL, analyze, string matching, temporal join, align, examples

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Using SQL statements to process time series data
{: #using_sql}

{{site.data.keyword.sqlquery_full}} is deprecated. As of 18 February 2024 you can't create new instances, and access to free instances will be removed. Existing Standard plan instances are supported until 18 January 2025. Any instances that still exist on that date will be deleted.
{: deprecated}

You can call time series functions from within SQL statements to manipulate and analyze time series data.

- [Examples of common time series queries](/docs/services/sql-query?topic=sql-query-examples_common) illustrate commonly used time series functions.
- With [string matching](/docs/services/sql-query?topic=sql-query-string_matching) you can match the values of a string time series against a string sequence (sequence matching) or against a set of strings (set matching).
- [Using a temporal join or align](/docs/services/sql-query?topic=sql-query-temporal_align)

   - A temporal join produces a single array time series based on the observations of the two input time series.
   - A temporal align produces two output time series with identical timeticks. In both cases, an interpolator is used to complete missing values.
