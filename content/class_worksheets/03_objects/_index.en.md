Objects in R
================

- [Overview][]
- [Class][]
- [Attributes][]
- [Lists][]

## Overview

Objects in R are *the* thing we typically work with. We load data into
objects, manipulate those objects, and run analyses on them. But for
that seamless workflow to happen a surprising amount of work is
happening behind the scenes. Today we will be looking behind the curtain
a bit to see how R understands objects. We will also be spending some
time working with lists.

For each of the following questions, write the answer in an R script or
Quarto document. The answers are due at the start of the next class day,
but *will not* be turned in. Rather, the answers to these worksheet act
as valuable reference for the labs on Friday. Further, if you are not
able to answer all of the questions here, you will have a difficult time
on the more complex labs. Answers for worksheets will be shared after
lecture the day they are due.

## Class

The most common way we thing of vectors in R relates to the three big
classes: character, numeric, and logical. A vector can only contain one
of these types, and R will force that to be the case if it is not
already.

<div class="question">

Can you predict what class each of the following vectors will be before
running them?

``` r
# example 1
c(TRUE, 8)

# example 2
c("TRUE", FALSE)

# example 3
c(F, F, F, T)

# example 4
c(TRUE, TRUE, TRUE, 1)
```

</div>

<div class="answer">

- Example 1: Numeric
- Example 2: Character
- Example 3: Logical
- Example 4: Numeric

</div>

It is possible to force a vector into a specific type though *coercion*.
R will basically take the vector, and do it’s best to present it in the
way you ask. You can do this using the `as.xxxx()` family of functions.
For example:

``` r
as.numeric(c("1", "8", "10"))
```

    [1]  1  8 10

``` r
class(as.numeric(c("1", "8", "10")))
```

    [1] "numeric"

However, this doesn’t always work. This coercion is actually the cause
of one of the more common error you may have seen.

<div class="question">

What will happen when I run the following?

``` r
as.numeric(c("Will", "I", "work?"))
```

</div>

<div class="answer">

    [1] NA NA NA
    Warning message:
    NAs introduced by coercion 

</div>

## Attributes

## Lists

  [Overview]: #overview
  [Class]: #class
  [Attributes]: #attributes
  [Lists]: #lists
