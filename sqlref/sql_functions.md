---

copyright:
  years: 2018, 2022
lastupdated: "2022-11-28"

keywords: SQL, functions

subcollection: sql-query

---

{{site.data.keyword.attribute-definition-list}}

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

:   **Example of an SQL function usage fragment** 

    ```sql
    > SELECT 2 % 1.8
    ```

:   **Result value**

    ```sql
    0.2
    ```

:   **Example of an SQL function usage fragment**

    ```sql
    > SELECT MOD(2, 1.8)
    ```

:   **Result value**

    ```sql
    0.2
    ```

## &
{: #&}

expr1 & expr2
:   Returns the result of bitwise AND of `expr1` and `expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 3 & 5
   ```

:   **Result value**

   ```sql
   1
   ```

## *
{: #*}

expr1 * expr2
:   Returns `expr1`*`expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 * 3
   ```

:   **Result value**

   ```sql
   6
   ```

## +
{: #+}

expr1 + expr2
:   Returns `expr1`+`expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 + 2
   ```

:   **Result value**

   ```sql
   3
   ```

## -
{: #-}

expr1 - expr2
:   Returns `expr1`-`expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 - 1
   ```

:   **Result value**

   ```sql
   1
   ```

## /
{: #/}

expr1 / expr2
:   Returns `expr1`/`expr2`. It always performs floating point division.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 3 / 2```
   ```

:   **Result value**

   ```sql
   1.5
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2L / 2L
   ```

:   **Result value**

   ```sql
   1.0
   ```

## <
{: #<}

expr1 < expr2
:   Returns true if `expr1` is less than `expr2`.

:   **Arguments**

    expr1, expr2 - The two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 < 2
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1.1 < '1'
   ```

:   **Result value**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') < to_date('2009-07-30 04:17:52')
   ```

:   **Result value**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') < to_date('2009-08-01 04:17:52')
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 < NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

## <=
{: #<=}

expr1 >= expr2
:   Returns true if `expr1` is less than or equal to `expr2`.

:   **Arguments**

    expr1, expr2 - The two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 <= 2
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1.0 <= '1'
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') <= to_date('2009-07-30 04:17:52')
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') <= to_date('2009-08-01 04:17:52')
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 <= NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

## <=>
{: #<=>}

expr1 <=> expr2
:   Returns same result as the EQUAL(=) operator for nonnull operands,
but returns true if both are null, false if one of the them is null.

:   **Arguments**

    expr1, expr2 - The two expressions must be same type or can be cast to a common type,
    and must be a type that can be used in equality comparison. Map type is not supported.
    For complex types such array and struct, the data types of fields must be orderable.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 <=>; 2
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 <=> '1'
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT true <=> NULL
   ```

:   **Result value**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT NULL <=> NULL
   ```

:   **Result value**

   ```sql
   true
   ```

## =
{: #=}

expr1 = expr2
:   Returns true if `expr1` equals `expr2`, or false otherwise.

:   **Arguments**

    expr1, expr2 - The two expressions must be same type or can be cast to a common type,
    and must be a type that can be used in equality comparison. Map type is not supported.
    For complex types such array and struct, the data types of fields must be orderable.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 = 2
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 = '1'
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT true = NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT NULL = NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

## ==
{: #==}

expr1 == expr2
:   Returns true if `expr1` equals `expr2`, or false otherwise.

:   **Arguments**

    expr1, expr2 - The two expressions must be same type or can be cast to a common type,
    and must be a type that can be used in equality comparison. Map type is not supported.
    For complex types such array and struct, the data types of fields must be orderable.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 == 2
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 == '1'
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT true == NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT NULL == NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

## >
{: #>}

expr1 > expr2
:   Returns true if `expr1` is greater than `expr2`.

:   **Arguments**

    expr1, expr2 - the two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 > 1
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 > '1.1'
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') > to_date('2009-07-30 04:17:52')
   ```

:   **Result value**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') > to_date('2009-08-01 04:17:52')
   ```

:   **Result value**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 > NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

## >=
{: #>=}

expr1 >= expr2
:   Returns true if `expr1` is greater than or equal to `expr2`.

:   **Arguments**

    expr1, expr2the two expressions must be same type or can be cast to a common type,
    and must be a type that can be ordered. For example, map type is not orderable, so it
    is not supported. For complex types such array and struct, the data types of fields must
    be orderable.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 >= 1
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2.0 >= '2.1'
   ```

:   **Result value**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') >= to_date('2009-07-30 04:17:52')
   ```

:   **Result value**

   ```sql
   true
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52') >= to_date('2009-08-01 04:17:52')
   ```

:   **Result value**

   ```sql
   false
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 >= NULL
   ```

:   **Result value**

   ```sql
   NULL
   ```

## ^
{: #^}

expr1 ^ expr2
:   Returns the result of bitwise exclusive OR of `expr1` and `expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 3 ^ 5
   ```

:   **Result value**

   ```sql
   2
   ```

## abs
{: #abs}

abs(expr)
:   Returns the absolute value of the numeric value.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT abs(-1)
   ```

:   **Result value**

   ```sql
   1
   ```

## acos
{: #acos}

acos(expr)
:   Returns the inverse cosine (also known as arccosine) of `expr` if -1<;=`expr`<=1 or NaN otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT acos(1)
   ```

:   **Result value**

   ```sql
   0.0
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT acos(2)
   ```

:   **Result value**

   ```sql
   NaN
   ```

## add_months
{: #add_months}

add_months(start_date, num_months)
:   Returns the date that is `num_months` after `start_date`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT add_months('2016-08-31', 1)
   ```

:   **Result value**

   ```sql
   2016-09-30
   ```

## and
{: #and}

expr1 and expr2
:   Logical AND.

## approx_count_distinct
{: #approx_count_distinct}

approx_count_distinct(expr[, relativeSD])
:   Returns the estimated cardinality by HyperLogLog++. `relativeSD` defines the maximum estimation error allowed.


## approx_percentile
{: #approx_percentile}

approx_percentile(col, percentage [, accuracy])
:   Returns the approximate percentile value of numeric column `col` at the indicated percentage. The value of percentage must be between 0.0
and 1.0. The `accuracy` parameter (default: 10000) is a positive numeric literal that controls approximation accuracy at the cost of memory. Higher value of `accuracy` yields better accuracy, `1.0/accuracy` is the relative error of the approximation.
When `percentage` is an array, each value of the percentage array must be between 0.0 and 1.0.
In this case, returns the approximate percentile array of column `col` at the indicated percentage array.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT approx_percentile(10.0, array(0.5, 0.4, 0.1), 100)
   ```

:   **Result value**

   ```sql
   [10.0,10.0,10.0]
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT approx_percentile(10.0, 0.5, 100)
   ```

:   **Result value**

   ```sql
   10.0
   ```

## array
{: #array}

array(expr, ...)
:   Returns an array with the indicated elements.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT array(1, 2, 3)
   ```

:   **Result value**

   ```sql
   [1,2,3]
   ```

## array_contains
{: #array_contains}

array_contains(array, value)
:   Returns true if the array contains the value.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT array_contains(array(1, 2, 3), 2)
   ```

:   **Result value**

   ```sql
   true
   ```

## ascii
{: #ascii}

ascii(str)
:   Returns the numeric value of the first character of `str`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ascii('222')
   ```

:   **Result value**

   ```sql
   50
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ascii(2)
   ```

:   **Result value**

   ```sql 
   50
   ```

## asin
{: #asin}

asin(expr)
:   Returns the inverse sine (also known as arcsine) the arc sin of `expr` if -1<=`expr`<=1 or NaN otherwise.

:   **Example of an SQL function usage fragment**

    ```sql
    > SELECT asin(0)
    ```

:   **Result value**

    ```sql
    0.0
    ```

:   **Example of an SQL function usage fragment**

   > SELECT asin(2)

:   **Result value**

 NaN


## assert_true
{: #assert_true}

assert_true(expr1 [, expr2])
: Returns null if column `expr1` is true; throws an exception with the provided error message `expr2` otherwise.
Useful to check if a `cast` for a column is successful for every row.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ifnull(assert_true(cast(col as int) is not null), cast(col as int)) as col_int from mytable
   ```

:   **Alternatively, using it in the WHERE clause**

   ```sql
   SELECT cast(col as int) as col_int
   FROM mytable
   WHERE assert_true(cast(col as int) is not null) is null
   ```

:   **Result value when expr1 is false**

   ```text
   SQL execution failed
   An assert_true function failed: ''NOT (cast(col#14393 as int) = cast(null as int))' is not true!'. Check your data to see which rows don't pass the function's condition and fix the issue.
   ```

:   **Example with a custom error message**

   ```sql
   > SELECT ifnull(assert_true(cast(col as int) is not null, "col must be a valid integer and not null!"), cast(col as int)) as col_int from mytable
   ```

:   **Result value when expr1 is false**

   ```text
   SQL execution failed
   An assert_true function failed: 'col must be a valid integer and not null!'. Check your data to see which rows don't pass the function's condition and fix the issue.
   ```


## atan
{: #atan}

atan(expr)
:   Returns the inverse tangent (also known as arctangent).

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT atan(0)
   ```

:   **Result value**

   ```sql
    0.0
    ```

## atan2
{: #atan2}

atan2(expr1, expr2)
:   Returns the angle in radians between the positive x-axis of a plane and the point that is indicated by the coordinates (`expr1`, `expr2`).

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT atan2(0, 0)
   ```

:   **Result value**

   ```sql
    0.0
    ```

## avg
{: #avg}

avg(expr)
:   Returns the mean that is calculated from values of a group.

## base64
{: #base64}

base64(bin)
:   Converts the argument from a binary `bin` to a base 64 string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT base64('Spark SQL')
   ```

:   **Result value**

   ```sql
    U3BhcmsgU1FM
    ```

## bigint
{: #bigint}

bigint(expr)
:   Casts the value `expr` to the target data type `bigint`.

## bin
{: #bin}

bin(expr)
:   Returns the string representation of the long value `expr` represented in binary.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT bin(13)
   ```

:   **Result value**

   ```sql
    1101
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT bin(-13)
   ```

:   **Result value**

   ```sql
    1111111111111111111111111111111111111111111111111111111111110011
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT bin(13.3)
   ```

:   **Result value**

   ```sql
    1101
    ```

## binary
{: #binary}

binary(expr)
:   Casts the value `expr` to the target data type `binary`.

## bit_length
{: #bit_length}

bit_length(expr)
:   Returns the bit length of string data or number of bits of binary data.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT bit_length('Spark SQL')
   ```

:   **Result value**

   ```sql
    72
    ```

## boolean
{: #boolean}

boolean(expr)
:   Casts the value `expr` to the target data type `boolean`.

## bround
{: #bround}

bround(expr, d):   Returns `expr` rounded to `d` decimal places by using HALF_EVEN rounding mode.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT bround(2.5, 0)
   ```

:   **Result value**

   ```sql 
   2.0
   ```


## cast
{: #cast}

cast(expr AS type)
:   Casts the value `expr` to the target data type `type`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT cast('10' as int)
   ```

:   **Result value**

   ```sql
    10
    ```

## cbrt
{: #cbrt}

cbrt(expr)
:   Returns the cube root of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT cbrt(27.0)
   ```

:   **Result value**

   ```sql
    3.0
    ```

## ceil
{: #ceil}

ceil(expr)
:   Returns the smallest integer not smaller than `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ceil(-0.1)
   ```

:   **Result value**

   ```sql
    0
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ceil(5)
   ```

:   **Result value**

   ```sql
    5
    ```

## ceiling
{: #ceiling}

ceiling(expr)
:   Returns the smallest integer not smaller than `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ceiling(-0.1)
   ```

:   **Result value**

   ```sql
    0
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ceiling(5)
   ```

:   **Result value**

   ```sql
    5
    ```

## char
{: #char}

char(expr)
:   Returns the ASCII character that has the binary equivalent to `expr`. If n is larger than 256, the result is equivalent to chr(n % 256).

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT char(65)
   ```

:   **Result value**

   ```sql
    A
    ```

## char_length
{: #char_length}

char_length(expr)
:   Returns the character length of string data or number of bytes of binary data. The length of string data includes the trailing spaces. The length of binary data includes binary zeros.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT char_length('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CHAR_LENGTH('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CHARACTER_LENGTH('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```

## character_length
{: #character_length}

character_length(expr)
:   Returns the character length of string data or number of bytes of binary data. The length of string data includes the trailing spaces. The length of binary data includes binary zeros.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT character_length('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CHAR_LENGTH('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CHARACTER_LENGTH('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```


## chr
{: #chr}

chr(expr)
:   Returns the ASCII character that has the binary equivalent to `expr`. If n is larger than 256, the result is equivalent to chr(n % 256).

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT chr(65)
   ```

:   **Result value**

   ```sql
    A
    ```

## coalesce
{: #coalesce}

coalesce(expr1, expr2, ...)
:   Returns the first nonnull argument if exists. Otherwise, null.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT coalesce(NULL, 1, NULL)
   ```

:   **Result value**

   ```sql
    1
    ```

## collect_list
{: #collect_list}

collect_list(expr)
:   Collects and returns a list of nonunique elements.


## collect_set
{: #collect_set}

collect_set(expr)
:   Collects and returns a set of unique elements.


## concat
{: #concat}

concat(str1, str2, ..., strN)
:   Returns the concatenation of str1, str2, ..., strN.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT concat('Spark', 'SQL')
   ```

:   **Result value**

   ```sql
    SparkSQL
    ```


## concat_ws
{: #concat_ws}

concat_ws(sep, [str | array(str)]+)
:   Returns the concatenation of the strings that are separated by `sep`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT concat_ws(' ', 'Spark', 'SQL')
   ```

:   **Result value**

   ```sql
    Spark SQL
    ```


## conv
{: #conv}

conv(num, from_base, to_base)
:   Convert `num` from `from_base` to `to_base`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT conv('100', 2, 10)
   ```

:   **Result value**

   ```sql
    4
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT conv(-10, 16, -10)
   ```

:   **Result value**

   ```sql
    -16
    ```

## corr
{: #corr}

corr(expr1, expr2)
:   Returns Pearson coefficient of correlation between a set of number pairs.

## cos
{: #cos}

cos(expr)
:   Returns the cosine of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT cos(0)
   ```

:   **Result value**

   ```sql
    1.0
    ```

## cosh
{: #cosh}

cosh(expr)
:   Returns the hyperbolic cosine of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT cosh(0)
   ```

:   **Result value**

   ```sql
    1.0
    ```


## cot
{: #cot}

cot(expr)
:   Returns the cotangent of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT cot(1)
   ```

:   **Result value**

   ```sql
    0.6420926159343306
    ```


## count
{: #count}

count(*)
:   Returns the total number of retrieved rows, including rows that contain null.

count(expr)
:   Returns the number of rows for which the supplied expression is nonnull.

count(DISTINCT expr[, expr...])
:   Returns the number of rows for which the supplied expressions are unique and nonnull.

## count_min_sketch
{: #cont_min_sketch}

count_min_sketch(col, eps, confidence, seed)
:   Returns a count-min sketch of a column with the indicated esp,
confidence, and seed. The result is an array of bytes, which can be de-serialized to a
`CountMinSketch` before usage. Count-min sketch is a probabilistic data structure that is used for
cardinality estimation by using sublinear space.

## covar_pop
{: #covar_pop}

covar_pop(expr1, expr2)
:   Returns the population covariance of a set of number pairs.

## covar_samp
{: #covar_samp}

covar_samp(expr1, expr2)
:   Returns the sample covariance of a set of number pairs.

## crc32
{: #crc32}

crc32(expr)
:   Returns a cyclic redundancy check value of the `expr` as a bigint.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT crc32('Spark')
   ```

:   **Result value**

   ```sql
    1557323817
    ```

## cube
{: #cube}

## cume_dist
{: #cume_dist}

cume_dist()
:   Computes the position of a value relative to all values in the partition.

## current_database
{: #current_database}

current_database()
:   Returns the current database.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT current_database()
   ```

:   **Result value**

   ```sql
    default
    ```

## current_date
{: #current_date}

current_date()
:   Returns the current date at the start of query evaluation.


## current_timestamp
{: #current_timestamp}

current_timestamp()
:   Returns the current timestamp at the start of query evaluation.



## date
{: #date}

date(expr)
:   Casts the value `expr` to the target data type `date`.


## date_add
{: #date_add}

date_add(start_date, num_days)
:   Returns the date that is `num_days` after `start_date`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_add('2016-07-30', 1)
   ```

:   **Result value**

   ```sql
    2016-07-31
    ```



## date_format
{: #date_format}

date_format(timestamp, fmt)
:   Converts `timestamp` to a value of string in the format specified by the date format `fmt`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_format('2016-04-08', 'y')
   ```

:   **Result value**

   ```sql
    2016
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_format('2016-04-16T15:16:29.000Z', 'y-MM-dd')
   ```

:   **Result value**

   ```sql
   2016-04-16
   ```



## date_sub
{: #date_sub}

date_sub(start_date, num_days)
:   Returns the date that is `num_days` before `start_date`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_sub('2016-07-30', 1)
    ```

:   **Result value**

   ```sql
    2016-07-29
    ```



## date_trunc
{: #date_trunc}

date_trunc(fmt, ts)
:   Returns timestamp `ts` truncated to the unit specified by the format model `fmt`.
`fmt` to be one of ["YEAR", "YYYY", "YY", "MON", "MONTH", "MM", "DAY", "DD", "HOUR", "MINUTE", "SECOND", "WEEK", "QUARTER"].

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_trunc('YEAR', '2015-03-05T09:32:05.359')
   ```

:   **Result value**

   ```sql
    2015-01-01T00:00:00
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_trunc('MM', '2015-03-05T09:32:05.359')
   ```

:   **Result value**

   ```sql
    2015-03-01T00:00:00
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_trunc('DD', '2015-03-05T09:32:05.359')
   ```

:   **Result value**

   ```sql
    2015-03-05T00:00:00
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT date_trunc('HOUR', '2015-03-05T09:32:05.359')
   ```

:   **Result value**

   ```sql
    2015-03-05T09:00:00
    ```



## datediff
{: #datediff}

datediff(endDate, startDate)
:   Returns the number of days from `startDate` to `endDate`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT datediff('2009-07-31', '2009-07-30')
   ```

:   **Result value**

   ```sql
    1
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT datediff('2009-07-30', '2009-07-31')
   ```

:   **Result value**

   ```sql
    -1
    ```



## day
{: #day}

day(date)
:   Returns the day of month of the date/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT day('2009-07-30')
   ```

:   **Result value**

   ```sql 
   30
   ```



## dayofmonth
{: #dayofmonth}

dayofmonth(date)
:   Returns the day of month of the date/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT dayofmonth('2009-07-30')
   ```

:   **Result value**

   ```sql
    30
    ```



## dayofweek
{: #dayofweek}

dayofweek(date)
:   Returns the day of the week for date/timestamp (1 = Sunday, 2 = Monday, ..., 7 = Saturday).

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT dayofweek('2009-07-30')
   ```

:   **Result value**

   ```sql
    5
    ```



## dayofyear
{: #dayofyear}

dayofyear(date)
:   Returns the day of year of the date/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT dayofyear('2016-04-09')
   ```

:   **Result value**

   ```sql 
   100
   ```



## decimal
{: #decimal}

decimal(expr)
:   Casts the value `expr` to the target data type `DECIMAL(10,0)`, truncating the result if needed.
Use `CAST(expr AS DECIMAL(p,f))` to specify precision and fractional digits explicitly.


## decode
{: #decode}

decode(bin, charset)
:   Decodes the first argument by using the second argument character set.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT decode(encode('abc', 'utf-8'), 'utf-8')
   ```

:   **Result value**

   ```sql
    abc
    ```


## degrees
{: #degrees}

degrees(expr)
:   Converts radians to degrees.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT degrees(3.141592653589793)
   ```

:   **Result value**

   ```sql
    180.0
    ```


## dense_rank
{: #dense_rank}

dense_rank()
:   Computes the rank of a value in a group of values. The result is one plus the
previously assigned rank value. Unlike the function rank, dense_rank does not produce gaps
in the ranking sequence.


## double
{: #double}

double(expr)
:   Casts the value `expr` to the target data type `double`.


## e
{: #e}

e()
:   Returns Euler's number, e.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT e()
   ```

:   **Result value**

   ```sql 
   2.718281828459045
   ```


## elt
{: #elt}

elt(n, input1, input2, ...)
:   Returns the `n`-th input, for example, returns `input2` when `n` is 2.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT elt(1, 'scala', 'java')
   ```

:   **Result value**

   ```sql
    scala
    ```


## encode
{: #encode}

encode(str, charset)
:   Encodes the first argument by using the second argument character set.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT encode('abc', 'utf-8')
   ```

:   **Result value**

   ```sql
    abc
    ```


## exp
{: #exp}

exp(expr)
:   Returns e to the power of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT exp(0)
   ```

:   **Result value**

   ```sql
    1.0
    ```


## explode
{: #explode}

explode(expr)
:   Separates the elements of array `expr` into multiple rows, or the elements of map `expr` into multiple rows and columns.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT explode(array(10, 20))
   ```

:   **Result value**

   ```sql
    10  20
    ```


## explode_outer
{: #explode_outer}

explode_outer(expr)
:   Separates the elements of array `expr` into multiple rows, or the elements of map `expr` into multiple rows and columns.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT explode_outer(array(10, 20))
   ```

:   **Result value**

   ```sql
    10  20
    ```


## expm1
{: #expm1}

expm1(expr)
:   Returns exp(`expr`) - 1.

:   **Example of an SQL function usage fragment**

   ```sql 
   > SELECT expm1(0)
   ```

:   **Result value**

   ```sql
    0.0
    ```


## factorial
{: #factorial}

factorial(expr)
:   Returns the factorial of `expr`. `expr` is [0..20]. Otherwise, null.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT factorial(5)
   ```

:   **Result value**

   ```sql
    120
    ```


## find_in_set
{: #find_in_set}

find_in_set(str, str_array)
:   Returns the index (1-based) of the indicated string (`str`) in the comma-delimited list (`str_array`).
Returns 0, if the string was not found or if the indicated string (`str`) contains a comma.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT find_in_set('ab','abc,b,ab,c,def')
   ```

:   **Result value**

   ```sql
    3
    ```


## first
{: #first}

first(expr[, isIgnoreNull])
:   Returns the first value of `expr` for a group of rows.
If `isIgnoreNull` is true, returns only nonnull values.


## first_value
{: #first_value}

first_value(expr[, isIgnoreNull])
:   Returns the first value of `expr` for a group of rows.
If `isIgnoreNull` is true, returns only nonnull values.


## float
{: #float}

float(expr)
:   Casts the value `expr` to the target data type `float`.


## floor
{: #floor}

floor(expr)
:   Returns the largest integer not greater than `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT floor(-0.1)
   ```

:   **Result value**

   ```sql
    -1
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT floor(5)
   ```

:   **Result value**

   ```sql
    5
    ```


## format_number
{: #format_number}

format_number(expr1, expr2)
:   Formats the number `expr1` like '#,###,###.##', rounded to `expr2`
decimal places. If `expr2` is 0, the result has no decimal point or fractional part.
This function is supposed to work like MySQL's FORMAT.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT format_number(12332.123456, 4)
   ```

:   **Result value**

   ```sql
    12,332.1235
    ```


## format_string
{: #format_string}

format_string(strfmt, obj, ...)
:   Returns a formatted string from printf-style format strings.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT format_string("Hello World %d %s", 100, "days")
   ```

:   **Result value**

   ```sql
    Hello World 100 days
    ```


## from_json
{: #from_json}

from_json(jsonStr, schema[, options])
:   Returns a struct value with the indicated `jsonStr` and `schema`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT from_json('{"a":1, "b":0.8}', 'a INT, b DOUBLE')
   ```

:   **Result value**

   ```sql
    {"a":1, "b":0.8}
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT from_json('{"time":"26/08/2015"}', 'time Timestamp', map('timestampFormat', 'dd/MM/yyyy'))
   ```

:   **Result value**

   ```sql
    {"time":"2015-08-26 00:00:00.0"}
    ```



## from_unixtime
{: #from_unixtime}

from_unixtime(unix_time, format)
:   Returns `unix_time` in the specified `format`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT from_unixtime(0, 'yyyy-MM-dd HH:mm:ss')
   ```

:   **Result value**

   ```sql
    1970-01-01 00:00:00
    ```



## from_utc_timestamp
{: #from_utc_timestamp}

from_utc_timestamp(timestamp, timezone)
:   Given a timestamp, such as '2017-07-14 02:40:00.0', this function interprets it as a time in Coordinated Universal Time (UTC), and renders that time as a timestamp in the indicated time zone. For example, 'GMT+1' would yield '2017-07-14 03:40:00.0'.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT from_utc_timestamp('2016-08-31', 'Asia/Seoul')
   ```

:   **Result value**

   ```sql
    2016-08-31 09:00:00
    ```



## get_json_object
{: #get_json_object}

get_json_object(json_txt, path)
:   Extracts a JSON object from `path`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT get_json_object('{"a":"b"}', '$.a')
   ```

:   **Result value**

   ```sql
    b
    ```


## greatest
{: #greatest}

greatest(expr, ...)
:   Returns the greatest value of all parameters, skipping null values.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT greatest(10, 9, 2, 4, 3)
   ```

:   **Result value**

   ```sql
    10
    ```


## grouping
{: #grouping}


## grouping_id
{: #grouping_id}


## hash
{: #hash}

hash(expr1, expr2, ...)
:   Returns a hash value of the arguments.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT hash('Spark', array(123), 2)
   ```

:   **Result value**

   ```sql
    -1321691492
    ```


## hex
{: #hex}

hex(expr)
:   Converts `expr` to hexadecimal.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT hex(17)
   ```

:   **Result value**

   ```sql
    11
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT hex('Spark SQL')
   ```

:   **Result value**

   ```sql
    537061726B2053514C
    ```


## hour
{: #hour}

hour(timestamp)
:   Returns the hour component of the string/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT hour('2009-07-30 12:58:59')
   ```

:   **Result value**

   ```sql
    12
    ```



## hypot
{: #hypot}

hypot(expr1, expr2)
:   Returns sqrt(`expr1`**2 + `expr2`**2).

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT hypot(3, 4)
   ```

:   **Result value**

   ```sql
    5.0
    ```


## if
{: #if}

if(expr1, expr2, expr3)
:   If `expr1` evaluates to true, then returns `expr2`; otherwise, returns `expr3`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT if(1 < 2, 'a', 'b')
   ```

:   **Result value**

   ```sql
    a
    ```


## ifnull
{: #ifnull}

ifnull(expr1, expr2)
:   Returns `expr2` if `expr1` is null, or `expr1` otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ifnull(NULL, array('2'))
   ```

:   **Result value**

   ```sql
    ["2"]
    ```


## in
{: #in}

expr1 in(expr2, expr3, ...)
:   Returns true if `expr` equals to any valN.

:   **Arguments**

   expr1, expr2, expr3, ... - the arguments must be same type.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 in(1, 2, 3)
   ```

:   **Result value**

   ```sql
    true
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 1 in(2, 3, 4)
   ```

:   **Result value**

   ```sql
    false
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT named_struct('a', 1, 'b', 2) in(named_struct('a', 1, 'b', 1), named_struct('a', 1, 'b', 3))
   ```

:   **Result value**

   ```sql
    false
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT named_struct('a', 1, 'b', 2) in(named_struct('a', 1, 'b', 2), named_struct('a', 1, 'b', 3))
   ```

:   **Result value**

   ```sql
    true
    ```


## initcap
{: #initcap}

initcap(str)
:   Returns `str` with the first letter of each word in uppercase.
All other letters are in lowercase. Words are delimited by white space.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT initcap('sPark sql')
   ```

:   **Result value**

   ```sql
    Spark Sql
    ```


## inline
{: #inline}

inline(expr)
:   Explodes an array of structs into a table.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT inline(array(struct(1, 'a'), struct(2, 'b')))
   ```

:   **Result value**

   ```sql
    1  a   2  b
    ```


## inline_outer
{: #inline_outer}

inline_outer(expr)
:   Explodes an array of structs into a table.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT inline_outer(array(struct(1, 'a'), struct(2, 'b')))
   ```

:   **Result value**

   ```sql
    1  a   2  b
    ```


## input_file_name
{: #input_file_name}

input_file_name()
:   Returns the name of the file that is being read, or empty string if not available.


## instr
{: #instr}

instr(str, substr)
:   Returns the (1-based) index of the first occurrence of `substr` in `str`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT instr('SparkSQL', 'SQL')
   ```

:   **Result value**

   ```sql
    6
    ```


## int
{: #int}

int(expr)
:   Casts the value `expr` to the target data type `int`.


## isnan
{: #isnan}

isnan(expr)
:   Returns true if `expr` is NaN, or false otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT isnan(cast('NaN' as double))
   ```

:   **Result value**

   ```sql
    true
    ```


## isnotnull
{: #isnotnull}

isnotnull(expr)
:   Returns true if `expr` is not null, or false otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT isnotnull(1)
   ```

:   **Result value**

   ```sql
    true
    ```


## isnull
{: #isnull}

isnull(expr)
:   Returns true if `expr` is null, or false otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT isnull(1)
   ```

:   **Result value**

   ```sql
    false
    ```


## json_tuple
{: #json_tuple}

json_tuple(jsonStr, p1, p2, ..., pn)
:   Returns a tuple like the function  `get_json_object`, but it takes multiple names. All the input parameters and output column types are string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT json_tuple('{"a":1, "b":2}', 'a', 'b')
   ```

:   **Result value**

   ```sql
    1  2
    ```


## kurtosis
{: #kurtosis}

kurtosis(expr)
:   Returns the kurtosis value that is calculated from values of a group.


## lag
{: #lag}

lag(input[, offset[, default]])
:   Returns the value of `input` at the `offset`th row
before the current row in the window. The default value of `offset` is 1 and the default
value of `default` is null. If the value of `input` at the `offset`th row is null,
null is returned. If no such offset row exists (for example, when the offset is 1, the first
row of the window does not have any previous row), `default` is returned.


## last
{: #last}

last(expr[, isIgnoreNull])
:   Returns the last value of `expr` for a group of rows.
If `isIgnoreNull` is true, returns only nonnull values.


## last_day
{: #last_day}

last_day(date)
:   Returns the last day of the month that the date belongs to.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT last_day('2009-01-12')
   ```

:   **Result value**

   ```sql
    2009-01-31
    ```



## last_value
{: #last_value}

last_value(expr[, isIgnoreNull])
:   Returns the last value of `expr` for a group of rows.
If `isIgnoreNull` is true, returns only nonnull values.


## lcase
{: #lcase}

lcase(str)
:   Returns `str` with all characters that are changed to lowercase.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT lcase('SparkSql')
   ```

:   **Result value**

   ```sql
    sparksql
    ```


## lead
{: #lead}

lead(input[, offset[, default]])
:   Returns the value of `input` at the `offset`th row
after the current row in the window. The default value of `offset` is 1 and the default
value of `default` is null. If the value of `input` at the `offset`th row is null,
null is returned. If no such offset row exists (for example, when the offset is 1, the last
row of the window does not have any subsequent row), `default` is returned.


## least
{: #least}

least(expr, ...)
:   Returns the least value of all parameters, skipping null values.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT least(10, 9, 2, 4, 3)
   ```

:   **Result value**

   ```sql
    2
    ```


## left
{: #left}

left(str, len)
:   Returns the leftmost `len`(`len` can be string type) characters from the string `str`, if `len` is less or equal than 0 the result is an empty string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT left('Spark SQL', 3)
   ```

:   **Result value**

   ```sql
    Spa
    ```


## length
{: #length}

length(expr)
:   Returns the character length of string data or number of bytes of binary data. The length of string data includes the trailing spaces. The length of binary data includes binary zeros.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT length('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CHAR_LENGTH('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CHARACTER_LENGTH('Spark SQL ')
   ```

:   **Result value**

   ```sql
    10
    ```


## levenshtein
{: #levenshtein}

levenshtein(str1, str2)
:   Returns the Levenshtein distance between the two indicated strings.

:   **Example of an SQL function usage fragment**
 
   ```sql
   > SELECT levenshtein('kitten', 'sitting')
   ```

:   **Result value**

   ```sql
    3
    ```


## like
{: #like}

str like pattern
:   Returns true if str matches pattern, null if any arguments are null, otherwise, false.

:   **Arguments**

   str - a string expression

pattern - A string expression. The pattern is a string that is matched literally, with
    exception to the following special symbols:

_ matches any one character in the input (similar to . in posix regular expressions)

% matches zero or more characters in the input (similar to .* in posix regular
expressions)

The escape character is "\". If an escape character precedes a special symbol or another
escape character, the following character is matched literally. It is invalid to escape
any other character.

String literals are unescaped in our SQL parser. For example, to match "\abc", the pattern is "\\abc".

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT '%SystemDrive%\Users\John' like '\%SystemDrive\%\\Users%'
   ```

:   **Result value**

   ```sql
   true
   ```

**Note:**

Use RLIKE to match with standard regular expressions.


## ln
{: #ln}

ln(expr)
:   Returns the natural logarithm (base e) of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ln(1)
   ```

:   **Result value**

   ```sql
    0.0
    ```


## locate
{: #locate}

locate(substr, str[, pos])
:   Returns the position of the first occurrence of `substr` in `str` after position `pos`.
The indicated `pos` and return value are 1-based.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT locate('bar', 'foobarbar')
   ```

:   **Result value**

   ```sql
    4
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT locate('bar', 'foobarbar', 5)
   ```

:   **Result value**

   ```sql
    7
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT POSITION('bar' IN 'foobarbar')
   ```

:   **Result value**

   ```sql
    4
    ```


## log
{: #log}

log(base, expr)
:   Returns the logarithm of `expr` with `base`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT log(10, 100)
   ```

:   **Result value**

   ```sql
    2.0
    ```


## log10
{: #log10}

log10(expr)
:   Returns the logarithm of `expr` with base 10.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT log10(10)
   ```

:   **Result value**

   ```sql
    1.0
    ```


## log1p
{: #log1p}

log1p(expr)
:   Returns log(1 + `expr`).

:   **Example of an SQL function usage fragment**
u
   ```sql
   > SELECT log1p(0)
   ```

:   **Result value**

   ```sql
    0.0
    ```


## log2
{: #log2}

log2(expr)
:   Returns the logarithm of `expr` with base 2.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT log2(2)
   ```

:   **Result value**

   ```sql
    1.0
    ```


## lower
{: #lower}

lower(str)
:   Returns `str` with all characters that are changed to lowercase.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT lower('SparkSql')
   ```

:   **Result value**

   ```sql
    sparksql
    ```


## lpad
{: #lpad}

lpad(str, len, pad)
:   Returns `str`, left-padded with `pad` to a length of `len`.
If `str` is longer than `len`, the return value is shortened to `len` characters.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT lpad('hi', 5, '??')
   ```

:   **Result value**

   ```sql
    ???hi
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT lpad('hi', 1, '??')
   ```

:   **Result value**

   ```sql
    h
    ```

## ltrim
{: #ltrim}

ltrim(str)
:   Removes the leading space characters from `str`.

ltrim(trimStr, str)
:   Removes the leading string contains the characters from the trim string.

:   **Arguments**

   - str - A string expression.
   - trimStr - The trim string characters to trim, the default value is a single space.

:   **Example of an SQL function usage fragment**
   ```sql
   > SELECT ltrim('    SparkSQL   ')
   ```

:   **Result value**

   ```sql
    SparkSQL
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ltrim('Sp', 'SSparkSQLS')
   ```

:   **Result value**

   ```sql
    arkSQLS
    ```


## map
{: #map}

map(key0, value0, key1, value1, ...)
:   Creates a map with the indicated key/value pairs.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT map(1.0, '2', 3.0, '4')
   ```

:   **Result value**

   ```sql
    {1.0:"2",3.0:"4"}
    ```


## map_keys
{: #map_keys}

map_keys(map)
:   Returns an unordered array that contains the keys of the map.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT map_keys(map(1, 'a', 2, 'b'))
   ```

:   **Result value**

   ```sql
    [1,2]
    ```


## map_values
{: #map_values}

map_values(map)
:   Returns an unordered array that contains the values of the map.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT map_values(map(1, 'a', 2, 'b'))
   ```

:   **Result value**

   ```sql
    ["a","b"]
    ```


## max
{: #max}

max(expr)
:   Returns the maximum value of `expr`.


## md5
{: #md5}

md5(expr)
:   Returns an MD5 128-bit checksum as a hex string of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT md5('Spark')
   ```

:   **Result value**

   ```sql
    8cde774d6f7333752ed72cacddb05126
    ```

## mean
{: #mean}

mean(expr)
:   Returns the mean that is calculated from values of a group.


## min
{: #min}

min(expr)
:   Returns the minimum value of `expr`.


## minute
{: #minute}

minute(timestamp)
:   Returns the minute component of the string/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT minute('2009-07-30 12:58:59')
   ```

:   **Result value**

   ```sql
    58
    ```



## mod
{: #mod}

expr1 mod expr2
:   Returns the remainder after `expr1`/`expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 2 mod 1.8;
   ```

:   **Result value**

   ```sql
    0.2
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT MOD(2, 1.8)
   ```

:   **Result value**

   ```sql
    0.2
    ```


## monotonically_increasing_id
{: #monotonically_increasing_id}

monotonically_increasing_id()
:   Returns monotonically increasing 64-bit integers. The generated ID is guaranteed
to be monotonically increasing and unique, but not consecutive. The current implementation
puts the partition ID in the upper 31 bits, and the lower 33 bits represent the record number
within each partition. The assumption is that the data frame has less than 1 billion
partitions, and each partition has less than 8 billion records.


## month
{: #month}

month(date)
:   Returns the month component of the date/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT month('2016-07-30')
   ```

:   **Result value**

   ```sql
    7
    ```



## months_between
{: #months_between}

months_between(timestamp1, timestamp2)
:   Returns number of months between `timestamp1` and `timestamp2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT months_between('1997-02-28 10:30:00', '1996-10-30')
   ```

:   **Result value**

   ```sql
    3.94959677
    ```



## named_struct
{: #named_struct}

named_struct(name1, val1, name2, val2, ...)
:   Creates a struct with the indicated field names and values.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT named_struct("a", 1, "b", 2, "c", 3)
   ```

:   **Result value**

   ```sql
    {"a":1,"b":2,"c":3}
    ```


## nanvl
{: #nanvl}

nanvl(expr1, expr2)
:   Returns `expr1` if it's not NaN, or `expr2` otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT nanvl(cast('NaN' as double), 123)
   ```

:   **Result value**

   ```sql
    123.0
     ```


## negative
{: #negative}

negative(expr)
:   Returns the negated value of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT negative(1)
   ```

:   **Result value**

   ```sql
    -1
    ```


## next_day
{: #next_day}

next_day(start_date, day_of_week)
:   Returns the first date that is later than `start_date` and named as indicated.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT next_day('2015-01-14', 'TU')
   ```

:   **Result value**

   ```sql
    2015-01-20
    ```



## not
{: #not}

not expr:   Logical not.


## now
{: #now}

now()
:   Returns the current timestamp at the start of query evaluation.



## ntile
{: #ntile}

ntile(n)
:   Divides the rows for each window partition into `n` buckets that range
from 1 to at most `n`.


## nullif
{: #nullif}

nullif(expr1, expr2)
:   Returns null if `expr1` equals to `expr2`, or `expr1` otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT nullif(2, 2)
    ```

:   **Result value**

   ```sql
    NULL
    ```


## nvl
{: #nvl}

nvl(expr1, expr2)
:   Returns `expr2` if `expr1` is null, or `expr1` otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT nvl(NULL, array('2'))
   ```

:   **Result value**

   ```sql
    ["2"]
    ```


## nvl2
{: #nvl2}

nvl2(expr1, expr2, expr3)
:   Returns `expr2` if `expr1` is not null, or `expr3` otherwise.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT nvl2(NULL, 2, 1)
   ```

:   **Result value**

   ```sql
    1
    ```


## octet_length
{: #octet_length}

octet_length(expr)
:   Returns the byte length of string data or number of bytes of binary data.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT octet_length('Spark SQL')
   ```

:   **Result value**

   ```sql
    9
    ```


## or
{: #or}

expr1 or expr2
:   Logical OR.


## parse_url
{: #parse_url}

parse_url(url, partToExtract[, key])
:   Extracts a part from a URL.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT parse_url('http://spark.apache.org/path?query=1', 'HOST')
   ```

:   **Result value**

   ```sql
    spark.apache.org
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT parse_url('http://spark.apache.org/path?query=1', 'QUERY')
   ```

:   **Result value**

   ```sql
    query=1
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT parse_url('http://spark.apache.org/path?query=1', 'QUERY', 'query')
   ```

:   **Result value**

   ```sql
    1
    ```


## percent_rank
{: #percent_rank}

percent_rank()
:   Computes the percentage ranking of a value in a group of values.


## percentile
{: #percentile}

percentile(col, percentage [, frequency])
:   Returns the exact percentile value of numeric column
`col` at the indicated percentage. The value of percentage must be between 0.0 and 1.0. The value of frequency must be a positive integral.

percentile(col, array(percentage1 [, percentage2]...) [, frequency])
:   Returns the exact
percentile value array of numeric column `col` at the indicated percentage. Each value of the percentage array must be between 0.0 and 1.0. The value of frequency must be a positive integral.


## percentile_approx
{: #percentile_approx}

percentile_approx(col, percentage [, accuracy])
:   Returns the approximate percentile value of numeric
column `col` at the indicated percentage. The value of percentage must be between 0.0
and 1.0. The `accuracy` parameter (default: 10000) is a positive numeric literal that
controls approximation accuracy at the cost of memory. Higher value of `accuracy` yields
better accuracy, `1.0/accuracy` is the relative error of the approximation.
When `percentage` is an array, each value of the percentage array must be between 0.0 and 1.0.
In this case, returns the approximate percentile array of column `col` at the indicated
percentage array.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT percentile_approx(10.0, array(0.5, 0.4, 0.1), 100)
   ```

:   **Result value**

   ```sql
    [10.0,10.0,10.0]
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT percentile_approx(10.0, 0.5, 100)
   ```

:   **Result value**

   ```sql
    10.0
    ```


## pi
{: #pi}

pi()
:   Returns pi.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT pi()
   ```

:   **Result value**

   ```sql
    3.141592653589793
    ```


## pmod
{: #pmod}

pmod(expr1, expr2)
:   Returns the positive value of `expr1` mod `expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT pmod(10, 3)
   ```

:   **Result value**

   ```sql
    1
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT pmod(-10, 3)
   ```

:   **Result value**

   ```sql
    2
    ```


## posexplode
{: #posexplode}

posexplode(expr)
:   Separates the elements of array `expr` into multiple rows with positions, or the elements of map `expr` into multiple rows and columns with positions.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT posexplode(array(10,20))
   ```

:   **Result value**

   ```sql
    0  10  1  20
    ```


## posexplode_outer
{: #posexplode_outer}

posexplode_outer(expr)
:   Separates the elements of array `expr` into multiple rows with positions, or the elements of map `expr` into multiple rows and columns with positions.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT posexplode_outer(array(10,20))
   0  10
   1  20
   ```


## position
{: #position}

position(substr, str[, pos])
:   Returns the position of the first occurrence of `substr` in `str` after position `pos`.
The indicated `pos` and return value are 1-based.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT position('bar', 'foobarbar')
   ```

:   **Result value**

   ```sql
    4
    ```

 :   **Example of an SQL function usage fragment**

   ```sql
   > SELECT position('bar', 'foobarbar', 5)
   ```

:   **Result value**

   ```sql
    7
    ```

 :   **Example of an SQL function usage fragment**

   ```sql
   > SELECT POSITION('bar' IN 'foobarbar')
   ```

:   **Result value**

   ```sql
    4
    ```


## positive
{: #positive}

positive(expr)
:   Returns the value of `expr`.


## pow
{: #pow}

pow(expr1, expr2)
:   Raises `expr1` to the power of `expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT pow(2, 3)
   ```

:   **Result value**

   ```sql
    8.0
    ```


## power
{: #power}

power(expr1, expr2)
:   Raises `expr1` to the power of `expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT power(2, 3)
   ```

:   **Result value**

   ```sql
    8.0
    ```


## printf
{: #printf}

printf(strfmt, obj, ...)
:   Returns a formatted string from printf-style format strings.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT printf("Hello World %d %s", 100, "days")
   ```

:   **Result value**

   ```sql
    Hello World 100 days
    ```


## quarter
{: #quarter}

quarter(date)
:   Returns the quarter of the year for date, in the range 1 - 4.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT quarter('2016-08-31')
   ```

:   **Result value**

   ```sql
    3
    ```



## radians
{: #radians}

radians(expr)
:   Converts degrees to radians.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT radians(180)
   ```

:   **Result value**

   ```sql
    3.141592653589793
    ```


## rand
{: #rand}

rand([seed])
:   Returns a random value with independent and identically distributed (i.i.d.) uniformly distributed values in [0, 1).

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rand()
   ```

:   **Result value**

   ```sql
    0.9629742951434543
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rand(0)
   ```

:   **Result value**

   ```sql
    0.8446490682263027
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rand(null)
   ```

:   **Result value**

   ```sql
    0.8446490682263027
    ```


## randn
{: #randn}

randn([seed])
:   Returns a random value with independent and identically distributed (i.i.d.) values drawn from the standard normal distribution.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT randn()
   ```

:   **Result value**

   ```sql
    -0.3254147983080288
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT randn(0)
   ```

:   **Result value**

   ```sql
    1.1164209726833079
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT randn(null)
   ```

:   **Result value**

   ```sql
    1.1164209726833079
    ```


## rank
{: #rank}

rank()
:   Computes the rank of a value in a group of values. The result is one plus the number
of rows preceding or equal to the current row in the ordering of the partition. The values
 produce gaps in the sequence.


## regexp_extract
{: #regexp_extract}

regexp_extract(str, regexp[, idx])
:   Extracts a group that matches `regexp`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT regexp_extract('100-200', '(\\d+)-(\\d+)', 1)
   ```

:   **Result value**

   ```sql
    100
    ```


## regexp_replace
{: #regexp_replace}

regexp_replace(str, regexp, rep)
:   Replaces all substrings of `str` that match `regexp` with `rep`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT regexp_replace('100-200', '(\\d+)', 'num')
   ```

:   **Result value**

   ```sql
    num-num
    ```


## repeat
{: #repeat}

repeat(str, n)
:   Returns the string that repeats the indicated string value n times.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT repeat('123', 2)
   ```

:   **Result value**

   ```sql
    123123
    ```


## replace
{: #replace}

replace(str, search[, replace])
:   Replaces all occurrences of `search` with `replace`.

:   **Arguments**

   - str - A string expression.
   - search - A string expression. If `search` is not found in `str`, `str` is returned unchanged.
   - replace - A string expression. If `replace` is not specified or is an empty string, nothing replaces the string that is removed from `str`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT replace('ABCabc', 'abc', 'DEF')
   ```

:   **Result value**

   ```sql
    ABCDEF
    ```


## reverse
{: #reverse}

reverse(str)
:   Returns the reversed indicated string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT reverse('Spark SQL')
   ```

:   **Result value**

   ```sql
    LQS krapS
    ```


## right
{: #right}

right(str, len)
:   Returns the rightmost `len`(`len` can be string type) characters from the string `str`, if `len` is less or equal than 0 the result is an empty string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT right('Spark SQL', 3)
   ```

:   **Result value**

   ```sql
    SQL
    ```


## rint
{: #rint}

rint(expr)
:   Returns the double value that is closest in value to the argument and is equal to a mathematical integer.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rint(12.3456)
   ```

:   **Result value**

   ```sql
    12.0
    ```


## rlike
{: #rlike}

str rlike regexp
:   Returns true if `str` matches `regexp`, or false otherwise.

:   **Arguments**

   - str - A string expression.
   - regexp - A string expression. The pattern string is a Java™ regular expression.

String literals (including regex patterns) are unescaped in our SQL
parser. For example, to match "\abc", a regular expression for `regexp` can be
"^\abc$".

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT '%SystemDrive%\Users\John' rlike '%SystemDrive%\\Users.*'
   ```

:   **Result value**

   ```sql
   true
   ```

**Note:**

Use LIKE to match with simple string pattern.


## rollup
{: #rollup}


## round
{: #round}

round(expr, d)
:   Returns `expr` rounded to `d` decimal places by using HALF_UP rounding mode.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT round(2.5, 0)
   ```

:   **Result value**

   ```sql
    3.0
    ```


## row_number
{: #row_number}

row_number()
:   Assigns a unique, sequential number to each row, starting with one,
according to the ordering of rows within the window partition.


## rpad
{: #rpad}

rpad(str, len, pad)
:   Returns `str`, right-padded with `pad` to a length of `len`.
If `str` is longer than `len`, the return value is shortened to `len` characters.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rpad('hi', 5, '??')
   ```

:   **Result value**

   ```sql
    hi???
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rpad('hi', 1, '??')
   ```

:   **Result value**

   ```sql
    h
    ```


## rtrim
{: #rtrim}

rtrim(str)
:   Removes the trailing space characters from `str`.


rtrim(trimStr, str)
:   Removes the trailing string that contains the characters from the trim string from the `str`.

:   **Arguments**

   - str - A string expression.
   - trimStr - The trim string characters to trim, the default value is a single space

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rtrim('    SparkSQL   ')
   ```

:   **Result value**

   ```sql
    SparkSQL
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT rtrim('LQSa', 'SSparkSQLS')
   ```

:   **Result value**

   ```sql
    SSpark
    ```


## second
{: #second}

second(timestamp)
:   Returns the second component of the string/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT second('2009-07-30 12:58:59')
   ```

:   **Result value**

   ```sql
    59
    ```



## sentences
{: #sentences}

sentences(str[, lang, country])
:   Splits `str` into an array of words.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sentences('Hi there! Good morning.')
   ```

:   **Result value**

   ```sql
    [["Hi","there"],["Good","morning"]]
    ```


## sha
{: #sha}

sha(expr)
:   Returns a sha1 hash value as a hex string of the `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sha('Spark')
   ```

:   **Result value**

   ```sql
    85f5955f4b27a9a4c2aab6ffe5d7189fc298b92c
    ```


## sha1
{: #sha1}

sha1(expr)
:   Returns a sha1 hash value as a hex string of the `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sha1('Spark')
   ```

:   **Result value**

   ```sql
    85f5955f4b27a9a4c2aab6ffe5d7189fc298b92c
    ```


## sha2
{: #sha2}

sha2(expr, bitLength)
:   Returns a checksum of SHA-2 family as a hex string of `expr`.
SHA-224, SHA-256, SHA-384, and SHA-512 are supported. Bit length of 0 is equivalent to 256.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sha2('Spark', 256)
   ```

:   **Result value**

   ```sql
    529bc3b07127ecb7e53a4dcf1991d9152c24537d919178022b2c42657f79a26b
    ```


## shiftleft
{: #shiftleft}

shiftleft(base, expr)
:   Bitwise left shift.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT shiftleft(2, 1)
   ```

:   **Result value**

   ```sql
    4
    ```


## shiftright
{: #shiftright}

shiftright(base, expr)
:   Bitwise (signed) right shift.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT shiftright(4, 1)
   ```

:   **Result value**

   ```sql
    2
    ```


## shiftrightunsigned
{: #shiftrightunsigned}

shiftrightunsigned(base, expr)
:   Bitwise unsigned right shift.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT shiftrightunsigned(4, 1)
   ```

:   **Result value**

   ```sql
    2
    ```


## sign
{: #sign}

sign(expr)
:   Returns -1.0, 0.0 or 1.0 as `expr` is negative, 0 or positive.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sign(40)
   ```

:   **Result value**

   ```sql
    1.0
    ```


## signum
{: #signum}

signum(expr)
:   Returns -1.0, 0.0 or 1.0 as `expr` is negative, 0 or positive.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT signum(40)
   ```

:   **Result value**

   ```sql
    1.0
    ```


## sin
{: #sin}

sin(expr)
:   Returns the sine of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sin(0)
   ```

:   **Result value**

   ```sql
    0.0
    ```


## sinh
{: #sinh}

sinh(expr)
:   Returns the hyperbolic sine of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sinh(0)
   ```

:   **Result value**

   ```sql
    0.0
    ```


## size
{: #size}

size(expr)
:   Returns the size of an array or a map. Returns -1 if null.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT size(array('b', 'd', 'c', 'a'))
   ```

:   **Result value**

   ```sql
    4
    ```


## skewness
{: #skewness}

skewness(expr)
:   Returns the skewness value that is calculated from values of a group.


## smallint
{: #smallint}

smallint(expr)
:   Casts the value `expr` to the target data type `smallint`.


## sort_array
{: #sort_array}

sort_array(array[, ascendingOrder])
:   Sorts the input array in ascending or descending order according to the natural ordering of the array elements.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sort_array(array('b', 'd', 'c', 'a'), true)
   ```

:   **Result value**

   ```sql
    ["a","b","c","d"]
    ```


## soundex
{: #soundex}

soundex(str)
:   Returns Soundex code of the string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT soundex('Miller')
   ```

:   **Result value**

   ```sql
    M460
    ```


## space
{: #space}

space(n)
:   Returns a string that consists of `n` spaces.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT concat(space(2), '1')
   ```

:   **Result value**

   ```sql
    1
    ```


## spark_partition_id
{: #spark_partition_id}

spark_partition_id()
:   Returns the current partition ID.


## split
{: #split}

split(str, regex)
:   Splits `str` around occurrences that match `regex`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT split('oneAtwoBthreeC', '[ABC]')
   ```

:   **Result value**

   ```sql
    ["one","two","three",""]
    ```


## sqrt
{: #sqrt}

sqrt(expr)
:   Returns the square root of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT sqrt(4)
   ```

:   **Result value**

   ```sql
    2.0
    ```


## stack
{: #stack}

stack(n, expr1, ..., exprk)
:   Separates `expr1`, ..., `exprk` into `n` rows.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT stack(2, 1, 2, 3)
   ```

:   **Result value**

   ```sql
   1  2   3  NULL
   ```


## std
{: #std}

std(expr)
:   Returns the sample standard deviation that is calculated from values of a group.


## stddev
{: #stddev}

stddev(expr)
:   Returns the sample standard deviation that is calculated from values of a group.


## stddev_pop
{: #stddev_pop}

stddev_pop(expr)
:   Returns the population standard deviation that is calculated from values of a group.


## stddev_samp
{: #stddev_samp}

stddev_samp(expr)
:   Returns the sample standard deviation that is calculated from values of a group.


## str_to_map
{: #str_to_map}

str_to_map(text[, pairDelim[, keyValueDelim]])
:   Creates a map after splitting the text into key/value pairs by using delimiters. Default delimiters are ',' for `pairDelim` and ':' for `keyValueDelim`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT str_to_map('a:1,b:2,c:3', ',', ':')
   ```

:   **Result value**

   ```sql
   map("a":"1","b":"2","c":"3")
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT str_to_map('a')
   ```

:   **Result value**

   ```sql
    map("a":null)
    ```


## string
{: #string}

string(expr)
:   Casts the value `expr` to the target data type `string`.


## struct
{: #struct}

struct(col1, col2, col3, ...)
:   Creates a struct with the indicated field values.


## substr
{: #substr}

substr(str, pos[, len])
:   Returns the substring of `str` that starts at `pos` and is of length `len`, or the slice of byte array that starts at `pos` and is of length `len`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT substr('Spark SQL', 5)
   ```

:   **Result value**

   ```sql
    k SQL
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT substr('Spark SQL', -3)
   ```

:   **Result value**

   ```sql
    SQL
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT substr('Spark SQL', 5, 1)
   ```

:   **Result value**

   ```sql
    k
    ```


## substring
{: #substring}

substring(str, pos[, len])
:   Returns the substring of `str` that starts at `pos` and is of length `len`, or the slice of byte array that starts at `pos` and is of length `len`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT substring('Spark SQL', 5)
   ```

:   **Result value**

   ```sql
    k SQL
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT substring('Spark SQL', -3)
   ```

:   **Result value**

   ```sql
    SQL
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT substring('Spark SQL', 5, 1)
   ```

:   **Result value**

   ```sql
    k
    ```


## substring_index
{: #substring_index}

substring_index(str, delim, count)
:   Returns the substring from `str` before `count` occurrences of the delimiter `delim`.
If `count` is positive, everything to the left of the final delimiter (counting from the
left) is returned. If `count` is negative, everything to the right of the final delimiter
(counting from the right) is returned. The function substring_index performs a case-sensitive match
when you search for `delim`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT substring_index('www.apache.org', '.', 2)
   ```

:   **Result value**

   ```sql
    www.apache
    ```


## sum
{: #sum}

sum(expr)
:   Returns the sum that is calculated from values of a group.


## tan
{: #tan}

tan(expr)
:   Returns the tangent of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT tan(0)
   ```

:   **Result value**

   ```sql
    0.0
    ```


## tanh
{: #tanh}

tanh(expr)
:   Returns the hyperbolic tangent of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT tanh(0)
   ```

:   **Result value**

   ```sql
    0.0
    ```


## timestamp
{: #timestamp}

timestamp(expr)
:   Casts the value `expr` to the target data type `timestamp`.


## tinyint
{: #tinyint}

tinyint(expr)
:   Casts the value `expr` to the target data type `tinyint`.


## to_date
{: #to_date}

to_date(date_str[, fmt])
:   Parses the `date_str` expression with the `fmt` expression to
a date. Returns null with invalid input. By default, it follows casting rules to a date if
the `fmt` is omitted.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2009-07-30 04:17:52')
   ```

:   **Result value**

   ```sql
    2009-07-30
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_date('2016-12-31', 'yyyy-MM-dd')
   ```

:   **Result value**

   ```sql
    2016-12-31
    ```



## to_json
{: #to_json}

to_json(expr[, options])
:   Returns a JSON string with a indicated struct value.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_json(named_struct('a', 1, 'b', 2))
   ```

:   **Result value**

   ```sql
    {"a":1,"b":2}
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_json(named_struct('time', to_timestamp('2015-08-26', 'yyyy-MM-dd')), map('timestampFormat', 'dd/MM/yyyy'))
   ```

:   **Result value**

   ```sql
    {"time":"26/08/2015"}
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_json(array(named_struct('a', 1, 'b', 2))
   ```

:   **Result value**

   ```sql
    [{"a":1,"b":2}]
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_json(map('a', named_struct('b', 1)))
   ```

:   **Result value**

   ```sql
    {"a":{"b":1}}
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_json(map(named_struct('a', 1),named_struct('b', 2)))
   ```

:   **Result value**

   ```sql
    {"[1]":{"b":2}}
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_json(map('a', 1))
   ```

:   **Result value**

   ```sql
    {"a":1}
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_json(array((map('a', 1))))
   ```

:   **Result value**

   ```sql
    [{"a":1}]
    ```



## to_timestamp
{: #to_timestamp}

to_timestamp(timestamp[, fmt])
:   Parses the `timestamp` expression with the `fmt` expression to
a timestamp. Returns null with invalid input. By default, it follows casting rules to
a timestamp if the `fmt` is omitted.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_timestamp('2016-12-31 00:12:00')
   ```

:   **Result value**

   ```sql
   2016-12-31 00:12:00
   ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_timestamp('2016-12-31', 'yyyy-MM-dd')
   ```

:   **Result value**

   ```sql
    2016-12-31 00:00:00
    ```



## to_unix_timestamp
{: #to_unix_timestamp}

to_unix_timestamp(expr[, pattern])
:   Returns the UNIX timestamp of the indicated time.

:   **Example of an SQL function usage fragment**

```> SELECT to_unix_timestamp('2016-04-08', 'yyyy-MM-dd')```

:   **Result value**

``` 1460041200```




## to_utc_timestamp
{: #to_utc_timestamp}

to_utc_timestamp(timestamp, timezone)
:   Given a timestamp, such as '2017-07-14 02:40:00.0', this function interprets it as a time in the indicated time zone, and renders that time as a timestamp in UTC. For example, 'GMT+1' would yield '2017-07-14 01:40:00.0'.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT to_utc_timestamp('2016-08-31', 'Asia/Seoul')
   ```

:   **Result value**

   ```sql
   2016-08-30 15:00:00
   ```



## translate
{: #translate}

translate(input, from, to)
:   Converts the `input` string by replacing the characters present in the `from` string with the corresponding characters in the `to` string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT translate('AaBbCc', 'abc', '123')
   ```

:   **Result value**

   ```sql
    A1B2C3
    ```


## trim
{: #trim}

trim(str)
:   Removes the leading and trailing space characters from `str`.

trim(BOTH trimStr FROM str)
:   Removes the leading and trailing `trimStr` characters from `str`.

trim(LEADING trimStr FROM str)
:   Removes the leading `trimStr` characters from `str`.

trim(TRAILING trimStr FROM str)
:   Removes the trailing `trimStr` characters from `str`.

:   **Arguments**

   - str - A string expression.
   - trimStr - The trim string characters to trim, the default value is a single space.
   - BOTH, FROM - Keywords to specify trimming string characters from both ends of
    the string.
   - LEADING, FROM - Keywords to specify trimming string characters from the left
    end of the string.
   - TRAILING, FROM - Keywords to specify trimming string characters from the right
    end of the string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT trim('    SparkSQL   ')
   ```

:   **Result value**

   ```sql
    SparkSQL
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT trim('SL', 'SSparkSQLS')
   ```

:   **Result value**

   ```sql
    parkSQ
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT trim(BOTH 'SL' FROM 'SSparkSQLS')
   ```

:   **Result value**

   ```sql
    parkSQ
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT trim(LEADING 'SL' FROM 'SSparkSQLS')
   ```

:   **Result value**

   ```sql
    parkSQLS
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT trim(TRAILING 'SL' FROM 'SSparkSQLS')
   ```

:   **Result value**

   ```sql
    SSparkSQ
    ```


## trunc
{: #trunc}

trunc(date, fmt)
:   Returns `date` with the time portion of the day truncated to the unit specified by the format model `fmt`.
`fmt` is one of ["year", "yyyy", "yy", "mon", "month", "mm"].

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT trunc('2009-02-12', 'MM')
   ```

:   **Result value**

   ```sql
    2009-02-01
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT trunc('2015-10-27', 'YEAR')
   ```

:   **Result value**

   ```sql
    2015-01-01
    ```



## ucase
{: #ucase}

ucase(str)
:   Returns `str` with all characters that are changed to uppercase.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ucase('SparkSql')
   ```

:   **Result value**

   ```sql
    SPARKSQL
    ```


## unbase64
{: #unbase64}

unbase64(str)
:   Converts the argument from a base 64 string `str` to a binary.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT unbase64('U3BhcmsgU1FM')
   ```

:   **Result value**

   ```sql
    Spark SQL
    ```


## unhex
{: #unhex}

unhex(expr)
:   Converts hexadecimal `expr` to binary.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT decode(unhex('537061726B2053514C'), 'UTF-8')
   ```

:   **Result value**

   ```sql
    Spark SQL
    ```


## unix_timestamp
{: #unix_timestamp}

unix_timestamp([expr[, pattern]])
:   Returns the UNIX timestamp of current or specified time.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT unix_timestamp()
   ```

:   **Result value**

   ```sql
    1476884637
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT unix_timestamp('2016-04-08', 'yyyy-MM-dd')
   ```

:   **Result value**

   ```sql
    1460041200
    ```



## upper
{: #upper}

upper(str)
:   Returns `str` with all characters that are changed to uppercase.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT upper('SparkSql')
   ```

:   **Result value**

   ```sql
    SPARKSQL
    ```


## uuid
{: #uuid}

uuid()
:   Returns a universally unique identifier (UUID) string. The value is returned as a canonical UUID 36-character string.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT uuid()
   ```

:   **Result value**

   ```sql
    46707d92-02f4-4817-8116-
    ```


## var_pop
{: #var_pop}

var_pop(expr)
:   Returns the population variance that is calculated from values of a group.


## var_samp
{: #var_samp}

var_samp(expr)
:   Returns the sample variance that is calculated from values of a group.


## variance
{: #variance}

variance(expr)
:   Returns the sample variance that is calculated from values of a group.

## weekofyear
{: #weekofyear}

weekofyear(date)
:   Returns the week of the year of the indicated date. A week is considered to start on a Monday and week 1 is the first week with >3 days.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT weekofyear('2008-02-20')
   ```

:   **Result value**

   ```sql
    8
    ```


when

CASE WHEN expr1 THEN expr2 [WHEN expr3 THEN expr4]* [ELSE expr5] END - When `expr1` = true, returns `expr2`; else when `expr3` = true, returns `expr4`; else returns `expr5`.

:   **Arguments**

   - expr1, expr3 - the branch condition expressions must all be Boolean type.
   - expr2, expr4, expr5 - the branch value expressions and else value expression must all be
    same type or coercible to a common type.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CASE WHEN 1 > 0 THEN 1 WHEN 2 > 0 THEN 2.0 ELSE 1.2 END;
   ```

:   **Result value**

   ```sql
    1
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CASE WHEN 1 < 0 THEN 1 WHEN 2 > 0 THEN 2.0 ELSE 1.2 END;
   ```

:   **Result value**

   ```sql
    2
    ```

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT CASE WHEN 1 < 0 THEN 1 WHEN 2 < 0 THEN 2.0 END;
   ```

:   **Result value**

   ```sql 
   NULL
   ```

## window
{: #window}

## xpath
{: #xpath}

xpath(xml, xpath)
:   Returns a string array of values within the nodes of xml that match the XPath expression.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath('<a><b>b1</b><b>b2</b><b>b3</b><c>c1</c><c>c2</c></a>','a/b/text()')
   ```

:   **Result value**

   ```sql
    ['b1','b2','b3']
    ```


## xpath_boolean
{: #xpath_boolean}

xpath_boolean(xml, xpath)
:   Returns true if the XPath expression evaluates to true, or if a matching node is found.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_boolean('<a><b>1</b></a>','a/b')
   ```

:   **Result value**

   ```sql
    true
    ```


## xpath_double
{: #xpath_double}

xpath_double(xml, xpath)
:   Returns a double value, the value zero if no match is found, or NaN if a match is found but the value is nonnumeric.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_double('<a><b>1</b><b>2</b></a>', 'sum(a/b)')
   ```

:   **Result value**

   ```sql
    3.0
    ```

## xpath_float
{: #xpath_float}

xpath_float(xml, xpath)
:   Returns a float value, the value zero if no match is found, or NaN if a match is found but the value is nonnumeric.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_float('<a><b>1</b><b>2</b></a>', 'sum(a/b)')
   ```

:   **Result value**

   ```sql
    3.0
    ```

## xpath_int
{: #xpath_int}

xpath_int(xml, xpath)
:   Returns an integer value, or the value zero if no match is found, or a match is found but the value is nonnumeric.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_int('<a><b>1</b><b>2</b></a>', 'sum(a/b)')
   ```

:   **Result value**

   ```sql
    3
    ```

## xpath_long
{: #xpath_long}

xpath_long(xml, xpath)
:   Returns a long integer value, or the value zero if no match is found, or a match is found but the value is nonnumeric.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_long('<a><b>1</b><b>2</b></a>', 'sum(a/b)')
   ```

:   **Result value**

   ```sql
    3
    ```

## xpath_number
{: #xpath_number}

xpath_number(xml, xpath)
:   Returns a double value, the value zero if no match is found, or NaN if a match is found but the value is nonnumeric.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_number('<a><b>1</b><b>2</b></a>', 'sum(a/b)')
   ```

:   **Result value**

   ```sql
    3.0
    ```


## xpath_short
{: #xpath_short}

xpath_short(xml, xpath)
:   Returns a short integer value, or the value zero if no match is found, or a match is found but the value is nonnumeric.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_short('<a><b>1</b><b>2</b></a>', 'sum(a/b)')
   ```

:   **Result value**

   ```sql
    3
    ```


## xpath_string
{: #xpath_string}

xpath_string(xml, xpath)
:   Returns the text contents of the first xml node that matches the XPath expression.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT xpath_string('<a><b>b</b><c>cc</c></a>','a/c')
   ```

:   **Result value**

   ```sql
    cc
    ```


## year
{: #year}

year(date)
:   Returns the year component of the date/timestamp.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT year('2016-07-30')
   ```

:   **Result value**

   ```sql
    2016
    ```



## |
{: #|}

expr1 | expr2
:   Returns the result of bitwise OR of `expr1` and `expr2`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT 3 | 5;
   ```

:   **Result value**

   ```sql
    7
    ```


## ~
{: #~}

~ expr
:   Returns the result of bitwise NOT of `expr`.

:   **Example of an SQL function usage fragment**

   ```sql
   > SELECT ~ 0;
   ```

:   **Result value**

   ```sql
    -1
    ```
