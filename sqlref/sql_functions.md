---

copyright:
  years: 2018, 2022
lastupdated: "2022-04-01"

keywords: SQL, functions

subcollection: sql-query

---

# SQL functions
{: #sqlfunctions}

You can use any of the following functions in your query.

## !
{: #!}

expr
:   Logical not.

## %
{: #%}

expr1 % expr2 
:   Returns the remainder after `expr1`/`expr2`.

:   **Example of an SQL function usage fragment:** 

    ```sql
    > SELECT 2 % 1.8
    ```

:   **Result value:**

    ```sql
    0.2
    ```

:   **Example of an SQL function usage fragment:**

    ```sql
    > SELECT MOD(2, 1.8)
    ```

:   **Result value:**

    ```sql
    0.2
    ```

## &
{: #&}

expr1 & expr2
:   Returns the result of bitwise AND of `expr1` and `expr2`.

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 3 & 5
   ```

:   **Result value:**

   ```sql
   1
   ```

## *
{: #*}

expr1 * expr2
:   Returns `expr1`*`expr2`.

:   **Example of an SQL function usage fragment:

   ```sql
   > SELECT 2 * 3
   ```

:   **Result value:**

   ```sql
   6
   ```

## +
{: #+}

expr1 + expr2
:   Returns `expr1`+`expr2`.

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 1 + 2
   ```

**Result value:**

   ```sql
   3
   ```

## -
{: #-}

expr1 - expr2
:   Returns `expr1`-`expr2`.

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 2 - 1
   ```

:   **Result value:**

   ```sql
   1
   ```

## /
{: #/}

expr1 / expr2
:   Returns `expr1`/`expr2`. It always performs floating point division.

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 3 / 2</code></pre>
   ```

:   **Result value:**

   ```sql
   1.5
   ```

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 2L / 2L
   ```

:   **Result value:**

   ```sql
   1.0
   ```

## >
{: #>}

expr1 > expr2
:   Returns true if `expr1` is less than `expr2`.

:   **Arguments:**

    expr1, expr2
    :  The two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 1 > 2
   ```

:   Result value:**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 1.1 > '1'
   ```

:   **Result value:**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') > to_date('2009-07-30 04:17:52')
   ```

:   **Result value:**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') > to_date('2009-08-01 04:17:52')
   ```

:   **Result value:**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 1 > NULL
   ```

:   **Result value:**

   ```sql
   NULL
   ```

## >=
{: #>=}

expr1 >= expr2
:   Returns true if `expr1` is less than or equal to `expr2`.

:   **Arguments:**

    expr1, expr2
    :   The two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 2 >= 2
   ```

:   **Result value:**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment:**

   ```sql
   > SELECT 1.0 >= '1'
   ```

:   **Result value:**

<pre><code> true</code></pre>

:   **Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2009-07-30 04:17:52') &lt;= to_date('2009-07-30 04:17:52')</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2009-07-30 04:17:52') &lt;= to_date('2009-08-01 04:17:52')</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 &lt;= NULL</code></pre>

**Result value:**

<pre><code> NULL</code></pre>


## &lt;=&gt;
{: #&lt;=&gt;}

expr1 &lt;=&gt; expr2 - Returns same result as the EQUAL(=) operator for non-null operands,
but returns true if both are null, false if one of the them is null.

**Arguments:**

<ul>
<li>expr1, expr2 - the two expressions must be same type or can be cast to a common type,
    and must be a type that can be used in equality comparison. Map type is not supported.
    For complex types such array and struct, the data types of fields must be orderable.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2 &lt;=&gt; 2</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 &lt;=&gt; '1'</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT true &lt;=&gt; NULL</code></pre>

**Result value:**

<pre><code> false</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT NULL &lt;=&gt; NULL</code></pre>

**Result value:**

<pre><code> true</code></pre>


## =
{: #=}

expr1 = expr2 - Returns true if <code>expr1</code> equals <code>expr2</code>, or false otherwise.

**Arguments:**

<ul>
<li>expr1, expr2 - the two expressions must be same type or can be cast to a common type,
    and must be a type that can be used in equality comparison. Map type is not supported.
    For complex types such array and struct, the data types of fields must be orderable.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2 = 2</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 = '1'</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT true = NULL</code></pre>

**Result value:**

<pre><code> NULL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT NULL = NULL</code></pre>

**Result value:**

<pre><code> NULL</code></pre>

## ==
{: #==}

expr1 == expr2 - Returns true if <code>expr1</code> equals <code>expr2</code>, or false otherwise.

**Arguments:**

<ul>
<li>expr1, expr2 - the two expressions must be same type or can be cast to a common type,
    and must be a type that can be used in equality comparison. Map type is not supported.
    For complex types such array and struct, the data types of fields must be orderable.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2 == 2</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 == '1'</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT true == NULL</code></pre>

**Result value:**

<pre><code> NULL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT NULL == NULL</code></pre>

**Result value:**

<pre><code> NULL</code></pre>

## &gt;
{: #&gt;}

expr1 &gt; expr2 - Returns true if <code>expr1</code> is greater than <code>expr2</code>.

**Arguments:**

<ul>
<li>expr1, expr2 - the two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2 &gt; 1</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2 &gt; '1.1'</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2009-07-30 04:17:52') &gt; to_date('2009-07-30 04:17:52')</code></pre>

**Result value:**

<pre><code> false</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2009-07-30 04:17:52') &gt; to_date('2009-08-01 04:17:52')</code></pre>

**Result value:**

<pre><code> false</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 &gt; NULL</code></pre>

**Result value:**

<pre><code> NULL</code></pre>


## &gt;=
{: #&gt;=}

expr1 &gt;= expr2 - Returns true if <code>expr1</code> is greater than or equal to <code>expr2</code>.

**Arguments:**

<ul>
<li>expr1, expr2 - the two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2 &gt;= 1</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2.0 &gt;= '2.1'</code></pre>

**Result value:**

<pre><code> false</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2009-07-30 04:17:52') &gt;= to_date('2009-07-30 04:17:52')</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2009-07-30 04:17:52') &gt;= to_date('2009-08-01 04:17:52')</code></pre>

**Result value:**

<pre><code> false</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 &gt;= NULL</code></pre>

**Result value:**

<pre><code> NULL</code></pre>


## ^
{: #^}

expr1 ^ expr2 - Returns the result of bitwise exclusive OR of <code>expr1</code> and <code>expr2</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 3 ^ 5</code></pre>

**Result value:**

<pre><code> 2</code></pre>


## abs
{: #abs}

abs(expr) - Returns the absolute value of the numeric value.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT abs(-1)</code></pre>

**Result value:**

<pre><code> 1</code></pre>


## acos
{: #acos}

acos(expr) - Returns the inverse cosine (also known as arccosine) of <code>expr</code> if -1&lt;=<code>expr</code>&lt;=1 or NaN otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT acos(1)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT acos(2)</code></pre>

**Result value:**

<pre><code> NaN</code></pre>


## add_months
{: #add_months}

add_months(start_date, num_months) - Returns the date that is <code>num_months</code> after <code>start_date</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT add_months('2016-08-31', 1)</code></pre>

**Result value:**

<pre><code> 2016-09-30</code></pre>

<strong>Since:</strong> 1.5.0

## and
{: #and}

expr1 and expr2 - Logical AND.

## approx_count_distinct
{: #approx_count_distinct}

approx_count_distinct(expr[, relativeSD]) - Returns the estimated cardinality by HyperLogLog++.
<code>relativeSD</code> defines the maximum estimation error allowed.


## approx_percentile
{: #approx_percentile}

approx_percentile(col, percentage [, accuracy]) - Returns the approximate percentile value of numeric
column <code>col</code> at the indicated percentage. The value of percentage must be between 0.0
and 1.0. The <code>accuracy</code> parameter (default: 10000) is a positive numeric literal that
controls approximation accuracy at the cost of memory. Higher value of <code>accuracy</code> yields
better accuracy, <code>1.0/accuracy</code> is the relative error of the approximation.
When <code>percentage</code> is an array, each value of the percentage array must be between 0.0 and 1.0.
In this case, returns the approximate percentile array of column <code>col</code> at the indicated
percentage array.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT approx_percentile(10.0, array(0.5, 0.4, 0.1), 100)</code></pre>

**Result value:**

<pre><code> [10.0,10.0,10.0]</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT approx_percentile(10.0, 0.5, 100)</code></pre>

**Result value:**

<pre><code> 10.0</code></pre>


## array
{: #array}

array(expr, ...) - Returns an array with the indicated elements.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT array(1, 2, 3)</code></pre>

**Result value:**

<pre><code> [1,2,3]</code></pre>


## array_contains
{: #array_contains}

array_contains(array, value) - Returns true if the array contains the value.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT array_contains(array(1, 2, 3), 2)</code></pre>

**Result value:**

<pre><code> true</code></pre>


## ascii
{: #ascii}

ascii(str) - Returns the numeric value of the first character of <code>str</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ascii('222')</code></pre>

**Result value:**

<pre><code> 50</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ascii(2)</code></pre>

**Result value:**

<pre><code> 50</code></pre>


## asin
{: #asin}

asin(expr) - Returns the inverse sine (also known as arcsine) the arc sin of <code>expr</code> if -1&lt;=<code>expr</code>&lt;=1 or NaN otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT asin(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT asin(2)</code></pre>

**Result value:**

<pre><code> NaN</code></pre>


## atan
{: #atan}

atan(expr) - Returns the inverse tangent (also known as arctangent).

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT atan(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## atan2
{: #atan2}

atan2(expr1, expr2) - Returns the angle in radians between the positive x-axis of a plane and the point indicated by the coordinates (<code>expr1</code>, <code>expr2</code>).

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT atan2(0, 0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## avg
{: #avg}

avg(expr) - Returns the mean that is calculated from values of a group.


## base64
{: #base64}

base64(bin) - Converts the argument from a binary <code>bin</code> to a base 64 string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT base64('Spark SQL')</code></pre>

**Result value:**

<pre><code> U3BhcmsgU1FM</code></pre>


## bigint
{: #bigint}

bigint(expr) - Casts the value <code>expr</code> to the target data type <code>bigint</code>.


## bin
{: #bin}

bin(expr) - Returns the string representation of the long value <code>expr</code> represented in binary.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT bin(13)</code></pre>

**Result value:**

<pre><code> 1101</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT bin(-13)</code></pre>

**Result value:**

<pre><code> 1111111111111111111111111111111111111111111111111111111111110011</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT bin(13.3)</code></pre>

**Result value:**

<pre><code> 1101</code></pre>


## binary
{: #binary}

binary(expr) - Casts the value <code>expr</code> to the target data type <code>binary</code>.

## bit_length
{: #bit_length}

bit_length(expr) - Returns the bit length of string data or number of bits of binary data.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT bit_length('Spark SQL')</code></pre>

**Result value:**

<pre><code> 72</code></pre>


## boolean
{: #boolean}

boolean(expr) - Casts the value <code>expr</code> to the target data type <code>boolean</code>.

## bround
{: #bround}

bround(expr, d) - Returns <code>expr</code> rounded to <code>d</code> decimal places by using HALF_EVEN rounding mode.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT bround(2.5, 0)</code></pre>

**Result value:**

<pre><code> 2.0</code></pre>


## cast
{: #cast}

cast(expr AS type) - Casts the value <code>expr</code> to the target data type <code>type</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT cast('10' as int)</code></pre>

**Result value:**

<pre><code> 10</code></pre>


## cbrt
{: #cbrt}

cbrt(expr) - Returns the cube root of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT cbrt(27.0)</code></pre>

**Result value:**

<pre><code> 3.0</code></pre>


## ceil
{: #ceil}

ceil(expr) - Returns the smallest integer not smaller than <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ceil(-0.1)</code></pre>

**Result value:**

<pre><code> 0</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ceil(5)</code></pre>

**Result value:**

<pre><code> 5</code></pre>


## ceiling
{: #ceiling}

ceiling(expr) - Returns the smallest integer not smaller than <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ceiling(-0.1)</code></pre>

**Result value:**

<pre><code> 0</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ceiling(5)</code></pre>

**Result value:**

<pre><code> 5</code></pre>


## char
{: #char}

char(expr) - Returns the ASCII character that has the binary equivalent to <code>expr</code>. If n is larger than 256, the result is equivalent to chr(n % 256)

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT char(65)</code></pre>

**Result value:**

<pre><code> A</code></pre>


## char_length
{: #char_length}

char_length(expr) - Returns the character length of string data or number of bytes of binary data. The length of string data includes the trailing spaces. The length of binary data includes binary zeros.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT char_length('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CHAR_LENGTH('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CHARACTER_LENGTH('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>


## character_length
{: #character_length}

character_length(expr) - Returns the character length of string data or number of bytes of binary data. The length of string data includes the trailing spaces. The length of binary data includes binary zeros.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT character_length('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CHAR_LENGTH('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CHARACTER_LENGTH('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>


## chr
{: #chr}

chr(expr) - Returns the ASCII character that has the binary equivalent to <code>expr</code>. If n is larger than 256, the result is equivalent to chr(n % 256)

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT chr(65)</code></pre>

**Result value:**

<pre><code> A</code></pre>


## coalesce
{: #coalesce}

coalesce(expr1, expr2, ...) - Returns the first non-null argument if exists. Otherwise, null.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT coalesce(NULL, 1, NULL)</code></pre>

**Result value:**

<pre><code> 1</code></pre>


## collect_list
{: #collect_list}

collect_list(expr) - Collects and returns a list of non-unique elements.


## collect_set
{: #collect_set}

collect_set(expr) - Collects and returns a set of unique elements.


## concat
{: #concat}

concat(str1, str2, ..., strN) - Returns the concatenation of str1, str2, ..., strN.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT concat('Spark', 'SQL')</code></pre>

**Result value:**

<pre><code> SparkSQL</code></pre>


## concat_ws
{: #concat_ws}

concat_ws(sep, [str | array(str)]+) - Returns the concatenation of the strings separated by <code>sep</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT concat_ws(' ', 'Spark', 'SQL')</code></pre>

**Result value:**

<pre><code> Spark SQL</code></pre>


## conv
{: #conv}

conv(num, from_base, to_base) - Convert <code>num</code> from <code>from_base</code> to <code>to_base</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT conv('100', 2, 10)</code></pre>

**Result value:**

<pre><code> 4</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT conv(-10, 16, -10)</code></pre>

**Result value:**

<pre><code> -16</code></pre>


## corr
{: #corr}

corr(expr1, expr2) - Returns Pearson coefficient of correlation between a set of number pairs.


## cos
{: #cos}

cos(expr) - Returns the cosine of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT cos(0)</code></pre>

**Result value:**

<pre><code> 1.0</code></pre>


## cosh
{: #cosh}

cosh(expr) - Returns the hyperbolic cosine of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT cosh(0)</code></pre>

**Result value:**

<pre><code> 1.0</code></pre>


## cot
{: #cot}

cot(expr) - Returns the cotangent of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT cot(1)</code></pre>

**Result value:**

<pre><code> 0.6420926159343306</code></pre>


## count
{: #count}

count(*) - Returns the total number of retrieved rows, including rows that contain null.

count(expr) - Returns the number of rows for which the supplied expression is non-null.

count(DISTINCT expr[, expr...]) - Returns the number of rows for which the supplied expressions are unique and non-null.


## count_min_sketch
{: #cont_min_sketch}

count_min_sketch(col, eps, confidence, seed) - Returns a count-min sketch of a column with the indicated esp,
confidence, and seed. The result is an array of bytes, which can be de-serialized to a
<code>CountMinSketch</code> before usage. Count-min sketch is a probabilistic data structure that is used for
cardinality estimation by using sublinear space.


## covar_pop
{: #covar_pop}

covar_pop(expr1, expr2) - Returns the population covariance of a set of number pairs.


## covar_samp
{: #covar_samp}

covar_samp(expr1, expr2) - Returns the sample covariance of a set of number pairs.


## crc32
{: #crc32}

crc32(expr) - Returns a cyclic redundancy check value of the <code>expr</code> as a bigint.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT crc32('Spark')</code></pre>

**Result value:**

<pre><code> 1557323817</code></pre>


## cube
{: #cube}

## cume_dist
{: #cume_dist}

cume_dist() - Computes the position of a value relative to all values in the partition.


## current_database
{: #current_database}

current_database() - Returns the current database.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT current_database()</code></pre>

**Result value:**

<pre><code> default</code></pre>


## current_date
{: #current_date}

current_date() - Returns the current date at the start of query evaluation.

<strong>Since:</strong> 1.5.0


## current_timestamp
{: #current_timestamp}

current_timestamp() - Returns the current timestamp at the start of query evaluation.

<strong>Since:</strong> 1.5.0


## date
{: #date}

date(expr) - Casts the value <code>expr</code> to the target data type <code>date</code>.


## date_add
{: #date_add}

date_add(start_date, num_days) - Returns the date that is <code>num_days</code> after <code>start_date</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_add('2016-07-30', 1)</code></pre>

**Result value:**

<pre><code> 2016-07-31</code></pre>

<strong>Since:</strong> 1.5.0


## date_format
{: #date_format}

date_format(timestamp, fmt) - Converts <code>timestamp</code> to a value of string in the format specified by the date format <code>fmt</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_format('2016-04-08', 'y')</code></pre>

**Result value:**

<pre><code> 2016</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_format('2016-04-16T15:16:29.000Z', 'y-MM-dd')</code></pre>

**Result value:**

<pre><code>2016-04-16</code></pre>

<strong>Since:</strong> 1.5.0


## date_sub
{: #date_sub}

date_sub(start_date, num_days) - Returns the date that is <code>num_days</code> before <code>start_date</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_sub('2016-07-30', 1)</code></pre>

**Result value:**

<pre><code> 2016-07-29</code></pre>

<strong>Since:</strong> 1.5.0


## date_trunc
{: #date_trunc}

date_trunc(fmt, ts) - Returns timestamp <code>ts</code> truncated to the unit specified by the format model <code>fmt</code>.
<code>fmt</code> to be one of ["YEAR", "YYYY", "YY", "MON", "MONTH", "MM", "DAY", "DD", "HOUR", "MINUTE", "SECOND", "WEEK", "QUARTER"].

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_trunc('YEAR', '2015-03-05T09:32:05.359')</code></pre>

**Result value:**

<pre><code> 2015-01-01T00:00:00</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_trunc('MM', '2015-03-05T09:32:05.359')</code></pre>

**Result value:**

<pre><code> 2015-03-01T00:00:00</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_trunc('DD', '2015-03-05T09:32:05.359')</code></pre>

**Result value:**

<pre><code> 2015-03-05T00:00:00</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT date_trunc('HOUR', '2015-03-05T09:32:05.359')</code></pre>

**Result value:**

<pre><code> 2015-03-05T09:00:00</code></pre>

<strong>Since:</strong> 2.3.0


## datediff
{: #datediff}

datediff(endDate, startDate) - Returns the number of days from <code>startDate</code> to <code>endDate</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT datediff('2009-07-31', '2009-07-30')</code></pre>

**Result value:**

<pre><code> 1</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT datediff('2009-07-30', '2009-07-31')</code></pre>

**Result value:**

<pre><code> -1</code></pre>

<strong>Since:</strong> 1.5.0


## day
{: #day}

day(date) - Returns the day of month of the date/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT day('2009-07-30')</code></pre>

**Result value:**

<pre><code> 30</code></pre>

<strong>Since:</strong> 1.5.0


## dayofmonth
{: #dayofmonth}

dayofmonth(date) - Returns the day of month of the date/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT dayofmonth('2009-07-30')</code></pre>

**Result value:**

<pre><code> 30</code></pre>

<strong>Since:</strong> 1.5.0


## dayofweek
{: #dayofweek}

dayofweek(date) - Returns the day of the week for date/timestamp (1 = Sunday, 2 = Monday, ..., 7 = Saturday).

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT dayofweek('2009-07-30')</code></pre>

**Result value:**

<pre><code> 5</code></pre>

<strong>Since:</strong> 2.3.0


## dayofyear
{: #dayofyear}

dayofyear(date) - Returns the day of year of the date/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT dayofyear('2016-04-09')</code></pre>

**Result value:**

<pre><code> 100</code></pre>

<strong>Since:</strong> 1.5.0


## decimal
{: #decimal}

decimal(expr) - Casts the value <code>expr</code> to the target data type <code>DECIMAL(10,0)</code>, truncating the result if needed.
Use <code>CAST(expr AS DECIMAL(p,f))</code> to specify precision and fractional digits explicitly.


## decode
{: #decode}

decode(bin, charset) - Decodes the first argument by using the second argument character set.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT decode(encode('abc', 'utf-8'), 'utf-8')</code></pre>

**Result value:**

<pre><code> abc</code></pre>


## degrees
{: #degrees}

degrees(expr) - Converts radians to degrees.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT degrees(3.141592653589793)</code></pre>

**Result value:**

<pre><code> 180.0</code></pre>


## dense_rank
{: #dense_rank}

dense_rank() - Computes the rank of a value in a group of values. The result is one plus the
previously assigned rank value. Unlike the function rank, dense_rank does not produce gaps
in the ranking sequence.


## double
{: #double}

double(expr) - Casts the value <code>expr</code> to the target data type <code>double</code>.


## e

e() - Returns Euler's number, e.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT e()</code></pre>

**Result value:**

<pre><code> 2.718281828459045</code></pre>


## elt
{: #elt}

elt(n, input1, input2, ...) - Returns the <code>n</code>-th input, for example, returns <code>input2</code> when <code>n</code> is 2.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT elt(1, 'scala', 'java')</code></pre>

**Result value:**

<pre><code> scala</code></pre>


## encode
{: #encode}

encode(str, charset) - Encodes the first argument by using the second argument character set.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT encode('abc', 'utf-8')</code></pre>

**Result value:**

<pre><code> abc</code></pre>


## exp
{: #exp}

exp(expr) - Returns e to the power of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT exp(0)</code></pre>

**Result value:**

<pre><code> 1.0</code></pre>


## explode
{: #explode}

explode(expr) - Separates the elements of array <code>expr</code> into multiple rows, or the elements of map <code>expr</code> into multiple rows and columns.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT explode(array(10, 20))</code></pre>

**Result value:**

<pre><code> 10
 20</code></pre>


## explode_outer
{: #explode_outer}

explode_outer(expr) - Separates the elements of array <code>expr</code> into multiple rows, or the elements of map <code>expr</code> into multiple rows and columns.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT explode_outer(array(10, 20))</code></pre>

**Result value:**

<pre><code> 10
 20</code></pre>


## expm1
{: #expm1}

expm1(expr) - Returns exp(<code>expr</code>) - 1.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT expm1(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## factorial
{: #factorial}

factorial(expr) - Returns the factorial of <code>expr</code>. <code>expr</code> is [0..20]. Otherwise, null.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT factorial(5)</code></pre>

**Result value:**

<pre><code> 120</code></pre>


## find_in_set
{: #find_in_set}

find_in_set(str, str_array) - Returns the index (1-based) of the indicated string (<code>str</code>) in the comma-delimited list (<code>str_array</code>).
Returns 0, if the string was not found or if the indicated string (<code>str</code>) contains a comma.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT find_in_set('ab','abc,b,ab,c,def')</code></pre>

**Result value:**

<pre><code> 3</code></pre>


## first
{: #first}

first(expr[, isIgnoreNull]) - Returns the first value of <code>expr</code> for a group of rows.
If <code>isIgnoreNull</code> is true, returns only non-null values.


## first_value
{: #first_value}

first_value(expr[, isIgnoreNull]) - Returns the first value of <code>expr</code> for a group of rows.
If <code>isIgnoreNull</code> is true, returns only non-null values.


## float
{: #float}

float(expr) - Casts the value <code>expr</code> to the target data type <code>float</code>.


## floor
{: #floor}

floor(expr) - Returns the largest integer not greater than <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT floor(-0.1)</code></pre>

**Result value:**

<pre><code> -1</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT floor(5)</code></pre>

**Result value:**

<pre><code> 5</code></pre>


## format_number
{: #format_number}

format_number(expr1, expr2) - Formats the number <code>expr1</code> like '#,###,###.##', rounded to <code>expr2</code>
decimal places. If <code>expr2</code> is 0, the result has no decimal point or fractional part.
This function is supposed to work like MySQL's FORMAT.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT format_number(12332.123456, 4)</code></pre>

**Result value:**

<pre><code> 12,332.1235</code></pre>


## format_string
{: #format_string}

format_string(strfmt, obj, ...) - Returns a formatted string from printf-style format strings.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT format_string(&quot;Hello World %d %s&quot;, 100, &quot;days&quot;)</code></pre>

**Result value:**

<pre><code> Hello World 100 days</code></pre>


## from_json
{: #from_json}

from_json(jsonStr, schema[, options]) - Returns a struct value with the indicated <code>jsonStr</code> and <code>schema</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT from_json('{&quot;a&quot;:1, &quot;b&quot;:0.8}', 'a INT, b DOUBLE')</code></pre>

**Result value:**

<pre><code> {&quot;a&quot;:1, &quot;b&quot;:0.8}</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT from_json('{&quot;time&quot;:&quot;26/08/2015&quot;}', 'time Timestamp', map('timestampFormat', 'dd/MM/yyyy'))</code></pre>

**Result value:**

<pre><code> {&quot;time&quot;:&quot;2015-08-26 00:00:00.0&quot;}</code></pre>

<strong>Since:</strong> 2.2.0


## from_unixtime
{: #from_unixtime}

from_unixtime(unix_time, format) - Returns <code>unix_time</code> in the specified <code>format</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT from_unixtime(0, 'yyyy-MM-dd HH:mm:ss')</code></pre>

**Result value:**

<pre><code> 1970-01-01 00:00:00</code></pre>

<strong>Since:</strong> 1.5.0


## from_utc_timestamp
{: #from_utc_timestamp}

from_utc_timestamp(timestamp, timezone) - Given a timestamp, such as '2017-07-14 02:40:00.0', this function interprets it as a time in Coordinated Universal Time (UTC), and renders that time as a timestamp in the indicated time zone. For example, 'GMT+1' would yield '2017-07-14 03:40:00.0'.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT from_utc_timestamp('2016-08-31', 'Asia/Seoul')</code></pre>

**Result value:**

<pre><code> 2016-08-31 09:00:00</code></pre>

<strong>Since:</strong> 1.5.0


## get_json_object
{: #get_json_object}

get_json_object(json_txt, path) - Extracts a JSON object from <code>path</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT get_json_object('{&quot;a&quot;:&quot;b&quot;}', '$.a')</code></pre>

**Result value:**

<pre><code> b</code></pre>


## greatest
{: #greatest}

greatest(expr, ...) - Returns the greatest value of all parameters, skipping null values.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT greatest(10, 9, 2, 4, 3)</code></pre>

**Result value:**

<pre><code> 10</code></pre>


## grouping
{: #grouping}


## grouping_id
{: #grouping_id}


## hash
{: #hash}

hash(expr1, expr2, ...) - Returns a hash value of the arguments.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT hash('Spark', array(123), 2)</code></pre>

**Result value:**

<pre><code> -1321691492</code></pre>


## hex
{: #hex}

hex(expr) - Converts <code>expr</code> to hexadecimal.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT hex(17)</code></pre>

**Result value:**

<pre><code> 11</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT hex('Spark SQL')</code></pre>

**Result value:**

<pre><code> 537061726B2053514C</code></pre>


## hour
{: #hour}

hour(timestamp) - Returns the hour component of the string/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT hour('2009-07-30 12:58:59')</code></pre>

**Result value:**

<pre><code> 12</code></pre>

<strong>Since:</strong> 1.5.0


## hypot
{: #hypot}

hypot(expr1, expr2) - Returns sqrt(<code>expr1</code><strong>2 + <code>expr2</code></strong>2).

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT hypot(3, 4)</code></pre>

**Result value:**

<pre><code> 5.0</code></pre>


## if
{: #if}

if(expr1, expr2, expr3) - If <code>expr1</code> evaluates to true, then returns <code>expr2</code>; otherwise, returns <code>expr3</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT if(1 &lt; 2, 'a', 'b')</code></pre>

**Result value:**

<pre><code> a</code></pre>


## ifnull
{: #ifnull}

ifnull(expr1, expr2) - Returns <code>expr2</code> if <code>expr1</code> is null, or <code>expr1</code> otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ifnull(NULL, array('2'))</code></pre>

**Result value:**

<pre><code> [&quot;2&quot;]</code></pre>


## in
{: #in}

expr1 in(expr2, expr3, ...) - Returns true if <code>expr</code> equals to any valN.

**Arguments:**

<ul>
<li>expr1, expr2, expr3, ... - the arguments must be same type.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 in(1, 2, 3)</code></pre>

**Result value:**

<pre><code> true</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 1 in(2, 3, 4)</code></pre>

**Result value:**

<pre><code> false</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT named_struct('a', 1, 'b', 2) in(named_struct('a', 1, 'b', 1), named_struct('a', 1, 'b', 3))</code></pre>

**Result value:**

<pre><code> false</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT named_struct('a', 1, 'b', 2) in(named_struct('a', 1, 'b', 2), named_struct('a', 1, 'b', 3))</code></pre>

**Result value:**

<pre><code> true</code></pre>


## initcap
{: #initcap}

initcap(str) - Returns <code>str</code> with the first letter of each word in uppercase.
All other letters are in lowercase. Words are delimited by white space.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT initcap('sPark sql')</code></pre>

**Result value:**

<pre><code> Spark Sql</code></pre>


## inline
{: #inline}

inline(expr) - Explodes an array of structs into a table.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT inline(array(struct(1, 'a'), struct(2, 'b')))</code></pre>

**Result value:**

<pre><code> 1  a
 2  b</code></pre>


## inline_outer
{: #inline_outer}

inline_outer(expr) - Explodes an array of structs into a table.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT inline_outer(array(struct(1, 'a'), struct(2, 'b')))</code></pre>

**Result value:**

<pre><code> 1  a
 2  b</code></pre>


## input_file_name
{: #input_file_name}

input_file_name() - Returns the name of the file that is being read, or empty string if not available.


## instr
{: #instr}

instr(str, substr) - Returns the (1-based) index of the first occurrence of <code>substr</code> in <code>str</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT instr('SparkSQL', 'SQL')</code></pre>

**Result value:**

<pre><code> 6</code></pre>


## int
{: #int}

int(expr) - Casts the value <code>expr</code> to the target data type <code>int</code>.


## isnan
{: #isnan}

isnan(expr) - Returns true if <code>expr</code> is NaN, or false otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT isnan(cast('NaN' as double))</code></pre>

**Result value:**

<pre><code> true</code></pre>


## isnotnull
{: #isnotnull}

isnotnull(expr) - Returns true if <code>expr</code> is not null, or false otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT isnotnull(1)</code></pre>

**Result value:**

<pre><code> true</code></pre>


## isnull
{: #isnull}

isnull(expr) - Returns true if <code>expr</code> is null, or false otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT isnull(1)</code></pre>

**Result value:**

<pre><code> false</code></pre>


## json_tuple
{: #json_tuple}

json_tuple(jsonStr, p1, p2, ..., pn) - Returns a tuple like the function  `get_json_object`, but it takes multiple names. All the input parameters and output column types are string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT json_tuple('{&quot;a&quot;:1, &quot;b&quot;:2}', 'a', 'b')</code></pre>

**Result value:**

<pre><code> 1  2</code></pre>


## kurtosis
{: #kurtosis}

kurtosis(expr) - Returns the kurtosis value that is calculated from values of a group.


## lag
{: #lag}

lag(input[, offset[, default]]) - Returns the value of <code>input</code> at the <code>offset</code>th row
before the current row in the window. The default value of <code>offset</code> is 1 and the default
value of <code>default</code> is null. If the value of <code>input</code> at the <code>offset</code>th row is null,
null is returned. If no such offset row exists (for example, when the offset is 1, the first
row of the window does not have any previous row), <code>default</code> is returned.


## last
{: #last}

last(expr[, isIgnoreNull]) - Returns the last value of <code>expr</code> for a group of rows.
If <code>isIgnoreNull</code> is true, returns only non-null values.


## last_day
{: #last_day}

last_day(date) - Returns the last day of the month that the date belongs to.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT last_day('2009-01-12')</code></pre>

**Result value:**

<pre><code> 2009-01-31</code></pre>

<strong>Since:</strong> 1.5.0


## last_value
{: #last_value}

last_value(expr[, isIgnoreNull]) - Returns the last value of <code>expr</code> for a group of rows.
If <code>isIgnoreNull</code> is true, returns only non-null values.


## lcase
{: #lcase}

lcase(str) - Returns <code>str</code> with all characters that are changed to lowercase.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT lcase('SparkSql')</code></pre>

**Result value:**

<pre><code> sparksql</code></pre>


## lead
{: #lead}

lead(input[, offset[, default]]) - Returns the value of <code>input</code> at the <code>offset</code>th row
after the current row in the window. The default value of <code>offset</code> is 1 and the default
value of <code>default</code> is null. If the value of <code>input</code> at the <code>offset</code>th row is null,
null is returned. If no such offset row exists (for example, when the offset is 1, the last
row of the window does not have any subsequent row), <code>default</code> is returned.


## least
{: #least}

least(expr, ...) - Returns the least value of all parameters, skipping null values.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT least(10, 9, 2, 4, 3)</code></pre>

**Result value:**

<pre><code> 2</code></pre>


## left
{: #left}

left(str, len) - Returns the leftmost <code>len</code>(<code>len</code> can be string type) characters from the string <code>str</code>, if <code>len</code> is less or equal than 0 the result is an empty string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT left('Spark SQL', 3)</code></pre>

**Result value:**

<pre><code> Spa</code></pre>


## length
{: #length}

length(expr) - Returns the character length of string data or number of bytes of binary data. The length of string data includes the trailing spaces. The length of binary data includes binary zeros.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT length('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CHAR_LENGTH('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CHARACTER_LENGTH('Spark SQL ')</code></pre>

**Result value:**

<pre><code> 10</code></pre>


## levenshtein
{: #levenshtein}

levenshtein(str1, str2) - Returns the Levenshtein distance between the two indicated strings.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT levenshtein('kitten', 'sitting')</code></pre>

**Result value:**

<pre><code> 3</code></pre>


## like
{: #like}

str like pattern - Returns true if str matches pattern, null if any arguments are null, otherwise, false.

**Arguments:**

<ul>
<li>str - a string expression</li>
<li>

pattern - A string expression. The pattern is a string that is matched literally, with
    exception to the following special symbols:

_ matches any one character in the input (similar to . in posix regular expressions)

% matches zero or more characters in the input (similar to .* in posix regular
expressions)

The escape character is '\'. If an escape character precedes a special symbol or another
escape character, the following character is matched literally. It is invalid to escape
any other character.

String literals are unescaped in our SQL parser. For example, to match "\abc", the pattern is "\\abc".

</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT '%SystemDrive%\Users\John' like '\%SystemDrive\%\\Users%'</code></pre>

**Result value:**

<pre><code>true</code></pre>

<strong>Note:</strong>

Use RLIKE to match with standard regular expressions.


## ln
{: #ln}

ln(expr) - Returns the natural logarithm (base e) of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ln(1)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## locate
{: #locate}

locate(substr, str[, pos]) - Returns the position of the first occurrence of <code>substr</code> in <code>str</code> after position <code>pos</code>.
The indicated <code>pos</code> and return value are 1-based.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT locate('bar', 'foobarbar')</code></pre>

**Result value:**

<pre><code> 4</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT locate('bar', 'foobarbar', 5)</code></pre>

**Result value:**

<pre><code> 7</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT POSITION('bar' IN 'foobarbar')</code></pre>

**Result value:**

<pre><code> 4</code></pre>


## log
{: #log}

log(base, expr) - Returns the logarithm of <code>expr</code> with <code>base</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT log(10, 100)</code></pre>

**Result value:**

<pre><code> 2.0</code></pre>


## log10
{: #log10}

log10(expr) - Returns the logarithm of <code>expr</code> with base 10.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT log10(10)</code></pre>

**Result value:**

<pre><code> 1.0</code></pre>


## log1p
{: #log1p}

log1p(expr) - Returns log(1 + <code>expr</code>).

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT log1p(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## log2
{: #log2}

log2(expr) - Returns the logarithm of <code>expr</code> with base 2.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT log2(2)</code></pre>

**Result value:**

<pre><code> 1.0</code></pre>


## lower
{: #lower}

lower(str) - Returns <code>str</code> with all characters that are changed to lowercase.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT lower('SparkSql')</code></pre>

**Result value:**

<pre><code> sparksql</code></pre>


## lpad
{: #lpad}

lpad(str, len, pad) - Returns <code>str</code>, left-padded with <code>pad</code> to a length of <code>len</code>.
If <code>str</code> is longer than <code>len</code>, the return value is shortened to <code>len</code> characters.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT lpad('hi', 5, '??')</code></pre>

**Result value:**

<pre><code> ???hi</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT lpad('hi', 1, '??')</code></pre>

**Result value:**

<pre><code> h</code></pre>

## ltrim
{: #ltrim}

ltrim(str) - Removes the leading space characters from <code>str</code>.

ltrim(trimStr, str) - Removes the leading string contains the characters from the trim string.

**Arguments:**

<ul>
<li>str - A string expression</li>
<li>trimStr - The trim string characters to trim, the default value is a single space.</li>
</ul>

**Example of an SQL function usage fragment:**
<pre><code>&gt; SELECT ltrim('    SparkSQL   ')</code></pre>

**Result value:**

<pre><code> SparkSQL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ltrim('Sp', 'SSparkSQLS')</code></pre>

**Result value:**

<pre><code> arkSQLS</code></pre>


## map
{: #map}

map(key0, value0, key1, value1, ...) - Creates a map with the indicated key/value pairs.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT map(1.0, '2', 3.0, '4')</code></pre>

**Result value:**

<pre><code> {1.0:&quot;2&quot;,3.0:&quot;4&quot;}</code></pre>


## map_keys
{: #map_keys}

map_keys(map) - Returns an unordered array that contains the keys of the map.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT map_keys(map(1, 'a', 2, 'b'))</code></pre>

**Result value:**

<pre><code> [1,2]</code></pre>


## map_values
{: #map_values}

map_values(map) - Returns an unordered array that contains the values of the map.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT map_values(map(1, 'a', 2, 'b'))</code></pre>

**Result value:**

<pre><code> [&quot;a&quot;,&quot;b&quot;]</code></pre>


## max
{: #max}

max(expr) - Returns the maximum value of <code>expr</code>.


## md5
{: #md5}

md5(expr) - Returns an MD5 128-bit checksum as a hex string of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT md5('Spark')</code></pre>

**Result value:**

<pre><code> 8cde774d6f7333752ed72cacddb05126</code></pre>

## mean
{: #mean}

mean(expr) - Returns the mean that is calculated from values of a group.


## min
{: #min}

min(expr) - Returns the minimum value of <code>expr</code>.


## minute
{: #minute}

minute(timestamp) - Returns the minute component of the string/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT minute('2009-07-30 12:58:59')</code></pre>

**Result value:**

<pre><code> 58</code></pre>

<strong>Since:</strong> 1.5.0


## mod
{: #mod}

expr1 mod expr2 - Returns the remainder after <code>expr1</code>/<code>expr2</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 2 mod 1.8;</code></pre>

**Result value:**

<pre><code> 0.2</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT MOD(2, 1.8)</code></pre>

**Result value:**

<pre><code> 0.2</code></pre>


## monotonically_increasing_id
{: #monotonically_increasing_id}

monotonically_increasing_id() - Returns monotonically increasing 64-bit integers. The generated ID is guaranteed
to be monotonically increasing and unique, but not consecutive. The current implementation
puts the partition ID in the upper 31 bits, and the lower 33 bits represent the record number
within each partition. The assumption is that the data frame has less than 1 billion
partitions, and each partition has less than 8 billion records.


## month
{: #month}

month(date) - Returns the month component of the date/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT month('2016-07-30')</code></pre>

**Result value:**

<pre><code> 7</code></pre>

<strong>Since:</strong> 1.5.0


## months_between
{: #months_between}

months_between(timestamp1, timestamp2) - Returns number of months between <code>timestamp1</code> and <code>timestamp2</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT months_between('1997-02-28 10:30:00', '1996-10-30')</code></pre>

**Result value:**

<pre><code> 3.94959677</code></pre>

<strong>Since:</strong> 1.5.0


## named_struct
{: #named_struct}

named_struct(name1, val1, name2, val2, ...) - Creates a struct with the indicated field names and values.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT named_struct(&quot;a&quot;, 1, &quot;b&quot;, 2, &quot;c&quot;, 3)</code></pre>

**Result value:**

<pre><code> {&quot;a&quot;:1,&quot;b&quot;:2,&quot;c&quot;:3}</code></pre>


## nanvl
{: #nanvl}

nanvl(expr1, expr2) - Returns <code>expr1</code> if it's not NaN, or <code>expr2</code> otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT nanvl(cast('NaN' as double), 123)</code></pre>

**Result value:**

<pre><code> 123.0</code></pre>


## negative
{: #negative}

negative(expr) - Returns the negated value of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT negative(1)</code></pre>

**Result value:**

<pre><code> -1</code></pre>


## next_day
{: #next_day}

next_day(start_date, day_of_week) - Returns the first date that is later than <code>start_date</code> and named as indicated.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT next_day('2015-01-14', 'TU')</code></pre>

**Result value:**

<pre><code> 2015-01-20</code></pre>

<strong>Since:</strong> 1.5.0


## not
{: #not}

not expr - Logical not.


## now
{: #now}

now() - Returns the current timestamp at the start of query evaluation.

<strong>Since:</strong> 1.5.0


## ntile
{: #ntile}

ntile(n) - Divides the rows for each window partition into <code>n</code> buckets that range
from 1 to at most <code>n</code>.


## nullif
{: #nullif}

nullif(expr1, expr2) - Returns null if <code>expr1</code> equals to <code>expr2</code>, or <code>expr1</code> otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT nullif(2, 2)</code></pre>

**Result value:**

<pre><code> NULL</code></pre>


## nvl
{: #nvl}

nvl(expr1, expr2) - Returns <code>expr2</code> if <code>expr1</code> is null, or <code>expr1</code> otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT nvl(NULL, array('2'))</code></pre>

**Result value:**

<pre><code> [&quot;2&quot;]</code></pre>


## nvl2
{: #nvl2}

nvl2(expr1, expr2, expr3) - Returns <code>expr2</code> if <code>expr1</code> is not null, or <code>expr3</code> otherwise.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT nvl2(NULL, 2, 1)</code></pre>

**Result value:**

<pre><code> 1</code></pre>


## octet_length
{: #octet_length}

octet_length(expr) - Returns the byte length of string data or number of bytes of binary data.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT octet_length('Spark SQL')</code></pre>

**Result value:**

<pre><code> 9</code></pre>


## or
{: #or}

expr1 or expr2 - Logical OR.


## parse_url
{: #parse_url}

parse_url(url, partToExtract[, key]) - Extracts a part from a URL.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT parse_url('http://spark.apache.org/path?query=1', 'HOST')</code></pre>

**Result value:**

<pre><code> spark.apache.org</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT parse_url('http://spark.apache.org/path?query=1', 'QUERY')</code></pre>

**Result value:**

<pre><code> query=1</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT parse_url('http://spark.apache.org/path?query=1', 'QUERY', 'query')</code></pre>

**Result value:**

<pre><code> 1</code></pre>


## percent_rank
{: #percent_rank}

percent_rank() - Computes the percentage ranking of a value in a group of values.


## percentile
{: #percentile}

percentile(col, percentage [, frequency]) - Returns the exact percentile value of numeric column
<code>col</code> at the indicated percentage. The value of percentage must be between 0.0 and 1.0. The value of frequency must be a positive integral.

percentile(col, array(percentage1 [, percentage2]...) [, frequency]) - Returns the exact
percentile value array of numeric column <code>col</code> at the indicated percentage. Each value of the percentage array must be between 0.0 and 1.0. The value of frequency must be a
positive integral.


## percentile_approx
{: #percentile_approx}

percentile_approx(col, percentage [, accuracy]) - Returns the approximate percentile value of numeric
column <code>col</code> at the indicated percentage. The value of percentage must be between 0.0
and 1.0. The <code>accuracy</code> parameter (default: 10000) is a positive numeric literal that
controls approximation accuracy at the cost of memory. Higher value of <code>accuracy</code> yields
better accuracy, <code>1.0/accuracy</code> is the relative error of the approximation.
When <code>percentage</code> is an array, each value of the percentage array must be between 0.0 and 1.0.
In this case, returns the approximate percentile array of column <code>col</code> at the indicated
percentage array.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT percentile_approx(10.0, array(0.5, 0.4, 0.1), 100)</code></pre>

**Result value:**

<pre><code> [10.0,10.0,10.0]</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT percentile_approx(10.0, 0.5, 100)</code></pre>

**Result value:**

<pre><code> 10.0</code></pre>


## pi
{: #pi}

pi() - Returns pi.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT pi()</code></pre>

**Result value:**

<pre><code> 3.141592653589793</code></pre>


## pmod
{: #pmod}

pmod(expr1, expr2) - Returns the positive value of <code>expr1</code> mod <code>expr2</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT pmod(10, 3)</code></pre>

**Result value:**

<pre><code> 1</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT pmod(-10, 3)</code></pre>

**Result value:**

<pre><code> 2</code></pre>


## posexplode
{: #posexplode}

posexplode(expr) - Separates the elements of array <code>expr</code> into multiple rows with positions, or the elements of map <code>expr</code> into multiple rows and columns with positions.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT posexplode(array(10,20))</code></pre>

**Result value:**

<pre><code> 0  10
 1  20</code></pre>


## posexplode_outer
{: #posexplode_outer}

posexplode_outer(expr) - Separates the elements of array <code>expr</code> into multiple rows with positions, or the elements of map <code>expr</code> into multiple rows and columns with positions.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT posexplode_outer(array(10,20))
 0  10
 1  20
</code></pre>


## position
{: #position}

position(substr, str[, pos]) - Returns the position of the first occurrence of <code>substr</code> in <code>str</code> after position <code>pos</code>.
The indicated <code>pos</code> and return value are 1-based.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT position('bar', 'foobarbar')</code></pre>

**Result value:**

<pre><code> 4</code></pre>

 **Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT position('bar', 'foobarbar', 5)</code></pre>

**Result value:**

<pre><code> 7</code></pre>

 **Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT POSITION('bar' IN 'foobarbar')</code></pre>

**Result value:**

<pre><code> 4</code></pre>


## positive
{: #positive}

positive(expr) - Returns the value of <code>expr</code>.


## pow
{: #pow}

pow(expr1, expr2) - Raises <code>expr1</code> to the power of <code>expr2</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT pow(2, 3)</code></pre>

**Result value:**

<pre><code> 8.0</code></pre>


## power
{: #power}

power(expr1, expr2) - Raises <code>expr1</code> to the power of <code>expr2</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT power(2, 3)</code></pre>

**Result value:**

<pre><code> 8.0</code></pre>


## printf
{: #printf}

printf(strfmt, obj, ...) - Returns a formatted string from printf-style format strings.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT printf(&quot;Hello World %d %s&quot;, 100, &quot;days&quot;)</code></pre>

**Result value:**

<pre><code> Hello World 100 days</code></pre>


## quarter
{: #quarter}

quarter(date) - Returns the quarter of the year for date, in the range 1 - 4.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT quarter('2016-08-31')</code></pre>

**Result value:**

<pre><code> 3</code></pre>

<strong>Since:</strong> 1.5.0


## radians
{: #radians}

radians(expr) - Converts degrees to radians.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT radians(180)</code></pre>

**Result value:**

<pre><code> 3.141592653589793</code></pre>


## rand
{: #rand}

rand([seed]) - Returns a random value with independent and identically distributed (i.i.d.) uniformly distributed values in [0, 1).

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT rand()</code></pre>

**Result value:**

<pre><code> 0.9629742951434543</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT rand(0)</code></pre>

**Result value:**

<pre><code> 0.8446490682263027</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT rand(null)</code></pre>

**Result value:**

<pre><code> 0.8446490682263027</code></pre>


## randn
{: #randn}

randn([seed]) - Returns a random value with independent and identically distributed (i.i.d.) values drawn from the standard normal distribution.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT randn()</code></pre>

**Result value:**

<pre><code> -0.3254147983080288</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT randn(0)</code></pre>

**Result value:**

<pre><code> 1.1164209726833079</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT randn(null)</code></pre>

**Result value:**

<pre><code> 1.1164209726833079</code></pre>


## rank
{: #rank}

rank() - Computes the rank of a value in a group of values. The result is one plus the number
of rows preceding or equal to the current row in the ordering of the partition. The values
 produce gaps in the sequence.


## regexp_extract
{: #regexp_extract}

regexp_extract(str, regexp[, idx]) - Extracts a group that matches <code>regexp</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT regexp_extract('100-200', '(\\d+)-(\\d+)', 1)</code></pre>

**Result value:**

<pre><code> 100</code></pre>


## regexp_replace
{: #regexp_replace}

regexp_replace(str, regexp, rep) - Replaces all substrings of <code>str</code> that match <code>regexp</code> with <code>rep</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT regexp_replace('100-200', '(\\d+)', 'num')</code></pre>

**Result value:**

<pre><code> num-num</code></pre>


## repeat
{: #repeat}

repeat(str, n) - Returns the string that repeats the indicated string value n times.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT repeat('123', 2)</code></pre>

**Result value:**

<pre><code> 123123</code></pre>


## replace
{: #replace}

replace(str, search[, replace]) - Replaces all occurrences of <code>search</code> with <code>replace</code>.

**Arguments:**

<ul>
<li>str - A string expression.</li>
<li>search - A string expression. If <code>search</code> is not found in <code>str</code>, <code>str</code> is returned unchanged.</li>
<li>replace - A string expression. If <code>replace</code> is not specified or is an empty string, nothing replaces
    the string that is removed from <code>str</code>.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT replace('ABCabc', 'abc', 'DEF')</code></pre>

**Result value:**

<pre><code> ABCDEF</code></pre>


## reverse
{: #reverse}

reverse(str) - Returns the reversed indicated string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT reverse('Spark SQL')</code></pre>

**Result value:**

<pre><code> LQS krapS</code></pre>


## right
{: #right}

right(str, len) - Returns the rightmost <code>len</code>(<code>len</code> can be string type) characters from the string <code>str</code>, if <code>len</code> is less or equal than 0 the result is an empty string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT right('Spark SQL', 3)</code></pre>

**Result value:**

<pre><code> SQL</code></pre>


## rint
{: #rint}

rint(expr) - Returns the double value that is closest in value to the argument and is equal to a mathematical integer.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT rint(12.3456)</code></pre>

**Result value:**

<pre><code> 12.0</code></pre>


## rlike
{: #rlike}

str rlike regexp - Returns true if <code>str</code> matches <code>regexp</code>, or false otherwise.

**Arguments:**

<ul>
<li>str - A string expression.</li>
</ul>

regexp - A string expression. The pattern string is a Java™ regular expression.

String literals (including regex patterns) are unescaped in our SQL
parser. For example, to match "\abc", a regular expression for <code>regexp</code> can be
"^\abc$".

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT '%SystemDrive%\Users\John' rlike '%SystemDrive%\\Users.*'</code></pre>

**Result value:**

<pre><code>true</code></pre>

<strong>Note:</strong>

Use LIKE to match with simple string pattern.


## rollup
{: #rollup}


## round
{: #round}

round(expr, d) - Returns <code>expr</code> rounded to <code>d</code> decimal places by using HALF_UP rounding mode.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT round(2.5, 0)</code></pre>

**Result value:**

<pre><code> 3.0</code></pre>


## row_number
{: #row_number}

row_number() - Assigns a unique, sequential number to each row, starting with one,
according to the ordering of rows within the window partition.


## rpad
{: #rpad}

rpad(str, len, pad) - Returns <code>str</code>, right-padded with <code>pad</code> to a length of <code>len</code>.
If <code>str</code> is longer than <code>len</code>, the return value is shortened to <code>len</code> characters.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT rpad('hi', 5, '??')</code></pre>

**Result value:**

<pre><code> hi???</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT rpad('hi', 1, '??')</code></pre>

**Result value:**

<pre><code> h</code></pre>


## rtrim
{: #rtrim}

rtrim(str) - Removes the trailing space characters from <code>str</code>.


rtrim(trimStr, str) - Removes the trailing string that contains the characters from the trim string from the <code>str</code>.

**Arguments:**

<ul>
<li>str - A string expression.</li>
<li>trimStr - The trim string characters to trim, the default value is a single space</li>.
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT rtrim('    SparkSQL   ')</code></pre>

**Result value:**

<pre><code> SparkSQL</code></pre>

**Example of an SQL function usage fragment:**
<pre><code>&gt; SELECT rtrim('LQSa', 'SSparkSQLS')</code></pre>

**Result value:**

<pre><code> SSpark</code></pre>


## second
{: #second}

second(timestamp) - Returns the second component of the string/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT second('2009-07-30 12:58:59')</code></pre>

**Result value:**

<pre><code> 59</code></pre>

<strong>Since:</strong> 1.5.0


## sentences
{: #sentences}

sentences(str[, lang, country]) - Splits <code>str</code> into an array of words.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sentences('Hi there! Good morning.')</code></pre>

**Result value:**

<pre><code> [[&quot;Hi&quot;,&quot;there&quot;],[&quot;Good&quot;,&quot;morning&quot;]]</code></pre>


## sha
{: #sha}

sha(expr) - Returns a sha1 hash value as a hex string of the <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sha('Spark')</code></pre>

**Result value:**

<pre><code> 85f5955f4b27a9a4c2aab6ffe5d7189fc298b92c</code></pre>


## sha1
{: #sha1}

sha1(expr) - Returns a sha1 hash value as a hex string of the <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sha1('Spark')</code></pre>

**Result value:**

<pre><code> 85f5955f4b27a9a4c2aab6ffe5d7189fc298b92c</code></pre>


## sha2
{: #sha2}

sha2(expr, bitLength) - Returns a checksum of SHA-2 family as a hex string of <code>expr</code>.
SHA-224, SHA-256, SHA-384, and SHA-512 are supported. Bit length of 0 is equivalent to 256.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sha2('Spark', 256)</code></pre>

**Result value:**

<pre><code> 529bc3b07127ecb7e53a4dcf1991d9152c24537d919178022b2c42657f79a26b</code></pre>


## shiftleft
{: #shiftleft}

shiftleft(base, expr) - Bitwise left shift.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT shiftleft(2, 1)</code></pre>

**Result value:**

<pre><code> 4</code></pre>


<h3 id="shiftright">shiftright</h3>

shiftright(base, expr) - Bitwise (signed) right shift.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT shiftright(4, 1)</code></pre>

**Result value:**

<pre><code> 2</code></pre>


## shiftrightunsigned
{: #shiftrightunsigned}

shiftrightunsigned(base, expr) - Bitwise unsigned right shift.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT shiftrightunsigned(4, 1)</code></pre>

**Result value:**

<pre><code> 2</code></pre>


## sign
{: #sign}

sign(expr) - Returns -1.0, 0.0 or 1.0 as <code>expr</code> is negative, 0 or positive.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sign(40)</code></pre>

**Result value:**

<pre><code> 1.0</code></pre>


## signum
{: #signum}

signum(expr) - Returns -1.0, 0.0 or 1.0 as <code>expr</code> is negative, 0 or positive.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT signum(40)</code></pre>

**Result value:**

<pre><code> 1.0</code></pre>


## sin
{: #sin}

sin(expr) - Returns the sine of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sin(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


<h3 id="sinh">sinh</h3>

sinh(expr) - Returns the hyperbolic sine of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sinh(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## size
{: #size}

size(expr) - Returns the size of an array or a map. Returns -1 if null.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT size(array('b', 'd', 'c', 'a'))</code></pre>

**Result value:**

<pre><code> 4</code></pre>


## skewness
{: #skewness}

skewness(expr) - Returns the skewness value that is calculated from values of a group.


## smallint
{: #smallint}

smallint(expr) - Casts the value <code>expr</code> to the target data type <code>smallint</code>.


## sort_array
{: #sort_array}

sort_array(array[, ascendingOrder]) - Sorts the input array in ascending or descending order according to the natural ordering of the array elements.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sort_array(array('b', 'd', 'c', 'a'), true)</code></pre>

**Result value:**

<pre><code> [&quot;a&quot;,&quot;b&quot;,&quot;c&quot;,&quot;d&quot;]</code></pre>


## soundex
{: #soundex}

soundex(str) - Returns Soundex code of the string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT soundex('Miller')</code></pre>

**Result value:**

<pre><code> M460</code></pre>


## space
{: #space}

space(n) - Returns a string that consists of <code>n</code> spaces.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT concat(space(2), '1')</code></pre>

**Result value:**

<pre><code> 1</code></pre>


## spark_partition_id
{: #spark_partition_id}

spark_partition_id() - Returns the current partition ID.


## split
{: #split}

split(str, regex) - Splits <code>str</code> around occurrences that match <code>regex</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT split('oneAtwoBthreeC', '[ABC]')</code></pre>

**Result value:**

<pre><code> [&quot;one&quot;,&quot;two&quot;,&quot;three&quot;,&quot;&quot;]</code></pre>


## sqrt
{: #sqrt}

sqrt(expr) - Returns the square root of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT sqrt(4)</code></pre>

**Result value:**

<pre><code> 2.0</code></pre>


## stack
{: #stack}

stack(n, expr1, ..., exprk) - Separates <code>expr1</code>, ..., <code>exprk</code> into <code>n</code> rows.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT stack(2, 1, 2, 3)</code></pre>

**Result value:**

<pre><code> 1  2
 3  NULL
</code></pre>


## std
{: #std}

std(expr) - Returns the sample standard deviation that is calculated from values of a group.


## stddev
{: #stddev}

stddev(expr) - Returns the sample standard deviation that is calculated from values of a group.


## stddev_pop
{: #stddev_pop}

stddev_pop(expr) - Returns the population standard deviation that is calculated from values of a group.


## stddev_samp
{: #stddev_samp}

stddev_samp(expr) - Returns the sample standard deviation that is calculated from values of a group.


## str_to_map
{: #str_to_map}

str_to_map(text[, pairDelim[, keyValueDelim]]) - Creates a map after splitting the text into key/value pairs by using delimiters. Default delimiters are ',' for <code>pairDelim</code> and ':' for <code>keyValueDelim</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT str_to_map('a:1,b:2,c:3', ',', ':')</code></pre>

**Result value:**

<pre><code> map(&quot;a&quot;:&quot;1&quot;,&quot;b&quot;:&quot;2&quot;,&quot;c&quot;:&quot;3&quot;)</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT str_to_map('a')</code></pre>

**Result value:**

<pre><code> map(&quot;a&quot;:null)</code></pre>


## string
{: #string}

string(expr) - Casts the value <code>expr</code> to the target data type <code>string</code>.


## struct
{: #struct}

struct(col1, col2, col3, ...) - Creates a struct with the indicated field values.


## substr
{: #substr}

substr(str, pos[, len]) - Returns the substring of <code>str</code> that starts at <code>pos</code> and is of length <code>len</code>, or the slice of byte array that starts at <code>pos</code> and is of length <code>len</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT substr('Spark SQL', 5)</code></pre>

**Result value:**

<pre><code> k SQL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT substr('Spark SQL', -3)</code></pre>

**Result value:**

<pre><code> SQL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT substr('Spark SQL', 5, 1)</code></pre>

**Result value:**

<pre><code> k</code></pre>


## substring
{: #substring}

substring(str, pos[, len]) - Returns the substring of <code>str</code> that starts at <code>pos</code> and is of length <code>len</code>, or the slice of byte array that starts at <code>pos</code> and is of length <code>len</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT substring('Spark SQL', 5)</code></pre>

**Result value:**

<pre><code> k SQL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT substring('Spark SQL', -3)</code></pre>

**Result value:**

<pre><code> SQL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT substring('Spark SQL', 5, 1)</code></pre>

**Result value:**

<pre><code> k</code></pre>


## substring_index
{: #substring_index}

substring_index(str, delim, count) - Returns the substring from <code>str</code> before <code>count</code> occurrences of the delimiter <code>delim</code>.
If <code>count</code> is positive, everything to the left of the final delimiter (counting from the
left) is returned. If <code>count</code> is negative, everything to the right of the final delimiter
(counting from the right) is returned. The function substring_index performs a case-sensitive match
when you search for <code>delim</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT substring_index('www.apache.org', '.', 2)</code></pre>

**Result value:**

<pre><code> www.apache</code></pre>


## sum
{: #sum}

sum(expr) - Returns the sum that is calculated from values of a group.


## tan
{: #tan}

tan(expr) - Returns the tangent of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT tan(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## tanh
{: #tanh}

tanh(expr) - Returns the hyperbolic tangent of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT tanh(0)</code></pre>

**Result value:**

<pre><code> 0.0</code></pre>


## timestamp
{: #timestamp}

timestamp(expr) - Casts the value <code>expr</code> to the target data type <code>timestamp</code>.


## tinyint
{: #tinyint}

tinyint(expr) - Casts the value <code>expr</code> to the target data type <code>tinyint</code>.


## to_date
{: #to_date}

to_date(date_str[, fmt]) - Parses the <code>date_str</code> expression with the <code>fmt</code> expression to
a date. Returns null with invalid input. By default, it follows casting rules to a date if
the <code>fmt</code> is omitted.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2009-07-30 04:17:52')</code></pre>

**Result value:**

<pre><code> 2009-07-30</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_date('2016-12-31', 'yyyy-MM-dd')</code></pre>

**Result value:**

<pre><code> 2016-12-31</code></pre>

<strong>Since:</strong> 1.5.0


## to_json
{: #to_json}

to_json(expr[, options]) - Returns a JSON string with a indicated struct value.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_json(named_struct('a', 1, 'b', 2))</code></pre>

**Result value:**

<pre><code> {&quot;a&quot;:1,&quot;b&quot;:2}</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_json(named_struct('time', to_timestamp('2015-08-26', 'yyyy-MM-dd')), map('timestampFormat', 'dd/MM/yyyy'))</code></pre>

**Result value:**

<pre><code> {&quot;time&quot;:&quot;26/08/2015&quot;}</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_json(array(named_struct('a', 1, 'b', 2))</code></pre>

**Result value:**

<pre><code> [{&quot;a&quot;:1,&quot;b&quot;:2}]</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_json(map('a', named_struct('b', 1)))</code></pre>

**Result value:**

<pre><code> {&quot;a&quot;:{&quot;b&quot;:1}}</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_json(map(named_struct('a', 1),named_struct('b', 2)))</code></pre>

**Result value:**

<pre><code> {&quot;[1]&quot;:{&quot;b&quot;:2}}</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_json(map('a', 1))</code></pre>

**Result value:**

<pre><code> {&quot;a&quot;:1}</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_json(array((map('a', 1))))</code></pre>

**Result value:**

<pre><code> [{&quot;a&quot;:1}]</code></pre>

<strong>Since:</strong> 2.2.0


## to_timestamp
{: #to_timestamp}

to_timestamp(timestamp[, fmt]) - Parses the <code>timestamp</code> expression with the <code>fmt</code> expression to
a timestamp. Returns null with invalid input. By default, it follows casting rules to
a timestamp if the <code>fmt</code> is omitted.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_timestamp('2016-12-31 00:12:00')</code></pre>

**Result value:**

<pre><code> 2016-12-31 00:12:00</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_timestamp('2016-12-31', 'yyyy-MM-dd')</code></pre>

**Result value:**

<pre><code> 2016-12-31 00:00:00</code></pre>

<strong>Since:</strong> 2.2.0


## to_unix_timestamp
{: #to_unix_timestamp}

to_unix_timestamp(expr[, pattern]) - Returns the UNIX timestamp of the indicated time.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_unix_timestamp('2016-04-08', 'yyyy-MM-dd')</code></pre>

**Result value:**

<pre><code> 1460041200</code></pre>

<strong>Since:</strong> 1.6.0


## to_utc_timestamp
{: #to_utc_timestamp}

to_utc_timestamp(timestamp, timezone) - Given a timestamp, such as '2017-07-14 02:40:00.0', this function interprets it as a time in the indicated time zone, and renders that time as a timestamp in UTC. For example, 'GMT+1' would yield '2017-07-14 01:40:00.0'.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT to_utc_timestamp('2016-08-31', 'Asia/Seoul')</code></pre>

**Result value:**

<pre><code> 2016-08-30 15:00:00</code></pre>

<strong>Since:</strong> 1.5.0


## translate
{: #translate}

translate(input, from, to) - Converts the <code>input</code> string by replacing the characters present in the <code>from</code> string with the corresponding characters in the <code>to</code> string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT translate('AaBbCc', 'abc', '123')</code></pre>

**Result value:**

<pre><code> A1B2C3</code></pre>


## trim
{: #trim}

trim(str) - Removes the leading and trailing space characters from <code>str</code>.

trim(BOTH trimStr FROM str) - Removes the leading and trailing <code>trimStr</code> characters from <code>str</code>.

trim(LEADING trimStr FROM str) - Removes the leading <code>trimStr</code> characters from <code>str</code>.

trim(TRAILING trimStr FROM str) - Removes the trailing <code>trimStr</code> characters from <code>str</code>.

**Arguments:**

<ul>
<li>str - A string expression</li>.
<li>trimStr - The trim string characters to trim, the default value is a single space.</li>
<li>BOTH, FROM - Keywords to specify trimming string characters from both ends of
    the string.</li>
<li>LEADING, FROM - Keywords to specify trimming string characters from the left
    end of the string.</li>
<li>TRAILING, FROM - Keywords to specify trimming string characters from the right
    end of the string.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT trim('    SparkSQL   ')</code></pre>

**Result value:**

<pre><code> SparkSQL</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT trim('SL', 'SSparkSQLS')</code></pre>

**Result value:**

<pre><code> parkSQ</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT trim(BOTH 'SL' FROM 'SSparkSQLS')</code></pre>

**Result value:**

<pre><code> parkSQ</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT trim(LEADING 'SL' FROM 'SSparkSQLS')</code></pre>

**Result value:**

<pre><code> parkSQLS</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT trim(TRAILING 'SL' FROM 'SSparkSQLS')</code></pre>

**Result value:**

<pre><code> SSparkSQ</code></pre>



## trunc
{: #trunc}

trunc(date, fmt) - Returns <code>date</code> with the time portion of the day truncated to the unit specified by the format model <code>fmt</code>.
<code>fmt</code> is one of ["year", "yyyy", "yy", "mon", "month", "mm"].

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT trunc('2009-02-12', 'MM')</code></pre>

**Result value:**

<pre><code> 2009-02-01</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT trunc('2015-10-27', 'YEAR')</code></pre>

**Result value:**

<pre><code> 2015-01-01</code></pre>

<strong>Since:</strong> 1.5.0


## ucase
{: #ucase}

ucase(str) - Returns <code>str</code> with all characters that are changed to uppercase.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ucase('SparkSql')</code></pre>

**Result value:**

<pre><code> SPARKSQL</code></pre>



## unbase64
{: #unbase64}

unbase64(str) - Converts the argument from a base 64 string <code>str</code> to a binary.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT unbase64('U3BhcmsgU1FM')</code></pre>

**Result value:**

<pre><code> Spark SQL</code></pre>


## unhex
{: #unhex}

unhex(expr) - Converts hexadecimal <code>expr</code> to binary.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT decode(unhex('537061726B2053514C'), 'UTF-8')</code></pre>

**Result value:**

<pre><code> Spark SQL</code></pre>


## unix_timestamp
{: #unix_timestamp}

unix_timestamp([expr[, pattern]]) - Returns the UNIX timestamp of current or specified time.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT unix_timestamp()</code></pre>

**Result value:**

<pre><code> 1476884637</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT unix_timestamp('2016-04-08', 'yyyy-MM-dd')</code></pre>

**Result value:**

<pre><code> 1460041200</code></pre>

<strong>Since:</strong> 1.5.0


## upper
{: #upper}

upper(str) - Returns <code>str</code> with all characters that are changed to uppercase.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT upper('SparkSql')</code></pre>

**Result value:**

<pre><code> SPARKSQL</code></pre>


## uuid
{: #uuid}

uuid() - Returns a universally unique identifier (UUID) string. The value is returned as a canonical UUID 36-character string.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT uuid()</code></pre>

**Result value:**

<pre><code> 46707d92-02f4-4817-8116-a4c3b23e6266</code></pre>


## var_pop
{: #var_pop}

var_pop(expr) - Returns the population variance that is calculated from values of a group.


## var_samp
{: #var_samp}

var_samp(expr) - Returns the sample variance that is calculated from values of a group.


## variance
{: #variance}

variance(expr) - Returns the sample variance that is calculated from values of a group.


## weekofyear
{: #weekofyear}

weekofyear(date) - Returns the week of the year of the indicated date. A week is considered to start on a Monday and week 1 is the first week with &gt;3 days.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT weekofyear('2008-02-20')</code></pre>

**Result value:**

<pre><code> 8</code></pre>

<strong>Since:</strong> 1.5.0


when

CASE WHEN expr1 THEN expr2 [WHEN expr3 THEN expr4]* [ELSE expr5] END - When <code>expr1</code> = true, returns <code>expr2</code>; else when <code>expr3</code> = true, returns <code>expr4</code>; else returns <code>expr5</code>.

**Arguments:**

<ul>
<li>expr1, expr3 - the branch condition expressions must all be Boolean type.</li>
<li>expr2, expr4, expr5 - the branch value expressions and else value expression must all be
    same type or coercible to a common type.</li>
</ul>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CASE WHEN 1 &gt; 0 THEN 1 WHEN 2 &gt; 0 THEN 2.0 ELSE 1.2 END;</code></pre>

**Result value:**

<pre><code> 1</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CASE WHEN 1 &lt; 0 THEN 1 WHEN 2 &gt; 0 THEN 2.0 ELSE 1.2 END;</code></pre>

**Result value:**

<pre><code> 2</code></pre>

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT CASE WHEN 1 &lt; 0 THEN 1 WHEN 2 &lt; 0 THEN 2.0 END;</code></pre>

**Result value:**

<pre><code> NULL</code></pre>

## window
{: #window}

## xpath
{: #xpath}

xpath(xml, xpath) - Returns a string array of values within the nodes of xml that match the XPath expression.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath('&lt;a&gt;&lt;b&gt;b1&lt;/b&gt;&lt;b&gt;b2&lt;/b&gt;&lt;b&gt;b3&lt;/b&gt;&lt;c&gt;c1&lt;/c&gt;&lt;c&gt;c2&lt;/c&gt;&lt;/a&gt;','a/b/text()')</code></pre>

**Result value:**

<pre><code> ['b1','b2','b3']</code></pre>


## xpath_boolean
{: #xpath_boolean}

xpath_boolean(xml, xpath) - Returns true if the XPath expression evaluates to true, or if a matching node is found.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_boolean('&lt;a&gt;&lt;b&gt;1&lt;/b&gt;&lt;/a&gt;','a/b')</code></pre>

**Result value:**

<pre><code> true</code></pre>


## xpath_double
{: #xpath_double}

xpath_double(xml, xpath) - Returns a double value, the value zero if no match is found, or NaN if a match is found but the value is non-numeric.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_double('&lt;a&gt;&lt;b&gt;1&lt;/b&gt;&lt;b&gt;2&lt;/b&gt;&lt;/a&gt;', 'sum(a/b)')</code></pre>

**Result value:**

<pre><code> 3.0</code></pre>

## xpath_float
{: #xpath_float}

xpath_float(xml, xpath) - Returns a float value, the value zero if no match is found, or NaN if a match is found but the value is non-numeric.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_float('&lt;a&gt;&lt;b&gt;1&lt;/b&gt;&lt;b&gt;2&lt;/b&gt;&lt;/a&gt;', 'sum(a/b)')</code></pre>

**Result value:**

<pre><code> 3.0</code></pre>

## xpath_int
{: #xpath_int}

xpath_int(xml, xpath) - Returns an integer value, or the value zero if no match is found, or a match is found but the value is non-numeric.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_int('&lt;a&gt;&lt;b&gt;1&lt;/b&gt;&lt;b&gt;2&lt;/b&gt;&lt;/a&gt;', 'sum(a/b)')</code></pre>

**Result value:**

<pre><code> 3</code></pre>

## xpath_long
{: #xpath_long}

xpath_long(xml, xpath) - Returns a long integer value, or the value zero if no match is found, or a match is found but the value is non-numeric.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_long('&lt;a&gt;&lt;b&gt;1&lt;/b&gt;&lt;b&gt;2&lt;/b&gt;&lt;/a&gt;', 'sum(a/b)')</code></pre>

**Result value:**

<pre><code> 3</code></pre>

## xpath_number
{: #xpath_number}

xpath_number(xml, xpath) - Returns a double value, the value zero if no match is found, or NaN if a match is found but the value is non-numeric.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_number('&lt;a&gt;&lt;b&gt;1&lt;/b&gt;&lt;b&gt;2&lt;/b&gt;&lt;/a&gt;', 'sum(a/b)')</code></pre>

**Result value:**

<pre><code> 3.0</code></pre>


## xpath_short
{: #xpath_short}

xpath_short(xml, xpath) - Returns a short integer value, or the value zero if no match is found, or a match is found but the value is non-numeric.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_short('&lt;a&gt;&lt;b&gt;1&lt;/b&gt;&lt;b&gt;2&lt;/b&gt;&lt;/a&gt;', 'sum(a/b)')</code></pre>

**Result value:**

<pre><code> 3</code></pre>


## xpath_string
{: #xpath_string}

xpath_string(xml, xpath) - Returns the text contents of the first xml node that matches the XPath expression.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT xpath_string('&lt;a&gt;&lt;b&gt;b&lt;/b&gt;&lt;c&gt;cc&lt;/c&gt;&lt;/a&gt;','a/c')</code></pre>

**Result value:**

<pre><code> cc</code></pre>


## year
{: #year}

year(date) - Returns the year component of the date/timestamp.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT year('2016-07-30')</code></pre>

**Result value:**

<pre><code> 2016</code></pre>

<strong>Since:</strong> 1.5.0


## |
{: #|}

expr1 | expr2 - Returns the result of bitwise OR of <code>expr1</code> and <code>expr2</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT 3 | 5;</code></pre>

**Result value:**

<pre><code> 7</code></pre>


## ~
{: #~}

~ expr - Returns the result of bitwise NOT of <code>expr</code>.

**Example of an SQL function usage fragment:**

<pre><code>&gt; SELECT ~ 0;</code></pre>

**Result value:**

<pre><code> -1</code></pre>
