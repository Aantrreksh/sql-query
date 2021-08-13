---

copyright:
  years: 2019, 2021
lastupdated: "2021-03-03"

keywords: SQL query, time series, SQL, string matching, set matching

subcollection: sql-query

---

{:new_window: target="_blank"}
{:shortdesc: .shortdesc}
{:screen: .screen}
{:codeblock: .codeblock}
{:pre: .pre}

# String matching
{: #string_matching}

You can match the values of a string time series against a string sequence (sequence matching) or against a set of strings (set matching).

Because time series observations are necessarily chronological, the values of a string time series form a *sequence*, that is, a series of values that occur one after the other in time. Each sequence contains *sublists*(values are contiguous) and *subsequences* (values are in order but are not necessarily contiguous). For example:  

The sublists of the sequence `[a,b,c,d]` are the following:  

`[a,b,c,d] [a,b,c] [a,b] [a] [b,c,d] [b,c] [b] [c,d] [c] [d]`  

The subsequences of the sequence [a,b,c,d] are the sublists that are described previously, plus the following non-contiguous sequences:  

`[a,b,d] [a,c,d] [a,c] [b,d] [a,d]`  

Each subsequence has a corresponding *match sublist*, which is the sublist that corresponds to the subsequence but that includes any missing contiguous values. For example, for the sequence `[a,b,c,d,e]`, the subsequences `[a,b,d]`, `[a,c,d]`, and `[a,d]` all have the same match sublist, which is `[a,b,c,d]`.

## Sequence matching
{: #sequence_matching}

For sequence matching, all the members of the specified array of string values (the *pattern*) must match, in the order specified, values in the input string time series. If any of the pattern values do not occur in the time series, or if they occur but are out of order, the matching function returns null. Each matching function specifies a matcher artifact, which determines the behavior of the matching function:  

-   Whether the matching function is to match the pattern with the entire sequence of time series values, with a sublist of the sequence, or with a subsequence.  
-   The threshold that must be met for a match to be considered successful. Depending on the matcher that is used, it is based on one of the following ratios:  
    - The length of the pattern (P) divided by the length of the entire sequence (S).
    - The length of the pattern (P) divided by the length of the match sublist (M).
    - The length of the match sublist (M) divided by the length of the entire sequence (S).
-   Whether the matching function returns the observations that correspond to the pattern or to the match string.  

For example, consider the following string time series that contains five observations that is stored in a table column with the name ts4:  

`[(0,'a'), (1,'b'), (3,'c'), (7,'d'), (8,'e')]`  

-   The following SELECT statement returns the matching observations because the specified array matches ts4 exactly.  

    ```
    SELECT TS_MATCH(ts4, TS_MATCHER_SEQ(), ARRAY('a','b','c','d','e'))
    ```

    Result:  

    `[(0,'a'), (1,'b'), (3,'c'), (7,'d'), (8,'e')]`  

-   The following SELECT statement returns null because although all members of the specified array occur in ts4 in the correct order, the array does not match ts4 exactly.  

    ```
    SELECT TS_MATCH(ts4, TS_MATCHER_SEQ(), ARRAY('a','b','c'))
    ```

    Result:  

    NaN  

-   The following SELECT statement returns the matching observations. The array `[b,c,d]` is a match because the following conditions are satisfied:  
    -   The three values of the pattern occur in the input time series contiguously.
    -   The matcher threshold is 0.6, and the three input values represent at least 60% of the entire time series. If the threshold is set to a number greater than 0.6, this function returns null.  
    
    ```
    SELECT TS_MATCH(ts4, TS_MATCHER_SUBLIST(0.6), ARRAY('b','c','d'))
    ```

    Result:  

    `[(1,'b'), (3,'c'), (7,'d')]`  

-   The following SELECT statement returns the matching observations. The array `[a,b,d]` is a match because the following conditions are satisfied:  
    -   The three values of the pattern occur in the input time series in the specified order. (They do not have to be contiguous.)
    -   The matcher threshold is 0.6, and the three input values represent at least 60% of the entire time series. If the threshold is set to a number greater than 0.6, this function returns null.  
    
    ```
    SELECT TS_MATCH(ts4, TS_MATCHER_SUBSET_PS(0.6), ARRAY('a','b','d'))
    ```

    Result:  

    `[(0,'a'), (1,'b'), (7,'d')]`  

-   The following SELECT statement returns the matching observations. The array `[a,b,d]` is a match because the following conditions are satisfied:  
    -   The three values of the pattern occur in the input time series in the specified order. (They do not have to be contiguous.)
    -   The matcher threshold is 0.75, and the three input values represent at least 75% of the match sublist `(a,b,c,d)`. If the threshold is set to a number greater than 0.75, this function returns null.  
    
    ```
    SELECT TS_MATCH(ts4, TS_MATCHER_SUBSET_PM(0.75), ARRAY('a','b','d'))
    ```

    Result:  

    `[(0,'a'), (1,'b'), (7,'d')]`  

-   The following SELECT statement returns the observations that correspond to the entire match sublist, not merely the observations that correspond to the pattern. The array `[a,b,d]` is a match because the following conditions are satisfied:  
    -   The three values of the pattern occur in the input time series in the specified order. (They do not have to be contiguous.)
    -   The matcher threshold is 0.8, and the resulting match sublist `[a.b.c.d]` represents at least 80% of the entire sequence `(a,b,c,d,e)`. If the threshold is set to a number greater than 0.8, this function returns null.  
    
    ```
    SELECT TS_MATCH(ts4, TS_MATCHER_SUBSET_MS(0.8), ARRAY('a','b','d'))
    ```

    Result:  

    `[(0,'a'), (1,'b'), (3,c), (7,'d')]`

## Set matching
{: #set_matching}

Set matching is similar to sequence matching, except that the sequence of the members of the specified array is unimportant. For example, consider the following string time series that contains five observations that is stored in a table column with the name ts4:  

`[(0,'a'), (1,'b'), (3,'c'), (7,'d'), (8,'e')]`  

The following SELECT statement returns the matching observations. The array [b,a,d] is a match because the matcher threshold is 0.4, and the three input values represent at least 60% of the entire sequence `[a,b,c,d,e]`. If the threshold is set to a number greater than 0.6, this function returns null.

```
SELECT TS_MATCH(ts4, TS_MATCHER_SUBSET_PS(0.6), ARRAY('b','a','d'))
```

Result:
`[(0,'a'), (1,'b'), (7,'d')]`  

The following SELECT statement returns the matching observations. The array `[b,a,d]` is a match because the matcher threshold is 0.75, and the three input values represent at least 75% of the match sublist `[a,b,c,d]`. If the threshold is set to a number greater than 0.75, this function returns null.  

```
TS_MATCH(ts4, TS_MATCHER_SUBSET_PM(0.75), ARRAY('b','a','d'))
```

Result:  

`[(0,'a'), (1,'b'), (7,'d')]`  

The following SELECT statement returns the observations that correspond to the entire match sublist, not merely the observations that correspond to the pattern. The array `[b,a,d]` is a match because the resulting match sublist `[a,b,c,d]` represents at least 80% of the entire sequence `[a,b,c,d,e]`. If the threshold is set to a number greater than 0.8, this function returns null.  

```
SELECT TS_MATCH(ts4, TS_MATCHER_SUBSET_MS(0.8), ARRAY('b','a','d'))
```

Result:  

`[(0,'a'), (1,'b'), (3,c), (7,'d')]`  

The following SELECT statement returns null because not all members of the pattern `[b,a,z]` occur in the sequence `[a,b,c,d,e]`.  

```
SELECT TS_MATCH(ts4, TS_MATCHER_SUBSET_PS(0), ARRAY('b','a','z'))
```

Result:  

NaN


