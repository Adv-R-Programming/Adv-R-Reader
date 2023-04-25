---
pre: <b>4/19. </b>
title: "Websites"
weight: 32
summary: "Showcase your Work on the world wide web."
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
  - [Making your ReadME][]
  - [Making it a Website][]

## Overview

Creating a website sounds hard, but in the case of package websites it’s
actually pretty easy. The `pkgdown` package automates most of the
process. It will read your help files and all of your vignettes, and
make a dynamic site based on those files.

There are still a few bits of content we need to fill in though, the
largest of them being your ReadME. We’re going to work on creating that
today. Your ReadME file will act as the homepage to your website.

### Making your ReadME

A ReadME file isn’t anything special, just a regular markdown file. The
purpose of any ReadME is to be the fist thing anyone reads regarding
your package, so they know what it does, how to install it, and where to
learn more.

To make your own ReadME, go to the `File` menu in R Studio, then
`Text File` (not R Markdown!). Save this text file as `README.md`. The
name and file type has to be **exact** for the rest of this process to
work.

Open up the `README.md` in R Studio. You can edit this file like a
Rmarkdown/Quarto file, however, a plan markdown file can contain *no
code*. Text and pictures only!

Describe the following in your ReadME:

1.  What is problem does your package solve?
2.  What dependencies does your package have?
3.  Write a very simple workflow (ala use function a, then b, then c)
4.  Who are the authors? Write little bios for your team!

You can include other things if you would like as well.

You do not need to render/knit a plain markdown document.

### Making it a Website

**NOTE: You can only build your website if your `check()` is working.
Make sure that is good first!**

Once you have your ReadME done, you can try to create a website. We
won’t be putting it online now, but you can see what it would look like
by running the following code.

- `usethis::use_pkgdown()`
- `pkgdown::build_site()`

It will direct you to a local version of your website. Navigate around!
You can read into the `pkgdown` package if you want to learn more about
styling your website.

  [Overview]: #overview
  [Making your ReadME]: #making-your-readme
  [Making it a Website]: #making-it-a-website