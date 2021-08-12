---

copyright:
  years: 2019, 2021
lastupdated: "2021-03-03"

keywords: SQL query, time series, SQL, temporal join, align

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# Using a temporal join or align
{: #temporal_align}

A temporal join produces a single array time series based on the observations of the two input time series. 
A temporal align produces two output time series with identical timeticks. In both cases, an interpolator is used to complete missing values.

## Temporal join
{: #temporal_join}

A *temporal join* is a [join operation](https://en.wikipedia.org/wiki/Join_(SQL) that operates on time series data. An interpolator is used to complete missing values.

For example, consider the following two input time series, which are stored in table column with the names table1.col7 and table2.col8:  

`table1.col7: [(1, 1.2), (3, 2.2), (5, 3.6), (7, 4.4), (9, 5.4)]`
`table2.col8: [(1, 2.0), (2, 2.8), (4, 3.4), (6, NaN), (9, 8.0)]`  

-   The following SELECT statement inner-joins the two input DoubleTimeSeries to produce the following output DoubleTimeSeries:  

    ```
    SELECT TS_INNER_JOIN(table1.col7, table2.col8)
    ```

    Result:  

    `[(1, [1.2, 2.0]), (9, [5.4, 8.0])]`  

-   The following SELECT statement left-joins the two input DoubleTimeSeries to produce the following output DoubleArrayTimeSeries:  

    ```
    SELECT TS_LEFT_JOIN(table1.col7, table2.col8, TS_INTERPOLATOR_PREV(-1.0))
    ```

    Result:  

    `[(1, [1.2, 2.0]), (3, [2.2, 2.8]), (5, [3.6, 3.4]), (7, [4.4, NaN]), (9, [5.4, 8.0])]`  

    Where no matching timetick exists in the right table, this statement uses an interpolator of type TS_INTERPOLATOR_PREV to generate       the missing value.

-   The following SELECT statement left-outer-joins the two input DoubleTimeSeries to produce the following output                           DoubleArrayTimeSeries:  

    ```
    SELECT TS_LEFT_OUTER_JOIN(table1.col7, table2.col8, TS_INTERPOLATOR_PREV(-1.0))
    ```

    Result:  

    `[(3, [2.2, 2.8]), (5, [3.6, 3.4]), (7, [4.4, NaN])]`  

    Where no matching timetick exists in the right table, this statement uses an interpolator of type TS_INTERPOLATOR_PREV to generate       the missing value.  

-   The following SELECT statement full-joins the two input DoubleTimeSeries to produce the following output DoubleArrayTimeSeries:  

    ```
    SELECT TS_FULL_JOIN(table1.col7, table2.col8, TS_INTERPOLATOR_NEAREST(-1.0))
    ```

    Result:  

    `[(1, [1.2, 2.0]), (2, [1.2, 2.8]), (3, [2.2, 2.8]), (4, [2.2, 3.4]), (5, [3.6, 3.4]), (6, [3.6, NaN]), (7, [4.4, NaN]), (9, [5.4,       8.0])]`  

    Where no matching timetick exists in one table, this statement uses an interpolator of type TS_INTERPOLATOR_NEAREST to generate the     missing value.


## Temporal align
{: #temporal_align}

A temporal align is similar to a temporal join, except that, instead of producing a single array time series based on the observations of the two input time series, it produces two output time series with identical timeticks:  

```
SELECT TS_INNER_ALIGN(table1.col7, table2.col8)
```

Result:  

`[(1, 1.2), (9, 5.4)], [(1, 2.0), (9, 8.0)]`

```
SELECT TS_LEFT_ALIGN(table1.col7, table2.col8, TS_INTERPOLATOR_PREV(-1.0))
```

Result:

`[(1, 1.2), (3, 2.2), (5, 3.6), (7, 4.4), (9, 5.4)], [(1, 2.0), (3, 2.8), (5, 3.4), (7, NaN), (9, 8.0)]` 

```
SELECT TS_LEFT_OUTER_ALIGN(table1.col7, table2.col8, TS_INTERPOLATOR_PREV(-1.0))
```

Result:

`[(3, 2.2), (5, 3.6), (7, 4.4)], [(3, 2.8), (5, 3.4), (7, NaN)]`

```
SELECT TS_FULL_ALIGN(table1.col7, table2.col8, TS_INTERPOLATOR_NEAREST(-1.0))
```

Result:

`[(1, 1.2), (2, 1.2), (3, 2.2), (4, 2.2),(5, 3.6), (6, 3.6), (7, 4.4), (9, 5.4)], [(1, 2.0), (2, 2.8), (3, 2.8), (4, 3.4),(5, 3.4), (6, NaN), (7, NaN), (9, 8.0)]`


