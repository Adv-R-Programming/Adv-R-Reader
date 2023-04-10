Benchmarks
================

- [Overview][]
  - [Our Test Case][]
  - [Making a Plan & Baseline][]
  - [Make Some Improvements][]

## Overview

For our worksheet today, we are going to be tinkering with
`comma_split()` again, this time doing some benchmarking. Our goal by
the end is to try and optimize the function to be a tad faster.

### Our Test Case

For the worksheet today, you will need to load in the class survey data,
you can do so by running the following:

``` r
survey = readRDS(url("https://github.com/Adv-R-Programming/Adv-R-Reader/raw/main/class_survey.rds"))
```

You will also need to have a copy of the `comma_split()` function. No
need to work inside a package today.

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

### Making a Plan & Baseline

The `comma_split()` as it is now is alright; room for improvement, but
not bad. For example, you can see that we pre-allocate space for our
output rows in the dataframe by making an ID column of the appropriate
length, so we aren’t appending anything. However, there are a few ways
to improve things.

Before we go about making improvement however, we need to set a
baseline. To do so, we are going to use `bench::mark()` to get a sense
of how long our code takes to run now.

<div class="question">

Use `bench::mark()` to run `comma_split()` on a column from the class
survey. Run at least 500 iterations.

</div>

### Make Some Improvements

No that we have an idea of how long the code takes now, we are going to
start tinkering.

<div class="question">

Create a new version of `comma_split()` that attempts to speed it up,
called `comma_split_2()`. There are a few ways you can attempt this.
Once you have created your improved function, benchmark it to see if
your changes had the intended effect.

</div>

  [Overview]: #overview
  [Our Test Case]: #our-test-case
  [Making a Plan & Baseline]: #making-a-plan-baseline
  [Make Some Improvements]: #make-some-improvements
