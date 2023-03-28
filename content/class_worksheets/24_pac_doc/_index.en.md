---
pre: <b>3/29. </b>
title: "Package Documentation"
weight: 24
summary: "Write the help files of your dreams."
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
  - [A Function to Document][]
  - [Summoning the Skeleton][]
  - [Fleshing it Out][]
  - [Example Code][]
  - [Making the `.rd` File][]

## Overview

Documenting your code is a *critical* component of any package. If you
want anyone else to use the tools you put so much work in to, they need
to be able to figure out how to use them. One of the major ways you can
help with that is creating good help pages.

Today you will be writing your first help file with the help of
`roxygen2`. To do so, you will need to be in an R package project. You
can create a scrap one just for this, or use your final project if you
want (just make sure you are on a scrap branch!). You will also need to
make sure both `roxygen2` and `devtools` are installed.

Once you have your project open and everything installed, you can
continue on.

### A Function to Document

For the sake of this worksheet, we will be returning to a familiar
function, our `comma_split()` function from the start of this class.
Your task today will be to write a help file for this function. I’ll
provide a copy of it here:

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

Start by creating a new R script file named `comma_split.R` inside the
`./R/` directory of your package project. Paste our `comma_split()`
function inside and save it.

### Summoning the Skeleton

Once the file is saved, place your cursor *inside* the function as shown
below. It has to be within the curly braces that define the body of the
function.

![][1]

Next, go to the `Code` menu, and select `Code > Insert Roxygen Skeleton`
as shown below.

![][2]

You will see that several new comments have appeared before your
function. This is the R Oxygen template you will modify to create your
help file. You’ll notice these commas have an extra quote (`'`) right
after each pound sign; that is how R differentiates regular comments and
R oxygen comments. R oxygen even made space for our arguments based on
the function definition!

![][3]

The elements here should seem familiar from class. I’ll include a list
of the common Roxygen elements here for reference. Notice how some are
missing from the template; you will need to add them yourself.

- Title: The first line of your template
- Description: Anything between the `@description` tag and the next tag.
- Arguments: Each argument needs it’s own `@param` tag.
- Details: Anything between the `@details` tag and the next tag.
- Return: Anything after the `@returns` tag
- Examples: The rest of the template after the `@examples` tag.
- Export: The end of every template should include the `@export` tag if
  you want users to find it

### Fleshing it Out

Now that you have a template, it is time to fill it out. There’s no real
trick here, you just need to try and be as clear as possible. Always
consider what *you* would like to see in a help file.

<div class="question">

Fill out the text sections of the Roxygen template. *Do not* create
examples yet, we’ll do that next.

</div>

### Example Code

The one part of the help file that behaves a little differently is the
example code. This has to be code that R can run given your function.
You want these examples to be helpful, but not too verbose. Making
things more complicated is the fact that you can’t call in any other
packages or data (well, you can, but it is a pain)!

In this situation, it is best to create you own bit of dummy data within
the example section, and then use that to showcase the function.
Anything you write under the `@examples` tag will be run as code, so you
can define objects there to use. You do still need to start each line
with `#'` though!

<div class="question">

Complete the following example and add it to your function.

``` r
#' @examples
#' 
#' # create example data
#' example_string = c("")
#' 
#' # Split example data based on commas
#' result = comma_split(vector_to_split = example_string,
#'                      possible_columns = c("")
#'                      )
#' 
```

</div>

### Making the `.rd` File

Once you are happy with your help file, you can actually convert it into
a `.rd` file R will understand. To do so, simply have your function
open, and run `devtools::document()` in the console. It will create the
help file from the Roxygen skeleton.

You can test if it worked by doing the following. In the console, run
`devtools::load_all()`. This will attach your whole package to R as if
you loaded it with `library()` **(this is also super helpful for testing
your package!)**. You should then be able to run `?comma_split` to see
your very own help page! So professional.

  [Overview]: #overview
  [A Function to Document]: #a-function-to-document
  [Summoning the Skeleton]: #summoning-the-skeleton
  [Fleshing it Out]: #fleshing-it-out
  [Example Code]: #example-code
  [Making the `.rd` File]: #making-the-.rd-file
  [1]: img/ro_inside.png
  [2]: img/ro_insert.png
  [3]: img/ro_skele.png
