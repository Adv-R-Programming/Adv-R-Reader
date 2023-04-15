---
pre: <b>4/17. </b>
title: "Vignettes"
weight: 31
summary: "Tell the story of your package."
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

## Overview

The goal for today’s worksheet is simple: get started on a vignette for
your package! There’s not much more I can offer on instructions, given
every package’s vignette will be different. I will provide a few key
points I think they should all include, however.

You can create a template vignette by running
`usethis::use_vignette("NAME")` while in your package project. You can
make as many as you like, but be sure to have at least one that is the
“main” vignette, in which I would encourage you to include the
following:

1.  What problem was your package created to solve?
2.  How does your package solve that problem?
3.  What are the main functions in your package?
4.  How do you use them (with examples)?
5.  Give a full walk through of the usage of your package–from data load
    to final product (if applicable).

You must knit the `.rmd` file to see what your vignette will look like.
The version of your package that is *currently installed* will be used,
so be sure to install your package (not `load_all()`) again if anything
major has changed!

Some other tips:

- Take a step back and look at your package from the perspective of an
  outsider.
- Remember it is an education document, don’t skip over details.
- Try showing it to someone *not* on your team, can they understand it?
- Build as you go, don’t try to remember everything at the end.

  [Overview]: #overview