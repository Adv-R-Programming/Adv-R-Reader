---
pre: <b>2/1. </b>
title: "Objects in R"
weight: 3
summary: "Learn the many ways R sees objects."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
editor_options: 
  chunk_output_type: console
---

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
of one of the more common warnings you may have seen.

<div class="question">

What will happen when I run the following?

``` r
as.numeric(c("Will", "I", "work?"))
```

</div>

Here is where we can really start to do odd things given our knowledge
of R. the `as.xxxx()` functions are basically just telling R to look at
a vector a different way. If we know what is happening under the hood,
we can do it ourselves without the need of the function.

<div class="question">

Try running the following. What happened? Explain the process.

``` r
test_vec = c(1, 3, 3, 7)
class(test_vec) = "character"
```

</div>

## Attributes

Attributes are another way R understands objects. You may not have
knowingly interacted with them very often, but they are one of the main
ways R decides what to do when given an object. There are a few
pre-defined attributes, the most common of which being *names*. The
*names* attribute is what makes named vectors work. For example:

``` r
# make a named vector (weather forecast in degrees F)
named_vec = c("Mon" = 39, "Tues" = 36, "Wed" = 44, "Thur" = 36, "Fri" = 44, "Sat" = 45, "Sun" = 37)
named_vec
```

     Mon Tues  Wed Thur  Fri  Sat  Sun 
      39   36   44   36   44   45   37 

Each of the values in the vector are named, such that when they are
shown, the corresponding name will be shown above them. We can still
using it like a normal numeric vector in every way though!

``` r
# quick maths
named_vec * 2
```

     Mon Tues  Wed Thur  Fri  Sat  Sun 
      78   72   88   72   88   90   74 

We can see how these names are stored using the `str()` or “structure”
function. You may have used this to preview dataframes before. In this
case, we can see the vector, and beneath it is shows all the attributes
attached to it.

``` r
str(named_vec)
```

     Named num [1:7] 39 36 44 36 44 45 37
     - attr(*, "names")= chr [1:7] "Mon" "Tues" "Wed" "Thur" ...

*names* is a special attribute that R recognizes, but you can create
your own custom attributes too.

<div class="question">

Using the `attr()` function, add a new attribute to the `named_vec` from
above.

</div>

## Lists

Thus far we have been working with vectors, which are commonly used as
components of larger data structures. The one you are probably most
familiar with is dataframes. Take for example the following:

``` r
# get the built in mtcars data
cars = mtcars

# subset suing $
mtcars$mpg
```

     [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4
    [16] 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7
    [31] 15.0 21.4

``` r
# subset using []
mtcars[, "mpg"]
```

     [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4
    [16] 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7
    [31] 15.0 21.4

Both of these are ways to subset out one column of a dataframe, which is
a vector.

Working with a shallow list, one with only one layer of depth, is much
the same. Take for example the list below. It contains three
elements: 1) a numeric vector, 2) a character vector, and 3) a
dataframe.

``` r
# make an example list to work with
example_list = list("numbers" = c(1, 2, 5, 7, 3, 5),
                    "letters" = c("y", "u", "n", "r", "t", "b"),
                    "df" = mtcars)
```

When trying to subset elements of a list, we can similarly use both `$`
and `[]`. However, there is one major difference, and that is in how we
use the brackets `[]`. When using the brackets on a list, one set of
brackets (`list_name[]`) will get us the element of the list we request,
while two sets (`list_name[[]]`) will get the *contents* of that
element. See for example the differences below:

``` r
# get element 1
example_list[1]
```

    $numbers
    [1] 1 2 5 7 3 5

``` r
# get contents of element 1
example_list[[1]]
```

    [1] 1 2 5 7 3 5

The first call returns a list of length 1, which contains the `numbers`
vector, while the second actually returns the `numbers` vector itself.
*Forgetting this will cause you a lot of grief later on!*

With that importance difference in mind, we can use any of the following
strategies to get the `numbers` vector out of our list.

``` r
# using $
example_list$numbers
```

    [1] 1 2 5 7 3 5

``` r
# using name
example_list[["numbers"]]
```

    [1] 1 2 5 7 3 5

``` r
# using position
example_list[[1]]
```

    [1] 1 2 5 7 3 5

Now that we can get out a vector, we can subset as normal from there.

<div class="question">

From the example list we just made, subset the following:

- The number 7 from the number vector
- The letters “y” and “t” from the character vector
- This entire `mtcars` dataframe

</div>

  [Overview]: #overview
  [Class]: #class
  [Attributes]: #attributes
  [Lists]: #lists
