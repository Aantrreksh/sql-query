---

copyright:
  years: 2019, 2021
lastupdated: "2021-03-03"

keywords: SQL query, time series, SQL, analyzing 

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# Analyzing time series data
{: #ts_intro}

A time series is a sequence of data values that are measured at successive, though not necessarily regular, points in time. You can use special SQL functions to process time series data, for example, to identify trends and to predict future values based on these trends.

See the following examples of time series:

-   Stock share prices and trading volumes.
-   Electrocardiogram (ECG) data.
-   Temperature or seismographic data.
-   Network performance measurements.
-   Electricity usage as recorded by a smart meter and reported through an Internet of Things data feed.
-   A clickstream log that records, for an individual computer user, which buttons were clicked, which pages or websites were visited,       and other information of interest.

Each entry in a time series is called an observation. Each observation comprises a timetick (a 64-bit integer that indicates when the observation was made) and the data that is recorded for that observation. The recorded data can be either numerical (for example, temperature or stock share price) or categorical (for example, geographic area). 
A time series can be, but must not necessarily be, associated with a [time reference system (TRS)](/docs/services/sql-query?topic=sql-query-TRS), which defines the granularity of each timetick and the start time.

You can use a set of integrated SQL [functions](/docs/services/sql-query?topic=sql-query-artifact) and [data types](/docs/services/sql-query?topic=sql-query-ts_datatypes) to process time series data. The functions are of the following types:

**Artifact creation**  
Create time series, TRSs, and other artifacts that are used during the processing of time series data.</p>  
  
**Exploding and flattening**  
Convert time series data to tabular data.  
  
**Summary**  
Retrieve information about a time series.  
  
**Statistical**  
Derive statistical insight from time series data. Each statistical function is of one of the following types:  
  
-   A transform produces, as output, a new time series.
-   A reducer produces, as output, a single value per time series or segment, such as a distance or average.  
  
**Forecasting**  
Use [forecasting models](/docs/services/sql-query?topic=sql-query-artifact#forecasting_model_creation) to detect anomalies or predict future behavior based on past events.  
  
**Filtering**  
Return the subset of a time series that satisfies the filter criteria.  
  
**Cleaning**  
Remove null values from time series.  
  
**Segmentation**  
Create, as output, a segmented version of a time series.  
  
**Temporal join and align**  
Match two time series that have different timestamps (for example, because they have different periodicity) so that they both have the same timestamps. A temporal join produces a single array time series based on the timestamps and values of the two input time series. A temporal align produces two output time series with identical timestamps. In both cases, an [interpolator](/docs/services/sql-query?topic=sql-query-artifact#interpolator_creation) is used to complete missing values.  
  
**Interpolation**  
Use interpolation either to fill missing values or to resample a time series at a different periodicity.  
  
**String matching**  
Match the values of a string time series against a string sequence (sequence matching) or a set of strings (item set matching).  
  
**Time functions**  
Convert a string or timestamp into a value of type Long.  
  
-   [Time reference systems](/docs/services/sql-query?topic=sql-query-TRS)  
    A time reference system (TRS) defines the *granularity* of a time series (that is, the length of each timetick), and the date and       time from which the timeticks are to be counted (that is, the time series start time).  
-   [Time series data types](/docs/services/sql-query?topic=sql-query-ts_datatypes)  
    Time series functions operate on a wide variety of special data types that are designed especially for time series data.  
-   [Using SQL statements to process time series data](/docs/services/sql-query?topic=sql-query-using_sql)  
    You can call time series functions from within SQL statements to manipulate and analyze time series data.  
-   [Time series functions](/docs/services/sql-query?topic=sql-query-ts_functions) 
    Use time series functions to process time series data.
