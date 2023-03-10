---
pre: <b>3/8. </b>
title: "Remote Servers"
weight: 18
summary: "Log in and use remote machines!"
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
- [Login][]
- [Setting up GitHub (Again)][]
- [File Transfer][]
- [Drafting on Local][]
- [Running code on Remote][]

## Overview

Remote servers can give you the extra compute power you need to handle
complex tasks. You won’t always need it, and it is often a hassle you
can avoid. But sometimes you just need to do more beeps and boops per
second.

Using remote servers is like using your own machine in some ways, and
very different in others. The most obvious difference is that you can’t
just open it up and start using it. To use the servers at Smith, you
first need to be granted an account. I’ve taken care of that part. The
rest of this worksheet will be dedicated to getting you the rest of the
way.

## Login

The first step for you will be logging in to the sever. We will do that
from the command line. Open up a terminal of your choice, and log in to
the server using the following command:

    ssh srs

<div>

> **Tip**
>
> If you did not copy your SSH key to the server during class, run the
> following commands:
>
>     ssh-copy-id <YOUR SMITH ID>@rstudio.smith.edu
>
> Then, create a file called `config` inside `~./.ssh/` with the
> following contents:
>
>     Host srs
>         HostName rstudio.smith.edu
>         User <YOUR SMITH ID>

</div>

You will know you are on the server because the prompt on your terminal
will change. At this point, you’re in! Most of what we learned about
using the terminal on your own machine now applies.

## Setting up GitHub (Again)

Recall that because you are now on a different machine, you will no
longer be able to push and pull to GitHub using the SSH key on your
computer. We can fix that by creating a new SSH key for this machine. Go
and follow the SSH portion of the [GitHub install guide][] to create a
new key for this machine. Add it to GitHub along with the key for your
laptop in your user profile.

## File Transfer

We’re on the server, that’s great. But we also need our stuff here with
us. Now that GitHub is set up, we can use git to pull our code to this
server.

This is one of the biggest benefits of using GitHub. While it is great
for collaborating with other people, it is also great for collaborating
with yourself from multiple machines.

Go visit the repo page for your Lab 3 submission and copy the **SSH
address** of the repo.

![][1]

Go back to your server terminal window and clone the repo to the machine
using:

    git clone <LINK TO REPO>

Say yes if it asks if you want to recognize this device. Once it does
it’s magic, you now have all your code from Lab 3 on the server!

## Drafting on Local

Go back to your machine, and open your lab 3 R Studio Project. We are
going to modify our code a bit to prepare it for running on the server.
In essence, we need to translate our .qmd document into a R script.

R Scripts are the normal way R is written; you can think of it as one
huge code chunk. Quarto and R markdown are actually relatively new
creations. You can create an blank R script from the `File` menu bar,
then select `New File > R Script`. Save this new script somewhere in
your project directory, calling it `lab_3_script.r`.

In this R script, copy your most developed working code from Lab 3.
Include everything the code needs to run start to finish, and create the
desired table. Remember to comment anything that is not code!

Test the code start to finish on your machine. Once that code runs and
you have your output, add the following to the end:

    write.csv(<DATAFRAME OBJECT NAME>, "./final_output.csv")

That will save whatever dataframe you made to the machine as a CSV. Run
this script to make sure it all works. When it does, you can commit and
push the R script (**Not the CSV**).

## Running code on Remote

Once you are done drafting your code on your machine, you can go back to
the server and run a `git pull` inside your project directory. Once you
do that, your new script will be downloaded! It’s time to run some code
on the server.

Once you’ve done that hard work on getting your code working, it should
be relatively easy to run it. You need to use the `Rscript` command to
run R code from a script file. If you named your file as directed above,
the following should execute your code:

    Rscript lab_3_script.r

Once it is done, run an `ls` command, and you should see your new output
CSV!

  [Overview]: #overview
  [Login]: #login
  [Setting up GitHub (Again)]: #setting-up-github-again
  [File Transfer]: #file-transfer
  [Drafting on Local]: #drafting-on-local
  [Running code on Remote]: #running-code-on-remote
  [GitHub install guide]: https://adv-r-programming.github.io/Adv-R-Reader/install_guide/github/#creating-ssh-keys-and-adding-to-github
  [1]: img/github_repo.png
