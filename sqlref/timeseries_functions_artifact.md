---

copyright:
  years: 2019, 2022
lastupdated: "2022-12-08"

keywords: SQL query, time series, SQL, artifact creation, function

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

# Artifact creation functions
{: #artifact}

Each of these functions produces, as its output, a time series or some other artifact that some [data processing functions](/docs/services/sql-query?topic=sql-query-data_processing_functions) require as input.

## Time series creation functions
{: #ts_creation}

Each of these functions converts data in table columns into a *time series* artifact.

**TIME_SERIES(String, String)**
Output: DoubleTimeSeries  
Creates a DoubleTimeSeries that does not use a [TRS](/docs/services/sql-query?topic=sql-query-TRS). The resulting timeticks are unitless, and no start time exists.
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type Double that represents the values of the observations.

**TIME_SERIES_WITH_TRS(String, String, TRS)**
Output: DoubleTimeSeries  
Creates a DoubleTimeSeries that uses a custom [TRS](/docs/services/sql-query?topic=sql-query-TRS).
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type Double that represents the values of the observations.
- The third parameter specifies the name of the TRS that is to be associated with the time series. This TRS determines the granularity and start time of the time series timeticks.

**TIME_SERIES_DA(DoubleArrayTimeSeries)**
Output: DoubleArrayTimeSeries  
Creates a DoubleArrayTimeSeries that does not use a [TRS](/docs/services/sql-query?topic=sql-query-TRS). The resulting timeticks are unitless, and no start time exists.
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type DoubleArray that represents the values of the observations.

**TIME_SERIES_DA_WITH_TRS(String, String, TRS)**
Output: DoubleArrayTimeSeries  
Creates a DoubleArrayTimeSeries that uses a custom [TRS](/docs/services/sql-query?topic=sql-query-TRS).
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type DoubleArray that represents the values of the observations.
- The third parameter specifies the name of the TRS that is to be associated with the time series. This TRS determines the granularity and start time of the time series timeticks.

**TIME_SERIES_S(String, String)**
Output: StringTimeSeries  
Creates a StringTimeSeries that does not use a [TRS](/docs/services/sql-query?topic=sql-query-TRS). The resulting timeticks are unitless, and no start time exists.
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type String that represents the values of the observations.

**TIME_SERIES_S_WITH_TRS(String, String, TRS)**
Output: StringTimeSeries  
Creates a StringTimeSeries that uses a custom [TRS](/docs/services/sql-query?topic=sql-query-TRS).
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type String that represents the values of the observations.
- The third parameter specifies the name of the TRS that is to be associated with the time series. This TRS determines the granularity and start time of the time series timeticks.

**TIME_SERIES_SA(String, String)**
Output: StringArrayTimeSeries  
Creates a StringArrayTimeSeries that does not use a [TRS](/docs/services/sql-query?topic=sql-query-TRS). The resulting timeticks are unitless, and no start time exists.
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type StringArray that represents the values of the observations.

**TIME_SERIES_SA_WITH_TRS(String, String, TRS)**
Output: StringArrayTimeSeries  
Creates a StringArrayTimeSeries that uses a custom [TRS](/docs/services/sql-query?topic=sql-query-TRS).
- The first parameter specifies the name of a table column that contains numeric data that represents the timeticks of the observations.
- The second parameter specifies the name of the table column that contains data of type StringArray that represents the values of the observations.
- The third parameter specifies the name of the TRS that is to be associated with the time series. This TRS determines the granularity and start time of the time series timeticks.

## TRS creation functions
{: #trs_creation}

These functions create or reassign a [time reference system (TRS)](/docs/services/sql-query?topic=sql-query-TRS).

**TS_TRS(String, TimestampType) or TS_TRS(String, String)**
Output: TRS  
Creates a TRS that determines the granularity and start time of a time series.
- The first parameter specifies the granularity of the TRS. It can be specified by using any of the formats that are accepted by the Java [parse function of the Duration class](https://docs.oracle.com/javase/8/docs/api/java/time/Duration.html#parse-java.lang.CharSequence-).
- The second parameter specifies the start time of the TRS. It can be specified either as a TimestampType or as a string that uses any of the formats that are accepted by the Java [DateTimeFormatter class](https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html).

**TS_TRS_DEFAULT()**
Output: TRS  
Creates a default TRS that determines the granularity and start time of a time series.
- The granularity is 'PT0.001S' (1 millisecond).
- The start time is '1970-01-01T00:00:00'.

**TS_TRS_DEFAULT_STARTTIME(String)**
Output: TRS  
Creates a TRS that determines the granularity and start time of a time series.
- The parameter specifies the granularity of the TRS. It can be specified by using any of the formats that are accepted by the Java [parse function of the Duration class](https://docs.oracle.com/javase/8/docs/api/java/time/Duration.html#parse-java.lang.CharSequence-).
- The start time is '1970-01-01T00:00:00'.

**TS_WITH_TRS(*TimeSeries*, TRS)**
Output: *TimeSeries*  
Changes the TRS that is associated with the specified time series. If the specified time series is not already associated with a TRS, this function throws an exception.

## Combiner creation functions
{: #combiner_creation}

Each of these functions creates a *combiner* artifact, which is used by other functions to determine how to treat observations that have identical timeticks.

**TS_COMBINER_CONCATENATE(String)**
Output: CombinerType  
Creates a combiner that instructs another function to combine, into a single observation, observations that have identical timeticks. The value of the new observation is the concatenation of the original values. The values are separated by the specified character (if any), which acts as a delimiter.

**TS_COMBINER_ADD()**
Output: CombinerType  
Creates a combiner that instructs another function to combine, into a single observation, observations that have values of type Double and identical timeticks. The value of the new observation is the sum of the original values.

**TS_COMBINER_MUL()**
Output: CombinerType  
Creates a combiner that instructs another function to combine, into a single observation, observations that have values of type Double and identical timeticks. The value of the new observation is the result of multiplying the original values.

**TS_COMBINER_MIN()**
Output: CombinerType  
Creates a combiner that instructs another function to combine, into a single observation, observations that have values of type Double and identical timeticks. The value of the new observation is the minimum of the original values.

**TS_COMBINER_MAX()**
Output: CombinerType
Creates a combiner that instructs another function to combine, into a single observation, observations that have values of type Double and identical timeticks. The value of the new observation is the maximum of the original values.

**TS_COMBINER_AVG()**
Output: CombinerType  
Creates a combiner that instructs another function to combine, into a single observation, observations that have values of type Double and identical timeticks. The value of the new observation is the average of the original values.

**TS_COMBINER_FIRST()**
Output: CombinerType  
Creates a combiner that instructs another function to combine, into a single observation, observations that have identical timeticks. The value of the new observation is the first of the original values.

**TS_COMBINER_LAST()**
Output: CombinerType  
Creates a combiner that instructs another function to combine, into a single observation, observations that have identical timeticks. The value of the new observation is the last of the original values.

## Interpolator creation functions
{: #interpolator_creation}

Each of these functions generates an *interpolator* artifact, which is used by cleaning functions to replace null values, and by resampling, join, and align functions to calculate values for generated observations.

**TS_INTERPOLATOR_FILL[^1]**
Output: InterpolatorType  
Creates an interpolator that replaces any null value with the specified value.

**TS_INTERPOLATOR_NEAREST[^1]**
Output: InterpolatorType  
Creates an interpolator that replaces a null value with the value of the neighboring observation that has the nearest timetick. If the value of that observation is also null, the original null value remains unchanged. If the previous and next timeticks are equidistant, the value of the observation with the previous timetick is used. If no nearest observation exists (that is if the input time series contains a single observation), this function replaces the null value with the specified value.

**TS_INTERPOLATOR_NEXT[^1]**
Output: InterpolatorType  
Creates an interpolator that replaces a null value with the next value in the time series. If no such value exists, it fills the null value with the specified value.

**TS_INTERPOLATOR_PREV[^1]**
Output: InterpolatorType  
Creates an interpolator that replaces a null value with the previous value. If no previous value exists, it fills the null value with the specified value.

**TS_INTERPOLATOR_LINEAR[^1](Integer, Integer)**
Output: InterpolatorType  
Creates an interpolator that replaces a null value with a value that is calculated by [linear interpolation](https://en.wikipedia.org/wiki/Linear_interpolation) based on the specified number of previous (second parameter) and subsequent (third parameter) observations (both numbers must be positive). The value of the first parameter is used as a filler value when not enough previous or subsequent values exist to satisfy parameter 2 or 3. For example, if `TS_INTERPOLATOR_LINEAR(9.76, 3, 5)` is specified, for each null value, a line is calculated by using the three previous and five subsequent data points that minimize the average error for all eight data points, and the point on this line that corresponds to the timetick of the null value determines the filler value. If three previous or five subsequent data points are not available, the value 9.76 is used as the filler value.

**TS_INTERPOLATOR_SPLINE[^1](Integer, Integer)**
Output: InterpolatorType  
Creates an interpolator that replaces a null value with a value that is calculated by [spline interpolation](https://en.wikipedia.org/wiki/Spline_interpolation) based on the specified number of previous (second parameter) and subsequent (third parameter) observations (both numbers must be positive). The value of the first parameter is used as a filler value when not enough previous or subsequent values exist to satisfy parameter 2 or 3. For example, if `TS_INTERPOLATOR_SPLINE(3, 5, 9.76)` is specified, for each null value, a spline is calculated by using the three previous and five subsequent data points that minimize the average error for all eight data points, and the point on this spline that corresponds to the timetick of the null value determines the filler value. If three previous or five subsequent data points are not available, the value 9.76 is used as the filler value.

[^1]: The input type can be any of String, Double, Array[String], Array[Double], but must be of a type that corresponds to the type of the time series.

## Time series expressions
{: #time_series_expressions}

Expression creation functions replace the anchor functions that are deprecated. Expression functions are more powerful and allow more advanced use cases.

**"TS_EXP_ID” ()**
Output: Identity Expression  
Denotes current observation’s value in time series.

**"TS_EXP_ID_INDEX” (Integer)**
Output: Identity Expression  
Denotes current observation’s value (array index) in time series.

**"TS_EXP_NOT” (BooleanExpType)**
Output: Boolean Expression  
Logical expression that returns the negation.

**"TS_EXP_AND" BooleanExpType, BooleanExpType)**
Output: Boolean Expression  
Logical expression that returns the output of an AND operation.

**"TS_EXP_OR” (BooleanExpType, BooleanExpType)**
Output: Boolean Expression  
Logical expression that returns the output of an OR operation.

**"TS_EXP_LT” (DoubleExpType, DoubleExpType)**
Output: Boolean Expression  
Expression to denote if first expression is less than second expression.

**"TS_EXP_LTE” (DoubleExpType, DoubleExpType)**
Output: Boolean Expression  
Expression to denote if first expression is less than or equal to second expression.

**"TS_EXP_GT” (DoubleExpType, DoubleExpType)**
Output: Boolean Expression  
Expression to denote if first expression is greater than second expression.

**"TS_EXP_GTE” (DoubleExpType, DoubleExpType)**
Output: Boolean Expression  
Expression to denote if first expression is greater than or equal to second expression.

**"TS_EXP_DIVISIBLE_BY” (DoubleExpType, DoubleExpType)**
Output: Boolean Expression  
Expression to denote if first expression is divisible by second expression.

**"TS_EXP_CONTAINS” (StringExpType, StringExpType)**
Output: Boolean Expression  
Expression to denote if first expression contains second expression.

**"TS_EXP_STARTS_WITH” (StringExpType, StringExpType)**
Output: Boolean Expression  
Expression to denote if first expression starts with second.

**"TS_EXP_ENDS_WITH” (StringExpType, StringExpType)**
Output: Boolean Expression  
Expression to denote if first expression ends with second expression.

**"TS_EXP_EQUALS” (DoubleExpType | StringExpType, DoubleExpType | StringExpType)**
Output: Boolean Expression  
Expression to denote if first expression equals second expression.

**"TS_EXP_IF_THEN_ELSE” (BooleanExpType, DoubleExpType | StringExpType, DoubleExpType | StringExpType)**
Output: Conditional Expression  
Expression that if the “if” condition is met, it returns the “then” expression, otherwise it returns the “else” expression.

**"TS_EXP_IF_THEN” (BooleanExpType, DoubleExpType | StringExpType)**
Output: Conditional Expression  
Expression that if the “if” condition is met, it returns the “then” expression, otherwise it returns null.

**"TS_EXP_MATCH_CASE” (Array[TS_EXP_IF_THEN], DoubleExpType | StringExpType)**
Output: Conditional Expression  
Expression that takes multiple ”IF_THEN” expressions, if none are met, the otherwise expression is chosen.

**"TS_EXP_ABS” (DoubleExpType)**
Output: Double Expression   
Expression that gets the absolute value of an expression.

**"TS_EXP_EXP” (DoubleExpType)**
Output: Double Expression  
Expression that gets the Euler's Number e that is raised to the power of an indicated DoubleExpression.

**"TS_EXP_LOG” (DoubleExpType)**
Output: Double Expression  
Expression that gets the log of an expression.

**"TS_EXP_LOG10” (DoubleExpType)**
Output: Double Expression  
Expression that gets the log10 of an expression.

**"TS_EXP_SQRT” (DoubleExpType)**
Output: Double Expression  
Expression that gets the square root of an expression.

**"TS_EXP_SIN" (DoubleExpType)**
Output: Double Expression  
Expression that gets the sin of an expression.

**"TS_EXP_COS” (DoubleExpType)**
Output: Double Expression  
Expression that gets the cosine of an expression.

**"TS_EXP_TAN” (DoubleExpType)**
Output: Double Expression  
Expression that gets the tangent of an expression.

**"TS_EXP_ASIN” Double Expression**
Output: Double Expression  
Expression that gets the arc sine of an expression.

**"TS_EXP_ACOS” Double Expression**
Output: Double Expression  
Expression that gets the arc cosine of an expression.

**"TS_EXP_ATAN” Double Expression**
Output: Double Expression  
Expression that gets the arc tangent of an expression.

**"TS_EXP_SINH” Double Expression**
Output: Double Expression  
Expression that gets the sine hyperbolic of an expression.

**"TS_EXP_COSH” Double Expression**
Output: Double Expression  
Expression that gets the cosine hyperbolic of an expression.

**"TS_EXP_TANH" Double Expression**
Output: Double Expression  
Expression that gets the TANH of an expression.

**"TS_EXP_ADD”(DoubleExpType, DoubleExpType)**
Output: Double Expression  
Expression that adds the first expression with the second expression.

**"TS_EXP_SUBTRACT”(DoubleExpType, DoubleExpType)**
Output: Double Expression  
Expression that subtracts the second expression from the first expression.

**"TS_EXP_DIVIDE”(DoubleExpType, DoubleExpType)**
Output: Double Expression  
Expression that divides the first expression by the second expression.

**"TS_EXP_MULTIPLY”(DoubleExpType, DoubleExpType)**
Output: Double Expression  
Expression that multiplies the first expression with the second expression.

**"TS_EXP_MOD”(DoubleExpType, DoubleExpType)**
Output: Double Expression  
Expression that performs mod on the first expression with the second expression.

**"TS_EXP_POW”(DoubleExpType, DoubleExpType)**
Output: Double Expression  
Expression that performs pow on the first expression with the second expression as the exponent.

**"TS_EXP_ATAN2”(DoubleExpType, DoubleExpType)**
Output: Double Expression  
Expression that performs atan2 on the first expression with the second.

**"TS_EXP_LENGTH”(StringExpType)**
Output: String Expression  
Expression that gets the length of a string expression.

**"TS_EXP_CONCAT”(StringExpType)**
Output: String Expression  
Expression that concatenates two string expressions.

**"TS_EXP_ID_TO_STRING”(StringExpType)**
Output: String Expression  
Expression that converts the current observation’s value to a string.

**"TS_EXP_MATCH” (StringExpression, StringExpression)**
Output: Boolean Expression  
Expression that does a string match on the indicated expression.

## Anchor creation functions
{: #anchor_creation}

Each of these functions creates an *anchor* artifact, which is used by other functions to determine where to segment a time series.

Anchor functions are deprecated, use expression creation functions instead.
Expression creation functions are similar to anchor functions but they are more feature rich.
{: note}

**TS_ANCHOR_EQ[^2]**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value equals the value of the input parameter.

**TS_ANCHOR_CONTAINS(String)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an input string is contained in the value of an observation value.

**TS_ANCHOR_CONTAINED_IN(String)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value is contained in the input string.

**TS_ANCHOR_STARTS_WITH(String)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value begins with the input string.

**TS_ANCHOR_ENDS_WITH(String)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value ends with the input string.

**TS_ANCHOR_GT(Double)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value is greater than (>) the input value.

**TS_ANCHOR_GTE(Double)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value is greater than or equal to (>=) the input value.

**TS_ANCHOR_LT(Double)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value is less than (<) the input value.

**TS_ANCHOR_LTE(Double)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value is less than or equal to (<=) the input value.

**TS_ANCHOR_DIVISIBLE_BY(Double)**
Output: AnchorType  
Creates an anchor that sets an anchor point when an observation value is evenly divisible (that is, divisible with no remainder) by the input value.

**TS_ANCHOR_AND(AnchorType, AnchorType)**
Output: AnchorType  
Creates an anchor that sets an anchor point only when both of the specified anchors would set an anchor point independently.

**TS_ANCHOR_OR(AnchorType, AnchorType)**
Output: AnchorType  
Creates an anchor that sets an anchor point only when either of the specified anchors would set an anchor point independently.

**TS_ANCHOR_NOT(AnchorType)**
Output: AnchorType  
Creates an anchor that sets an anchor point when the specified anchor would not.

**TS_ANCHOR_INDEX(AnchorType, Integer)**
Output: AnchorType  
Creates, for use by an array time series, an anchor of the specified type (first parameter) for a specified index (second parameter) of the series.

[^2]: The input type can be any of String, Double, Array[String], Array[Double].

## Forecasting model creation functions
{: #forecasting_model_creation}

Each of these functions creates a *forecasting model* artifact, which is used by other functions for forecasting and anomaly detection.

**TS_FORECAST_BATS(Integer, Boolean)**
Output: ForecastingModel  
Creates a forecasting model with Box-Cox, ARMA, trend, and seasonal (BATS) components. The value of the first parameter specifies the minimum number of training observations. The value of the second parameter specifies whether the Box-Cox transformation is to be used:
- Specify **true** if the Box-Cox transformation is to be used.
- Specify **false** if the Box-Cox transformation is not to be used.

**TS_FORECAST_HWS(Integer, Integer)**
Output: ForecastingModel  
Creates a Holt-Winters forecasting model with the specified number of observations per season (first parameter) and minimum number of training seasons (second parameter).

**TS_FORECAST_ARIMA(Integer)**
Output: ForecastingModel  
Creates an ARIMA forecasting model with the specified minimum number of training observations.

**TS_FORECAST_ARMA(Integer)**
Output: ForecastingModel  
Creates an ARMA forecasting model with the specified minimum number of training observations.

**TS_FORECAST_LINEAR(Integer, Integer)**
Output: ForecastingModel  
Creates an ordinary least squares (OLS) linear regression forecasting model.
- The first parameter specifies the number of observations that are to be used to initialize the model (that is to calculate its slope and intercept). If the model is not to be initialized, specify -1.
- The second parameter specifies the minimum number of previous values that are used to compute each new slope and intercept. This minimum number must be at least 2.

**TS_FORECAST_AVERAGE(Integer, Integer)**
Output: ForecastingModel  
Creates a forecasting model that returns the running average of the sample data as its forecast value.
- The first parameter specifies the number of observations that are to be used to initialize the model (that is to calculate its average). If the model is not to be initialized, specify -1.
- The second parameter specifies the minimum number of previous values that are used to compute each new average. This minimum number must be at least 2.

**TS_FORECAST_AUTO(Integer)**
Output: ForecastingModel  
Creates a forecasting model that dynamically chooses, from among the following forecasting algorithms, the algorithm that returns the fewest errors:
- HW additive
- HW multiplicative
- ARIMA
- OLS linear regression
- BATS

The parameter specifies the minimum number of training observations.

## Matcher creation functions
{: #matcher_creation}

Each of these functions creates a *matcher* artifact, which is used by a [matching function](/docs/services/sql-query?topic=sql-query-string_matching) to determine which observations of a string time series satisfy a particular pattern. The matching function specifies a matcher, a pattern, and the time series to which the pattern is to be compared.

**TS_MATCHER_SEQ()**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with an entire string time series exactly and in sequence. If the pattern and time series match, the function that uses the matcher returns the input time series, otherwise, the function returns null. This function corresponds to using a TS_MATCHER_SUBLIST_PS matcher with a threshold of 1.

**TS_MATCHER_SUBLIST(Double)**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with a sublist of a string time series, to within the specified coverage threshold. The threshold is a double-precision number in the range 0.0 - 1.0 that indicates the minimum ratio of pattern size to sublist. For example, a threshold of 0.75 means that the specified pattern must match at least 75% of the time series values, in sequence and contiguously. If the threshold is met, the pattern is considered to match, and the function that uses the matcher returns the observations that correspond to the pattern; otherwise, the function returns null.

**TS_MATCHER_SUBSEQ_PS(Double)**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with a subsequence of a string time series, to within the specified coverage threshold. The threshold is a double-precision number in the range 0.0 - 1.0 that indicates the minimum ratio of pattern size to sequence size. For example, a threshold of 0.75 means that the specified pattern must match at least 75% of the sequence of time series values, in sequence but not necessarily contiguously. If the threshold is met, the pattern is considered to match, and the function that uses the matcher returns the observations that correspond to the pattern; otherwise, the function returns null.

**TS_MATCHER_SUBSEQ_PM(Double)**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with a subsequence of a string time series, to within the specified coverage threshold. The threshold is a double-precision number in the range 0.0 - 1.0 that indicates the minimum ratio of pattern size to match string size. For example, a threshold of 0.75 means that the specified pattern must match at least 75% of the match string, in sequence but not necessarily contiguously. If the threshold is met, the pattern is considered to match, and the function that uses the matcher returns the observations that correspond to the pattern; otherwise, the function returns null.

**TS_MATCHER_SUBSEQ_MS(Double)**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with a subsequence of a string time series, to within the specified coverage threshold. The threshold is a double-precision number in the range 0.0 - 1.0 that indicates the minimum ratio of match string size to sequence size. For example, a threshold of 0.75 means that the specified pattern must match at least 75% of the sequence of time series values. If the threshold is met, the pattern is considered to match the subsequence and the function that uses the matcher returns the observations that correspond to the match string; otherwise, the function returns null.

**TS_MATCHER_SUBSET_PS(Double)**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with a string time series, regardless of the order in the items in the pattern and the order in the time series. The specified coverage threshold is a double-precision number in the range 0.0 - 1.0 that indicates the minimum ratio of pattern size to sequence size. For example, a threshold of 0.75 means that the specified pattern must match at least 75% of the sequence of time series values. If the threshold is met, the pattern is considered to match, and the function that uses the matcher returns the observations that correspond to the pattern; otherwise, the function returns null.

**TS_MATCHER_SUBSET_PM(Double)**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with a string time series, regardless of the order in which the items in the pattern occur in the time series. The specified coverage threshold is a double-precision number in the range 0.0 - 1.0 that indicates the minimum ratio of pattern size to match string size. For example, a threshold of 0.75 means that the specified pattern must match at least 75% of the match string, in sequence but not necessarily contiguously. If the threshold is met, the pattern is considered to match, and the function that uses the matcher returns the observations that correspond to the pattern; otherwise, the function returns null.

**TS_MATCHER_SUBSET_MS(Double)**
Output: MatcherType  
Creates a matcher that matches an array of string values (the *pattern*) with a string time series, regardless of the order in which the items in the pattern occur in the time series. The specified coverage threshold is a double-precision number in the range 0.0 - 1.0 that indicates the minimum ratio of match string size to sequence size. For example, a threshold of 0.75 means that the specified pattern must match at least 75% of the match string, in sequence but not necessarily contiguously. If the threshold is met, the pattern is considered to match, and the function that uses the matcher returns the observations that correspond to the match string; otherwise, the function returns null.
