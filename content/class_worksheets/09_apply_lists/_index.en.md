List and Apply
================

- [Overview][]
- [The Data][]
- [Apply `comma_split()`][]
- [Read ALL the Files!][]

## Overview

The apply family of functions can be a handy way to perform repetitive
tasks quickly. Today we will be using apply functions to improve some
previous tasks. First we will be revisiting `comma_split()` (for the
last time) and learning to use it on several columns at once. Next, we
will be tackling a common annoyance when it comes to loading several
files into R.

## The Data

We are going to be using class survey data for lab today. Please load it
in using the following:

``` r
survey = readRDS(url("https://github.com/Adv-R-Programming/Adv-R-Reader/raw/main/class_survey.rds"))
```

## Apply `comma_split()`

The first thing we will be doing today is combining our `comma_split()`
function and `lapply()` in order to split all of our `<DRINK>_day` comma
separated columns at once. I’ve provided the fully generalized version
of `comma_split()` we’ve developed in the past few worksheets below. Run
the following to add it to your environment.

``` r
comma_split = function(vector_to_split, possible_columns){
  
  # make a base dataframe with rows for each of our cases.
  output = data.frame(
    'id' = 1:length(vector_to_split)
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
    vector_to_split = gsub(pattern = option, vector_to_split, replacement = '', ignore.case = TRUE)
    
  }
  
  # clear commas and whitespace
  vector_to_split = gsub(pattern = ',', vector_to_split, replacement = '', ignore.case = TRUE)
  vector_to_split = trimws(vector_to_split)
  
  # Fill in 'other'
  output$other = vector_to_split
  # Turn blanks into NAs
  output[output$other == "" & !is.na(output$other), 'other'] = NA
  
  # return output
  return(output)
}
```

Once you’ve got the function in your environment, we are going to use
`lapply()` to apply it over all the relevant columns in our `survey`
dataframe. The first argument to `lapply()` will be the thing you want
to apply over. In this case it will be the `survey` dataframe. The
second argument, `FUN`, is the function you want to apply to the first
argument, `comma_split()`.

{{% notice tip %}} Note that when supplying a dataframe to `lapply()` it
interprets this as applying `FUN` to each column in the dataframe. {{%
/notice %}}

This covers what we want to apply (`FUN`) and what we want to apply it
to (`survey`), but there is one hangup. How do we pass our arguments to
`comma_split()`? The first argument of `FUN` is always assumed to be the
current part of your data the apply function is going over. In the case
of `survey` and `comma_split()` the first argument to `comma_split()`,
`vector_to_split`, will be the columns from `survey`.

But how do we specify the rest of the arguments? This is where some of
our advanced function knowledge comes in. The third argument to
`lapply()` is `...`, which you may recall means we can *pass* arguments
through the `lapply()` function. As long as we put in an argument to
`lapply()` that matches the argument names in `FUN`, (`comma_split()`),
they will be passed through. So in this case if we supply `lapply()`
with an argument called `possible_columns`, that will be passed to
`comma_split()`.

<div class="question">

Use `lapply()` to apply `comma_split()` to all of the `<DRINK>_days`
columns in our `survey` dataframe. Save the results as `drink_dfs`. **DO
NOT** include the `()` after `comma_split` when providing it as an
argument; it will produce an error.

</div>

You will have gotten a list object of length 5 back. Recall that lists
are super-vectors. In this case, each element of our list contains an
entire dataframe! Each of these dataframes is the normal output from
`comma_split()`. We could combine these with our `survey` data if we
cared to dome some analyses.

## Read ALL the Files!

I promised I would share how to read multiple files at once and here we
are. This is actually a common way I use `lapply()`. First, we need to
have a directory of data files with identical structures. For this
example, we will use the data from lab 3 (aggregation and merging).
First, specify the path to the data folder of lab 3. You have to find
the specific path on your computer.

``` r
# change this to match your system
lab_3_data = "path/to/lab-3-tidy-agg-merge-NAME/data/"
```

Next, we will get a vector of all the file paths of the data inside that
folder using `list.files()`. I use the *pattern* argument here to say “I
only want files that contain this.” In this case, it is the “econ\_”
prefix so I only get our “econ_acs5_YEAR.csv” files.

``` r
econ_data_paths = list.files(lab_3_data, pattern = "econ_", full.names = TRUE)
```

Now, we will use `lapply()` to read in all of the econ_X dataframes from
that lab at once.

``` r
all_econ_data = lapply(econ_data_paths, read.csv)
```

You now have a list of length 6 with all of the econ data from that lab!
No copy and pasting required. You can even pivot and merge them all at
once too. First, I’ll pivot everything from long to wide:

``` r
library(tidyr)

all_econ_data_wide = lapply(all_econ_data,
      FUN = pivot_wider,
      id_cols = c("GEOID", "NAME"),
      names_from = "variable",
      values_from = c("estimate", "moe"))
```

Next, we’ll use `basename()` to give each dataframe a year identifier
(we’ll just use the file name for now). I’ll do this one in a `for()`
loop as it’s easier to match the file names vector and our data list
elements.

``` r
for(i in 1:6){
  
  # get the file name I want
  file_name = basename(econ_data_paths[i])
  
  # add that as a column to the matching list element
  all_econ_data_wide[[i]]$file_name = file_name
}
```

Now we can bind them all together. I’ll use `do.call()` here. Really
this is the only time I ever use it, and I don’t know what else it is
helpful for.

``` r
merged_econ = do.call(rbind, all_econ_data_wide)
```

<div class="question">

Repeat this process with the “pop_acs5_XXXX” CSVs from lab 3.

</div>

  [Overview]: #overview
  [The Data]: #the-data
  [Apply `comma_split()`]: #apply-comma_split
  [Read ALL the Files!]: #read-all-the-files
