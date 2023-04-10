---
pre: <b>4/10. </b>
title: "Tests"
weight: 29
summary: "Check yourself (and your code)."
format:
    gfm:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
editor_options: 
  chunk_output_type: console
---

- [Overview][]
  - [Our Test Case][]
  - [Setting up a Test][]
  - [A Test of our Own][]
  - [Check your Progress][]

## Overview

Tests are your early warning system if something starts to go awry in
your project. The more complex your project, the more important it
becomes to have a robust set of tests. This is especially true if you
have collaborators.

While tests don’t directly benefit the users of your package, they do
benefit *you* the authors. Say you have designed a function, and it is
working as you intended. It is possible that someone else on your team
could make a change that unintentionally breaks the function. If you
created a test to verity your intended output, your test can now tell
your collaborator that something has gone wrong. If the test dosn’t
exist, you’re relying on some human down the line noticing the mistake.

### Our Test Case

Today we will be creating a simple test for out `comma_split()`
function. I’ve provided a copy of it below. Create a new empty package
or include it in your final project package by creating a new R script
file named `comma_split.R` inside the `./R/` directory of your package
project. Paste our `comma_split()` function inside and save it.

``` r
comma_split = function(vector_to_split, possible_columns){
  
  # make a base dataframe with rows for each of our cases.
  output = data.frame(
    "id" = 1:length(vector_to_split)
    )
  
  # iterate through all options and create a column with NAs for it
  for(option in possible_columns){
    
    # make a new column with a character version of each possible option.
    output[, as.character(option)] = NA
    
  }
  
  # fill output df
  for(option in possible_columns){
    
    # fill dataframe iterativly.
    output[ , option] = grepl(option, vector_to_split, ignore.case = TRUE)
    
  }
  
  # clear all know options
  for(option in possible_columns){
    
    # remove all known options
    vector_to_split = gsub(pattern = option, vector_to_split, replacement = "", ignore.case = TRUE)
    
  }
  
  # clear commas and whitespace
  vector_to_split = gsub(pattern = ",", vector_to_split, replacement = "", ignore.case = TRUE)
  vector_to_split = trimws(vector_to_split)
  
  # Fill in "other"
  output$other = vector_to_split
  # Turn blanks into NAs
  output[output$other == "" & !is.na(output$other), "other"] = NA
  
  # return output
  return(output)
}
```

### Setting up a Test

Once you have `comma_split.R` saved, open it in R Studio. With it active
in the viewer pane, enter the following into the console:

    usethis::use_test()

This will create a `tests/testthat/` directory in your project, and
create a `test-comma_split.R` file. This is where the tests related to
our function should live. Open that file if it is not open already.

Inside the file, you should see some boilerplate test code. This will be
run whenever you try to test or check your package. You can give it a go
by running `devtools::test()`, or by clicking the `Test` button in the
build tab.

Let’s break down the example. The `test_that()` function accepts a
description in the first argument position, and then code within curly
braces. This is a single test. Inside of that test, you can write some
code, and describe what you expect that code to return using the
`expect_XXXX()` family of functions.

``` r
test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
```

There are a number of different expect function you can use ([full list
here][]). All of them generally expect some code in the first position,
and then what you expect that code to output in the second. If the code
does not produce that output, that part of the test has *failed*, and
you will be alerted.

<div class="question">

Try modifying the boilerplate test so that we expect the output to be 5.
Run `devtools::test()`. Interpret the results.

</div>

### A Test of our Own

Now that we understand how tests work, we can start creating our own. We
will now modify the contents of `tests/testthat/test-comma_split.R` to
create an applicable test for our `comma_split()` function.

<div class="question">

Create a simple test for our `comma_split()` function to assure it is
behaving as intended. You may want to look over the various forms of
`expect_XXXX()` functions [here][full list here]. Once you have created
your test, make sure it works by using `devtools::test()`.

</div>

<div class="answer">

test_that(“Are there any commas in the results?”, {

test_vec = c(“Mon, Tues, Wed”) possible = c(“Mon”, “Tues”, “Wed”,
“Thurs”, “Fri”)

out = comma_split(test_vec, possible)

expect_false(all(grepl(“,”, out)))

})

</div>

### Check your Progress

Once you have made your test and it works as intended, try running a
check on your entire package using either `devtools::check()` or the
button under the *Build* tab in the upper right pane.

![][1]

If you have been using the proper `package::function()` notation for
your packages, you will get an error along the lines of:

    <packageNotFoundError/error/condition>
    Error in `loadNamespace(x)`: there is no package called 'stringr'
    Backtrace:
        ▆
     1. ├─mypackage::comma_split(test_vec, possible) at test-comma_split.R:6:2
     2. │ └─base::print(stringr::str_count(string = vector_to_split, pattern = ","))
     3. └─base::loadNamespace(x)
     4.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
     5.     └─base (local) withOneRestart(expr, restarts[[1L]])
     6.       └─base (local) doWithOneRestart(return(expr), restart)

To resolve this, simply enter `usethis::use_package("PACKAGE NAME")` to
add the package as a dependency to your package, so R will know it is
required when some loads your pacakge using `library(YOUR PACKAGE)`.

  [Overview]: #overview
  [Our Test Case]: #our-test-case
  [Setting up a Test]: #setting-up-a-test
  [A Test of our Own]: #a-test-of-our-own
  [Check your Progress]: #check-your-progress
  [full list here]: https://testthat.r-lib.org/reference/
  [1]: img/check.webp
