---

copyright:
  years: 2019, 2023
lastupdated: "2023-12-14"

keywords: SQL query, time series, SQL, data types

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Time series data types
{: #ts_datatypes}

{{site.data.keyword.sqlquery_full}} is deprecated. As of 18 February 2024 you can't create new instances, and access to free instances will be removed. Existing Standard plan instances are supported until 18 January 2025. Any instances that still exist on that date will be deleted.
{: deprecated}

Time series functions operate on a wide variety of special data types that are designed especially for time series data.

Time series data types are binary data types that are especially designed to hold time series data. Alternatively, you can store time series data in any BinaryType data array, such as the ones offered by Parquet, Avro, ORC, or JSON. CSV does not offer a suitable BinaryType data array for storing time series data.

Data type | Description
--- | ---
DoubleTimeSeries  | Time series with univariate observations of type Double. See the following example: `[(1, 7.2), (3, 4.5), (5, 4.5), (5, 4.6), (5, 7.1), (7, 3.9), (9, 1.1)`
DoubleArrayTimeSeries | Time series with multivariate observations of type Double. See the following example: `[(1, [7.2, 8.74]), (3, [4.5, 9.44]), (5, [4.5, 10.12]), (5, [4.6, 12.91]), (5, [7.1, 9.90]), (7, [3.9, 3.76])]`
DoubleSegmentTimeSeries | DoubleTimeSeries that is segmented. See the following example: `[(1,[(1, 7.2), (3, 4.5)]), (5,[(5, 4.5), (5, 4.6), (5, 7.1)]), (7,[(7, 3.9), (9, 1.1)])]`
DoubleArraySegmentTimeSeries |  DoubleArrayTimeSeries that is segmented. See the following example: `[(1,[(1, 7.2, 8.74), (3, 4.5, 9.44)]), (5,[(5, 4.5, 10.12), (5, 4.6, 12.91), (5, 7.1, 9.90)]), (7,[(7, 3.9, 3.76)])]`
StringTimeSeries  | Time series with univariate observations of type String. See the following example: `[(1, "a"), (3, "b"), (5, "c"), (5, "d"), (5, "e"), (7, "f"), (9, "g")]`
StringArrayTimeSeries | Time series with multivariate observations of type String. See the following example: `[(1, ["a", "xq"]), (3, ["b", "zr"]), (5, ["c", "ms"]), (5, ["d", "rt"]), (5, ["e", "wu"]), (7, ["f", "vv"]), (9, ["g", "zw"])]`
StringSegmentTimeSeries | StringTimeSeries that is segmented. See the following example: `[(1,[(1, "a"), (3, "b")]), (5,[(5, "c"), (5, "d"), (5, "e")]), (7,[(7, "f"), (9, "g")])]`
StringArraySegmentTimeSeries | StringArrayTimeSeries that is segmented. See the following example: `[(1,[(1, ["a", "xq"]), (3, ["b", "zr"])]), (5,[(5, ["c", "ms"]), (5, ["d", "rt"]), (5, ["e", "wu"])]), (7, [(7, ["f", "vv"]), (9, ["g", "zw"])])]`
{: caption="Table 1. Time series data types" caption-side="bottom"}

Pseudo data types are not actual data types, but are placeholders that are used by the documentation to represent any of several time series data types.

Placeholder | Description
--- | ---
TimeSeries | Represent any of the following data types: - DoubleTimeSeries \n - DoubleArrayTimeSeries \n - DoubleSegmentTimeSeries \n - DoubleArraySegmentTimeSeries \n - StringTimeSeries \n - StringArrayTimeSeries \n - StringSegmentTimeSeries \n - StringArraySegmentTimeSeries
SegmentTimeSeries | Represent any of the following data types: - DoubleSegmentTimeSeries \n - DoubleArraySegmentTimeSeries \n - StringSegmentTimeSeries \n - StringArraySegmentTimeSeries
ArrayTimeSeries | Represent any of the following data types: - DoubleArrayTimeSeries \n - DoubleArraySegmentTimeSeries \n - StringArrayTimeSeries \n - StringArraySegmentTimeSeries
{: caption="Table 2. Pseudo data types" caption-side="bottom"}

Data type | Description
--- | ---
TRS | A [time reference system (TRS)](/docs/sql-query?topic=sql-query-TRS) defines the granularity of time series timeticks, and defines a start time that maps a particular time series timetick to a corresponding moment in time.
{: caption="Table 3. Time reference system data type" caption-side="bottom"}
