---
pre: <b>1. </b>
title: "R and R Studio"
weight: 1
summary: "Install and configure R & R Studio."
format:
  hugo:
    toc: true
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---

-   [Overview]
-   [Common Settings]

## Overview

> **R** is a programming language and computing environment specialized for statistical analysis and data manipulation. It's commonly used for performing statistical tests, creating data visualizations, and writing data analysis reports. Despite focusing on statistics, it's a full-fledged programming language, and relatively easy to learn.

You should have gotten R and R studio install on the first data of SDS 100. If you did not, [please follow the guide here].

## Common Settings

There are a few settings I recommend changing in R studio to make the process of working with it a little easier. In the top bar, click on **Tools \> Global Options** and modify the following.

1.  Under **General \> Basic \> Workspace**, disable "Restore .RData into workspace at startup."
2.  Under **General \> Basic \> Workspace**, set "Save workspace to .RData on exit" to **Never**.
3.  Under **Code \> Editing**, enable "Soft-wrap R source files."
4.  Under **Code \> Display**, enable "Show Margin" with "Margin Column" set to 80.
5.  Under **Code \> Display**, enable "Highlight R Function Calls."
6.  Under **Code \> Display**, enable "Rainbow Parenthesis."
7.  Under **Code \> Display \>**, enable "Enable preview of named colors and hexadecimal colors."
8.  Under **R Markdown \> Basic**, disable "Show output inline for all R Markdown documents."
9.  Under **R Markdown \> Visual**, disable "Use visual editor by default for new documents."
10. Under **Appearance**, pick a theme you like!
11. \[WIN ONLY\] Under <b>Terminal \> General</b>, set "New terminals open with" to "Bash" (You can only do this after you complete the install guide 0: Windows Subsystem for Linux)

  [Overview]: #overview
  [Common Settings]: #common-settings
  [please follow the guide here]: https://smithcollege-sds.github.io/sds100/lab_01_setup.html
