---

copyright:
  years: 2019, 2022
lastupdated: "2022-04-12"

keywords: SQL query, time series, SQL, data processing function

subcollection: sql-query

---


{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# Data processing functions
{: #data_processing_functions}

Each of these functions evaluates or manipulates input data and produces output data.

## Exploding and flattening functions
{: #exploding_flattening}

Each of these functions converts time series data to tabular data.

TS_EXPLODE(DoubleTimeSeries)
:   Output: Rows of Long, Double  
:   Converts each observation of the input data into a two-column row that comprises a timetick of type Long and a value of type Double.

TS_S_EXPLODE(StringTimeSeries)
:   Output: Rows of Long, String  
:   Converts each observation of the input data into a two-column row that comprises a timetick of type Long and a value of type String.

TS_DA_EXPLODE(DoubleArrayTimeSeries)
:   Output: Rows of Long, DoubleArray  
:   Converts each observation of the input data into a two-column row that comprises a timetick of type Long and a value of type DoubleArray.

TS_SA_EXPLODE(StringArrayTimeSeries)
:   Output: Rows of Long, StringArray  
:   Converts each observation of the input data into a two-column row that comprises a timetick of type Long and a value of type StringArray.

TS_FLATTEN(*SegmentTimeSeries*)
:   Output: Rows of Long, Integer, *TimeSeries*  
:   Converts a segment time series into a series of rows, with there being one row for each segment: 

    - A Long value that specifies the timetick of the first observation in the segment.
    - An integer that indicates the index number (0 to n) of the segment.
    - A time series that contains the observations that comprise the segment.

The type of the output time series corresponds to the type of the input segment time series.

## Summary functions
{: #summary_functions}

Each of these functions retrieves information about a time series.

TS_DESCRIBE(DoubleTimeSeries)
:   Output: Statistics for time series  
:   Returns a set of columns with timing statistics, value statistics, and numeric statistics.

TS_COUNT(*TimeSeries*)
:   Output: Integer  
:   Returns the number of observations in a time series.

TS_COUNT_ANCHOR(*TimeSeries*, AnchorType)
:   Output: Integer  
:   Returns the number of times that the specified anchor would be set in the input time series.

TS_SEG_COUNT(*SegmentTimeSeries*)
:   Output: DoubleTimeSeries  
:   Returns the number of observations in each segment of a time series. In the output, each timetick is the timetick of the first observation in the corresponding segment.

## Statistical functions
{: #statistical_functions}

Each of these functions derives statistical insight from time series data. Each statistical function is of one of the following types:  
- A *transform* produces, as output, a new time series.
- A *reducer* produces, as output, a single value, such as a distance or average.

TS_AWGN(DoubleTimeSeries, Double, Double) 
:   Output: DoubleTimeSeries  
:   Add, to a time series, white Gaussian noise with the specified mean (second parameter) and standard deviation (third parameter).

TS_MWGN(DoubleTimeSeries, Double)
:   Output: DoubleTimeSeries  
:   Add, to a time series, mean white Gaussian noise with the specified standard deviation (second parameter).

TS_ZSCORE(DoubleTimeSeries, Double, Double)
:   Output: DoubleTimeSeries  
:   Calculates the Z-score of a time series with the specified mean (second parameter) and standard deviation (third parameter).

TS_PEAK(DoubleTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the peaks of the time series.

TS_TROUGH(DoubleTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the troughs of the time series.

TS_DIFF(DoubleTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the difference of the time series.

TS_CORRELATION(DoubleTimeSeries, DoubleTimeSeries) 
:   Output: Double  
:   Returns the correlation between two time series.

TS_SEG_CORRELATION(DoubleSegmentTimeSeries, DoubleSegmentTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the correlation between each pair of corresponding segments in the two input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_MANHATTAN_DISTANCE()
:   Output: Double  
:   Returns the [Manhattan distance](https://en.wikipedia.org/wiki/Taxicab_geometry) between two time series.

TS_SEG_MANHATTAN_DISTANCE(DoubleSegmentTimeSeries, DoubleSegmentTimeSeries) 
:   Output: DoubleTimeSeries  
:   Returns the [Manhattan distance](https://en.wikipedia.org/wiki/Taxicab_geometry) between each pair of corresponding segments in the two input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_SBD()
:   Output: Double  
:   Returns the shape-based distance between two time series.

TS_SEG_SBD(DoubleSegmentTimeSeries, DoubleSegmentTimeSeries) 
:   Output: DoubleTimeSeries  
:   Returns the shape-based distance between each pair of corresponding segments in the two input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_DTW()
:   Output: Double  
:   Returns the [dynamic time warping distance](https://en.wikipedia.org/wiki/Dynamic_time_warping) between two time series.

TS_SEG_DTW(DoubleSegmentTimeSeries, DoubleSegmentTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the [dynamic time warping distance](https://en.wikipedia.org/wiki/Dynamic_time_warping) between each pair of corresponding segments in the two input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_DL(DoubleTimeSeries, DoubleTimeSeries) or TS_DL(StringTimeSeries, StringTimeSeries)
:   Output: Double  
:   Returns the Damerau–Levenshtein distance between two time series.

TS_SEG_DL(DoubleSegmentTimeSeries, DoubleSegmentTimeSeries)
:   Output: Double  
:   Returns the Damerau–Levenshtein distance between each pair of corresponding segments in the two input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_FFT(DoubleTimeSeries, String)
:   Output: DoubleArray  
:   Uses a [fast Fourier transform (FFT)](https://en.wikipedia.org/wiki/Fast_Fourier_transform) algorithm to return the discrete Fourier transform of a time series. The string that is specified for the second parameter determines the type of transform:

    - `forward` or `f` for a forward transform
    - `inverse` or `i` for an inverse transform

TS_SEG_FFT(DoubleSegmentTimeSeries, String)
:   Output: DoubleArrayTimeSeries  
:   Uses a [fast Fourier transform (FFT)](https://en.wikipedia.org/wiki/Fast_Fourier_transform) algorithm to return the discrete Fourier transform for each segment of the input time series. The string that is specified for the second parameter determines the type of transform:

    - `forward` or `f` for a forward transform
    - `inverse` or `i` for an inverse transform

Each timetick in the output time series is the timetick of the corresponding segment.

TS_AUTO_CORRELATION(DoubleTimeSeries)
:   Output: DoubleArray  
:   Use an [auto correlation](https://en.wikipedia.org/wiki/Autocorrelation) algorithm to return the correlation of a time series with a delayed copy of itself.

TS_SEG_AUTO_CORRELATION(DoubleSegmentTimeSeries)
:   Output: DoubleArrayTimeSeries  
:   Use an [auto correlation](https://en.wikipedia.org/wiki/Autocorrelation) algorithm to return the correlation of each segment of the input time series with a delayed copy of itself. Each timetick in the output time series is the timetick of the corresponding segment.

TS_CROSS_CORRELATION(DoubleTimeSeries, DoubleTimeSeries) 
:   Output: DoubleArray  
:   Use a [cross correlation](https://en.wikipedia.org/wiki/Cross-correlation) algorithm to return a measure of the similarity of two time series.

TS_SEG_CROSS_CORRELATION(DoubleSegmentTimeSeries, DoubleSegmentTimeSeries)
:   Output: DoubleArrayTimeSeries  
:   Use a [cross correlation](https://en.wikipedia.org/wiki/Cross-correlation) algorithm to return a measure of the similarity of each pair of corresponding segments in the two input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_AVG(DoubleTimeSeries)
:   Output: Double  
:   Returns the average of the values of the input time series.

TS_SEG_AVG(DoubleSegmentTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the average of the values of each segment of the input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_MIN(DoubleTimeSeries)
:   Output: Double  
:   Returns the minimum value of the input time series.

TS_SEG_MIN(DoubleSegmentTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the minimum value of each segment of the input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_MAX(DoubleTimeSeries)
:   Output: Double  
:   Returns the maximum value of the input time series.

TS_SEG_MAX(DoubleSegmentTimeSeries) 
:   Output: DoubleTimeSeries  
:   Returns the maximum value of each segment of the input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_SUM(DoubleTimeSeries) 
:   Output: Double  
:   Returns the sum of the values of the input time series.

TS_SEG_SUM(DoubleSegmentTimeSeries) 
:   Output: DoubleTimeSeries  
:   Returns the sum of the values of each segment of the input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_SD(DoubleTimeSeries)
:   Output: Double  
:   Returns the standard deviation of the values of the input time series.

TS_SEG_SD(DoubleSegmentTimeSeries) 
:   Output: DoubleTimeSeries  
:   Returns the standard deviation of the values of each segment of the input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_KURTOSIS(DoubleTimeSeries)
:   Output: Double  
:   Returns the kurtosis of the values of the input time series.

TS_SEG_KURTOSIS(DoubleSegmentTimeSeries)  
:   Output: DoubleTimeSeries  
:   Returns the kurtosis of the values of each segment of the input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_SKEWNESS(DoubleTimeSeries)
:   Output: Double  
:   Returns the skewness of the values of the input time series.

TS_SEG_SKEWNESS(DoubleSegmentTimeSeries)
:   Output: DoubleTimeSeries  
:   Returns the skewness of the values of each segment of the input time series. Each timetick in the output time series is the timetick of the corresponding segment.

TS_GRANGER(DoubleTimeSeries, DoubleTimeSeries, Numeric)
:   Output: DoubleArray  
:   Returns the result of a [Granger causality test](https://en.wikipedia.org/wiki/Granger_causality) as an array of the form [fStat, pValue, R2]. The result indicates whether the first time series is useful in forecasting the second time series. The third parameter specifies the number of lags.

## Forecasting functions
{: #forecasting_funcitons}

Each of these functions uses a [forecasting model](/docs/services/sql-query?topic=sql-query-artifact#forecasting_model_creation) to detect anomalies or predict future behavior based on past events.

TS_FORECAST(DoubleTimeSeries, ForecastingModel, Long)
:   Output: DoubleTimeSeries  
:   Returns a forecast of the specified number of expected observations (third parameter) beyond the last value in the input time series, based on the specified forecasting model (second parameter).

TS_DETECT_ANOMALIES(DoubleTimeSeries, ForecastingModel, Double)
:   Output: DoubleTimeSeries  
:   Returns a time series that contains all the anomalies in the input time series, by using the specified forecasting model (second parameter) and confidence level (third parameter).

## Filtering functions
{: #filtering_funcitons}

Each of these functions returns the subsequence of a time series that satisfies the filter criteria.

TS_SLICE(*TimeSeries*, Long, Long)
:   Output: *TimeSeries*  
:   Returns the subsequence of the specified time series that lies between the specified start time (second parameter) and end time (third parameter).

TS_REMOVE_CONSECUTIVE_DUPLICATES(*TimeSeries*)
:   Output: *TimeSeries*  
:   Removes consecutive duplicate values from the specified time series.

TS_COMBINE_DUPLICATE_TIMETICKS(*TimeSeries*, CombinerType) 
:   Output: *TimeSeries*  
:   Combines observations with duplicate timeticks based on the specified [combiner](/docs/services/sql-query?topic=sql-query-artifact#combiner_creation).

TS_INDEX (*ArrayTimeSeries*, Integer)
:   Output: *TimeSeries*  
:   Returns a time series whose values correspond to the values of the input array time series at the specified index (second parameter).

TS_FILTER (time_series, Boolean expression)
:   Output: *TimeSeries*  
:   Filter each value of the time series given a Boolean expression.

## Cleaning functions
{: #cleaning_funcitons}

Each of these functions removes null values from time series.

TS_FILLNA[^ 1], InterpolatorType)
:   Output: The output is of the same type as the input.  
:   Replace each null value with a new value as determined by the specified [interpolator](/docs/services/sql-query?topic=sql-query-artifact#interpolator_creation).

TS_DROPNA[^ 1]
:   Output: The output is of the same type as the input.  
:   Drop all observations that contain at least one null value.

[^ 1]: The input time series can be of type DoubleTimeSeries, StringTimeSeries, DoubleArrayTimeSeries, or StringArrayTimeSeries.

## Segmentation functions
{: #segmentation_funcitons}

Each of these functions creates, as output, a segmented version of a time series. The lengths of the segments are determined by [anchor points](/docs/services/sql-query?topic=sql-query-artifact#anchor_creation).

TS_SEGMENT([^ 2], Int, Int)
:   Output: The type of the output segment time series corresponds to the type of the input.  
:   Returns a SegmentTimeSeries based on the input time series and the specified segment size (second parameter) and step size (third parameter). 
:   The step size corresponds to a number of observations. For example, the array `[1,2,3,4,5,6,7]` segmented with a segment size of three and a step size of two produces the result `[1,2,3]`, `[3,4,5]`, `[5,6,7]`.

TS_SEGMENT_BY_TIME([^ 2], Long, Long)  
:   Output: The type of the output segment time series corresponds to the type of the input.  
:   Returns a SegmentTimeSeries based on the input time series and the specified segment size (second parameter) and step size (third parameter). 
:   The segment and step sizes are of the same granularity as the input time series.

TS_SEGMENT_BY_SILENCE([^ 2], Long)
:   Output: The type of the output segment time series corresponds to the type of the input.  
:   Segment a time series whenever no observation occurs within the length of time, in timetick units, that is specified by the second parameter.

TS_SEGMENT_BY_SMOOTHED_SILENCE([^ 2], Double, Double, Long)
:   Output: The type of the output segment time series corresponds to the type of the input.  
:   Segment a time series whenever no observation occurs within the length of time, in timetick units, that is calculated by the formula `min(T×F, H)` where:

    - T = Interarrival time (that is, the time between two observations), smoothed by using the specified [exponential smoothing](https://en.wikipedia.org/wiki/Exponential_smoothing) factor alpha (second parameter)
    - F = factor (third parameter)
    - H = Threshold (fourth parameter)

TS_SEGMENT_BY_ANCHOR([^ 2], AnchorType, Long, Long) 
:   Output: The type of the output segment time series corresponds to the type of the input.  
:   Segment a time series based on the specified anchor. The specified Long values determine a segment that begins before (third parameter) and ends after (fourth parameter) each anchor point. For example:

    - Specify 0,0 to return only those observations that correspond to the anchor points.
    - Specify 5,3 to create a segment that includes, in addition to the observation at each anchor point, all observations that occur between five timeticks before and three timeticks after each anchor point.
    - Specify 5,-3 to create a segment that includes all observations that occur between five and three timeticks before the anchor point.

TS_SEGMENT_BY_MARKER (ts: AnyTimeSeries, marker: BooleanExpressionType[Any], prevInclusive: Boolean, nextInclusive: Boolean, requiresStartAndEnd: Boolean)
:   Output: Same as input 
:   Segment the time series by a marker point (Boolean expression) where each segment exists between markers.

TS_SEGMENT_BY_DUAL_MARKER (ts: AnyTimeSeries, markerStart: BooleanExpressionType[Any], markerEnd: BooleanExpressionType[Any], startInclusive: Boolean, endInclusive: Boolean, startOnFirst: Boolean, endOnFirst: Boolean)
:   Output: Same as input
:   Segment the time series by a start and end marker point (Boolean expression) where each segment exists between the start and end markers.

[^ 2]: The input time series can be of type DoubleTimeSeries, StringTimeSeries, DoubleArrayTimeSeries, or StringArrayTimeSeries.

## Temporal join and align functions
{: #temporal_join_align_funcitons}

A temporal join produces a single array time series based on the timeticks and values of the two input time series. A temporal align produces two output time series with identical timeticks. In both cases, an interpolator is used to complete missing values.

The output time series contain the concatenated values of the input time series. For example:

- If the first time series is a DoubleTimeSeries with an observation (t1, a1), and the second time series is a DoubleTimeSeries with an observation (t1, b1), the join results in (t1, [a1, b1]).
- If the first time series is a DoubleArrayTimeSeries with an observation (t1, a1, a2), and the second time series is a DoubleArrayTimeSeries with an observation (t1, b1, b2, b3), the join results in (t1, [a1, a2, b1, b2, b3]).

TS_INNER_JOIN(*TimeSeries*, *TimeSeries*)
:   Output: *ArrayTimeSeries*  
:   Temporally inner join two time series of the same type.

TS_LEFT_JOIN(*TimeSeries*, *TimeSeries*, InterpolatorType)
:   Output: *ArrayTimeSeries*  
:   Temporally left join two time series of the same type. Replace missing values as determined by the specified interpolator.

TS_RIGHT_JOIN(*TimeSeries*, *TimeSeries*, InterpolatorType)
:   Output: *ArrayTimeSeries*  
:   Temporally right join two time series of the same type. Replace missing values as determined by the specified interpolator.

TS_LEFT_OUTER_JOIN(*TimeSeries*, *TimeSeries*, InterpolatorType)
:   Output: *ArrayTimeSeries*  
:   Temporally left outer join two time series of the same type. Replace missing values as determined by the specified interpolator.

TS_RIGHT_OUTER_JOIN(*TimeSeries*, *TimeSeries*, InterpolatorType)
:   Output: *ArrayTimeSeries*  
:   Temporally right outer join two time series of the same type. Replace missing values as determined by the specified interpolator.

TS_FULL_JOIN(*TimeSeries*, *TimeSeries*, InterpolatorType) 
:   Output: *ArrayTimeSeries*  
:   Temporally full join two time series of the same type. Replace missing values as determined by the specified interpolator.

TS_INNER_ALIGN(*TimeSeries*, *TimeSeries*, InterpolatorType) 
:   Output: *TimeSeries*, *TimeSeries*  
:   Temporally inner align two time series of the same type. Unlike TS_INNER_JOIN, this function produces two output time series, each of which is aligned with the other. 
:   The output time series are of the same type as the input time series.

TS_LEFT_ALIGN(*TimeSeries*, *TimeSeries*, InterpolatorType)
:   Output: *TimeSeries*, *TimeSeries*  
:   Temporally left align two time series of the same type, and set any missing values to null. Unlike TS_LEFT_JOIN, this function produces two output time series, each of which is aligned with the other. The output time series are of the same type as the input time series.

TS_RIGHT_ALIGN(*TimeSeries*, *TimeSeries*, InterpolatorType)
:   Output: *TimeSeries*, *TimeSeries*  
:   Temporally right align two time series of the same type, and set any missing values to null. Unlike TS_RIGHT_JOIN, this function produces two output time series, each of which is aligned with the other. The output time series are of the same type as the input time series.

TS_FULL_ALIGN(*TimeSeries*, *TimeSeries*, InterpolatorType)
:   Output: *TimeSeries*, *TimeSeries*  
:   Temporally full align two time series of the same type, and set any missing values to null. Unlike TS_FULL_JOIN, this function produces two output time series, each of which is aligned with the other. The output time series are of the same type as the input time series.

TS_VECTORN(*TimeSeries*, *TimeSeries*, ...)
:   Output: *ArrayTimeSeries*  
:   Temporally inner join up to 10 time series of the same type to produce a single array time series of vectors. Only observations with matching timeticks are retained, so if all observations are to be retained, align the input time series before you use this function.

## Interpolation functions
{: #interpolation_functions}

Use interpolation either to fill missing values or to resample a time series at a different periodicity.

TS_RESAMPLE(DoubleTimeSeries, Long, InterpolatorType) or TS_RESAMPLE(StringTimeSeries, Long, InterpolatorType)
:   Output: The output is of the same type as the input time series.  
:   Resample the specified time series by using the specified periodicity (second parameter). Depending on the periodicity:

    - The output time series might contain new, generated observations that are not in the input time series. The [interpolator](/docs/services/sql-query?topic=sql-query-artifact#interpolator_creation) (third parameter) determines how to set values for any generated observations.
    - Some of the observations in the input time series might be absent from the output time series. However, even skipped observations are used during interpolation.

## String matching functions
{: #string_matching_functions}

Match a string time series against a string sequence or a set of strings.

TS_MATCH(StringTimeSeries, MatcherType, Array[String])
:   Output: StringTimeSeries  
:   If the specified pattern (third parameter) matches the values in the input time series (first parameter) as required by the specified matcher (second parameter), 
this function returns the matching observations; otherwise, it returns null.

## Time functions
{: #time_functions}

Convert a string or timestamp into a value of type Long.

TS_TIMESTAMP(String) or TS_TIMESTAMP(TimestampType)
:   Output: Long  
:   Convert the specified string or timestamp into a value of type Long that contains an epoch millisecond timestamp in [Unix time](https://en.wikipedia.org/wiki/Unix_time).

    - If the input parameter is a string, it is parsed by using the [DateTimeFormatter](https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html).
    - If the input parameter is a TimeStampType value, it is treated as a Java™ timestamp.

## General functions
{: #general_functions}

TS_MAP (time_series, value_expression)
:   Output: TimeSeries
:   Map each value of the time series to a new time series given an expression.

