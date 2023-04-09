---
pre: <b>4/3. </b>
title: "Advanced Functions/S3"
weight: 26
summary: "Classes and Methods in R."
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
  - [Adding Methods to Existing Generics][]
  - [Creating a New Generic Function][]
  - [Farming Methods][]

## Overview

Some functions in R are more complex than they first appear. We’ve
looked at two such examples, summary and print. Both of these functions
are actually *generic functions* which serve as coordinators for a
number of different *methods*. In this way, a single function can
accommodate several different input types, *and* other packages can make
methods for their own object classes without messing with the original
functions.

![A hopefully helpful illustration][]

Today we are going to learn how to make our own generic functions and
methods. This could potentially be helpful if you are dealing with
*common processes* (like data extraction) for many different types of
input (PDFs, webpages, etc.).

### Adding Methods to Existing Generics

It is fairly simple to add a new method to an existing generic function.
All you need to do is define a new function that adheres to the
following format:

<div class="bold">

<span class="green">generic_function</span>.<span
class="mco">class_name</span> =  
   function(<span class="red">x</span>){  
      <span class="blue">When</span> <span
class="green">generic_function</span> <span class="blue">is
called</span>  
      <span class="blue">on an object of class</span>  
      <span class="mco">class_name</span><span class="blue">, do this
to</span> <span class="red">x</span><span class="blue">.</span>  
}

</div>

So, if we wanted to add a new method to the `summary()` function for the
“potato” class, I would define:

<div class="bold">

<span class="green">summary</span>.<span class="mco">potato</span> =  
   function(<span class="red">x</span>){  
      <span class="blue">When</span> <span class="green">summary</span>
<span class="blue">is called</span>  
      <span class="blue">on an object of class</span>  
      <span class="mco">potato</span><span class="blue">, do this
to</span> <span class="red">x</span><span class="blue">.</span>  
}

</div>

Now, if I ever run `summary()` on an object which I have assigned the
class “potato”, my new `summary.potato()` method will be used.

### Creating a New Generic Function

How do we go about creating brand new generic functions? It’s actually
pretty simple. Say I want to create a new generic function called
“harvest”, which will work on classes of objects such as “strawberry”,
“carrot”, and “apple”. To do so, all I need is:

<div class="bold">

harvest = function(x){ UseMethod(“harvest”) }

</div>

That’s it. We have a new generic function. Right now, it can’t do
anything, as it has no methods associated with it. To add methods, you
can follow the same process as what we did with `summary()`.

### Farming Methods

Run the following code in the console:

``` r
source("https://raw.githubusercontent.com/Adv-R-Programming/Adv-R-Reader/main/content/class_worksheets/26_adv_func/plant_function.R")
```

Then, run the new `plant()` function from your environment, assigning
the output to a new object called `field`. It accepts `"apple"`,
`"carrot"`, or `"strawberry"` as inputs.

<div class="question">

The `field` object in your environment will have a class equal to
whatever you input in the `plant()` function. Take the code from the
last section and create a new generic `harvest` function, then create
methods for objects with class “apple”, “carrot”, and “strawberry”. Your
`harvest` methods should print out how many of the grown food items are
present in your `field` (represented by a 1), and what kind of food it
is.

You can peek at the code I used to make the `plant()` function by going
to the web address inside the `source()` call above.

</div>

<div class="answer">

harvest.apple = function(x){

cat(“You have”, sum(x), class(x), “!”)

}

</div>

  [Overview]: #overview
  [Adding Methods to Existing Generics]: #adding-methods-to-existing-generics
  [Creating a New Generic Function]: #creating-a-new-generic-function
  [Farming Methods]: #farming-methods
  [A hopefully helpful illustration]: img/fig.png
