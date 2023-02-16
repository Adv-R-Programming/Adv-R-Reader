---
pre: <b>2/15. </b>
title: "List and Apply"
weight: 9
summary: "Learn the apply family of functions."
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
- [The Data][]
- [Apply `comma_split()`][]
- [Read ALL the Files!][]
- [Conclusion][]

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

<div class="answer">

drink_dfs = lapply(X = survey\[, c(“coffee_days”, “tea_days”,
“soda.pop_days”, “juice_days”, “none_days”)\], FUN = comma_split,
possible_columns = c(“monday”, “tuesday”, “wednesday”, “thursday”,
“friday”, “saturday”, “sunday”))

</div>

You will have gotten a list object of length 5 back. Recall that lists
are super-vectors. In this case, each element of our list contains an
entire dataframe! Each of these dataframes is the normal output from
`comma_split()`. We could combine these with our `survey` data if we
cared to dome some analyses.

## Read ALL the Files!

Using `lapply()` does not need to be limited to uses within R. One
common way to use it is when loading in data. To try this, we’re going
to load in a number of `.csv` files containing economic and population
data on Massachusetts from the [American Community Survey five-year
estimates (ACS5)][]. You can think of it as a yearly mini-census.

First, we need to have a directory of data files with identical
structures. For this example, we can use some data I have hosted on
GitHub. Run the following code to download the `zip` archive into your
project directory and un-zip it.

``` r
# download file into project directory
download.file("https://github.com/Adv-R-Programming/Adv-R-Reader/raw/main/content/class_worksheets/09_apply_lists/09_data.zip", "./09_data.zip")

# unzip into folder
unzip("./09_data.zip", exdir = "./09_data_dir/")
```

Now that we have the files, we can treat them like any other `.csv`s we
may have used for data analysis. Typically, you would need to run
`read.csv()` to load in these files one at a time. That is a chore.
Instead, we’ll combine a few of the skills we’ve learned in the
worksheets thus far.

First, get a vector of all the file paths of the data inside that folder
using `list.files()`. I use the *pattern* argument here to say “I only
want files that contain this.” In this case, it is the “econ\_” prefix
so I only get our “econ_acs5_YEAR.csv” files which contain economic
data.

``` r
econ_data_paths = list.files("./09_data_dir/", pattern = "econ_", full.names = TRUE)
```

Now, we will use `lapply()` to read in all of the econ_X dataframes at
once.

``` r
all_econ_data = lapply(econ_data_paths, read.csv)
```

You now have a list of length 6 with all of the econ data! No copy and
pasting required. Take a moment to look through the list and see how it
is structured.

You may notice each element is a dataframe in the long format (key-value
pairs). Rather than try to re-format them one at a time, we can pivot
and merge them all at once. First, I’ll pivot everything from long to
wide:

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
elements. Here we are combining our file function and list knowledge.

``` r
for(i in 1:length(all_econ_data_wide)){
  
  # get the file name I want
  file_name = basename(econ_data_paths[i])
  
  # add that as a column to the matching list element
  all_econ_data_wide[[i]]$file_name = file_name
}
```

Now we can bind them all together. *Binding* a dataframe is one method
to join them together. Here I’ll use a function called `do.call()`. This
is really this is the only time I ever use it, and I don’t know what
else it is helpful for, but in this case it allows us to take all
component dataframes of our list, and bind them all together at once.

``` r
merged_econ = do.call(rbind, all_econ_data_wide)
```

Tada! Rather than needing to load everything in one at a time, clean it
one at a time, and combine them one at a time, using the power of
`apply` we have completed each *process* by writing the code once, and
applying it to several objects.

<div class="question">

Repeat this process with the “pop_acs5_XXXX” CSVs.

</div>

<div class="answer">

lab_3\_data = “path/to/lab-3-tidy-agg-merge-NAME/data/”

pop_data_paths = list.files(lab_3\_data, pattern = “pop\_”, full.names =
TRUE)

all_pop_data = lapply(pop_data_paths, read.csv)

all_pop_data_wide = lapply(all_pop_data, FUN = pivot_wider, id_cols =
c(“GEOID”, “NAME”), names_from = “variable”, values_from = c(“estimate”,
“moe”))

for(i in 1:6){

\# get the file name I want file_name = basename(pop_data_paths\[i\])

\# add that as a column to the matching list element
all_pop_data_wide\[\[i\]\]\$file_name = file_name }

merged_pop = do.call(rbind, all_pop_data_wide)

</div>

## Conclusion

Becoming comfortable with iteration, and apply especially, takes time.
However, when combined with your ability to write your own functions
*this* is where you start to see the power of working in code. You can
solve a task *once* and apply that solution to dozens or hundreds of
cases at once.

You can use the same process we went through here to look at your music
collection and rip meta-data. You could analyze your photo collection.
Generate and save text. Whatever you want. Let the mechanisms we have
learned here start framing what you want to do as a final project. You
now know how to build the scaffold to nearly any project.

  [Overview]: #overview
  [The Data]: #the-data
  [Apply `comma_split()`]: #apply-comma_split
  [Read ALL the Files!]: #read-all-the-files
  [Conclusion]: #conclusion
  [American Community Survey five-year estimates (ACS5)]: https://www.census.gov/data/developers/data-sets/acs-5year.html
