---
pre: <b>3/27. </b>
title: "Advanced git"
weight: 23
summary: "Use git/GitHub for Projects."
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
  - [Why Bother?][]
  - [Adding a File][]
  - [Create a Branch][]
  - [Modifying a Shared File][]
  - [Make a Pull Request][]
  - [Code Review][]
- [Dealing with conflict][]
- [Conclusion][]

<!-- [Member 1]{.blue} -->
<!-- [Member 2]{.red} -->
<!-- [Member 3]{.green} -->
<!-- [Member 4]{.mco} -->

## Overview

For this worksheet we will be practicing using git/GitHub for
collaborative code development. We’ll be using your final project repo
as an example. Specifically, we will be adding all of your names to the
authors section, and dealing with the merge conflicts that will cause.

For this lab, assign each member a number 1-4 (or 3). I will refer to
steps “<span class="blue">Member 1</span>,” “<span class="red">Member
2</span>,” etc. should take throughout this lab. Be sure not to skip
ahead or do steps out of order, or the problems you encounter won’t be
the ones I wrote this guide to help with.

To start with, have each team member open the R Studio project for your
final package and the page on GitHub of your repo.

### Why Bother?

Today we’ll be using git as a team for the first time. git requires you
to be *very* exact, and that can sometimes be tedious. However, git is
simply *the best* method to collaboratively code that is widely used. It
is used in business, government, research, and anywhere else significant
coding is happening. You need to understand these tools to be an
effective team member in the data science world.

Not only does using git to collaborate confer all the benefits of using
git alone–such as version control and backups–it will also make working
on the same code base *much* easier than alternative methods. Because
git tracks code files on a line-by-line basis, it is possible for
multiple people to work on the same files simultaneously with limited
possibility for issues.

Issues do still happen though, and today we will force some of those
issues so we can practice resolving them.

### Adding a File

To start, we are all going to add a new file to our project repo. You
can imagine this is any kind of file you would like–code, help files,
etc.–the process is the same. On each of your computers, create a new
folder called “scrap.” Make sure the name is all lower case, in the
folder is in the base directory of your project. Inside that folder,
create and save a new R Script which contains some `print()` statement.
It doesn’t matter what the statement says.

Confirm all members have **created**, **saved**, and **committed** this
file on their computers before moving on.

At this point <span class="blue">Member 1</span> should push their
changes. This will add their file to the GitHub repo. Go look on your
project repo GitHub page to see the new folder and file appear. You will
need to refresh the page.

Now, <span class="red">Member 2</span> should try to push their changes.
They will get an error saying something along the following:

    ! [rejected]        HEAD -> main
    error: failed to push some refts to <YOUR REPO>
    hint: Updates were rejected because the remote contains work that you do
    hint: not have locally. This is usually caused by another repository pushing
    hint: to the same ref. You may want to first integrate the remote changes
    hint: (e.g. 'git pull ...') before pushing again.

This happens, as the hint says, because there are new files on GitHub
you do not have, so git won’t let you push. To resolve this, we can
follow the hint’s advice and do a pull. This will update your local
files with <span class="blue">Member 1</span>’s work, and now <span
class="red">Member 2</span> should be able to push.

Repeat this process until all members have all other members’ files on
their computer.

### Create a Branch

In the previous section, we were creating files which we then pushed to
the `main` branch of our project. This is *not* good practice. You
should think of `main` as the canonical, pristine version of your code
base. Put simply, only things that have been examined and tested by
multiple team members should be included in `main`.

The proper way to conduct work on a shared project is within a *branch*.
Recall our branch diagram from class:

![[Git Branches - The Turing Way][]][1]

When you create a branch, you split your work off into a separate little
universe. No work you do here will change what `main` is like. This
means you can experiment on your branch, try things, even break things,
and everyone else can keep using the clean code on `main`.

To create a new branch, you can look to the upper right corner of the
*git* pane in R Studio. You’ll see a button that says “New Branch,”
click on that and you will see the following pop up.

<div>

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td style="text-align: center;"><div width="50.0%"
data-layout-align="center">
<figure>
<img src="./img/r_studio_branch.webp" data-fig.extended="false"
alt="New Branch Button" />
<figcaption aria-hidden="true">New Branch Button</figcaption>
</figure>
</div></td>
<td style="text-align: center;"><div width="50.0%"
data-layout-align="center">
<figure>
<img src="./img/branch_menu.png" data-fig.extended="false"
alt="Branch Menu" />
<figcaption aria-hidden="true">Branch Menu</figcaption>
</figure>
</div></td>
</tr>
</tbody>
</table>

</div>

Name your branch “\<YOUR NAME\>\_worksheet”. Make sure that “Sync branch
with remote” is checked and click the “create” button. You will now be
on your own branch within the project!

Whatever changes and commits you make will now be saved to this branch,
rather than `main`. Stay on this branch until I tell you to switch back.

### Modifying a Shared File

While working on separate files is fine, if you are working on a project
together, you probably want to be able to edit the *same* files. git is
great for this usually, but sometimes things can go wrong. We’re going
to practice this now.

Each member should open the `DESCRIPTION` file of their final project
repo in R Studio. You will notice there is a section called `Authors@R`.
Whatever is included here will be understood as the creators of this
package. We want to add each of your names. On each of your computers,
follow the template and add your first and last names, along with email
to the file. Commit your changes to your branch and push.

You won’t encounter any problems at this point because you are all on
your own branch, thus not modifying the same files. This is also true if
you were working on the same R scripts!

### Make a Pull Request

Once you are happy with the work you’ve done on your branch, you can try
to *merge* your work into `main`. This will take your changes and make
it part of the canonical code that everyone will work from. The process
of merging your code is done through a *pull request* on GitHub; named
such because you request your changes to be pulled into main.

Whenever you push your branch, you can refresh the GitHub page for you
repo, and you should see an alert like the following appear:

![][2]

Every member should click on the “Compare & pull request” button. If you
missed this notice, you can also click the button that says “Branches”,
find your branch, and create a pull request there.

Creating a pull request will look like the following with these
elements:

![][3]

1.  The name of your pull request. Is often just the name of your branch
    (if you made a descriptive name!).
2.  The comment area. Provide more context for your request. What did
    you work on? What changes did you make?
3.  Reviewers. Who else on the team do you want to check your work? *At
    least one other person* should always check your work (aka code
    review).
4.  Add labels. Adding labels can help keep things organized if you have
    a lot going on at once.
5.  Milestones. Does this branch make progress on any previously set
    milestones?
6.  Create your pull request and send out your request for reviewers.

Once you create your pull request, the page will change slightly, and
will look the like following:

![][4]

All the things you entered previously will be there, and you can modify
them if you want. This screen also has a few new features.

1.  You can make more comments and have a discussion about the pull
    request on this page.
2.  You can see all the commits that are included in this pull request
    using the “Commits” tab.
3.  You can see all th files that changed and do code review on the
    “Files changed” tab.
4.  You can confirm the pull request and incorporate it into main using
    the “Merge pull request” button. Once you click this, you code
    becomes part of `main`.

### Code Review

Each member should go to the pull request page for their branch, and
assign another member on the team as a *Reviewer*. You will get an email
from GitHub once you have been assigned. Click on the link in that email
to go to the branch in which you are a reviewer, then go to the “Files
changed” tab.

On this tab, you will be able to see all of the files the person has
changed in your team repo. It will look similar to the following:

![][5]

Every file will be listed. If a new line was added to that file, it will
be highlighted in green. If a line was removed, it will be highlighted
in red. For every line, you can click on the plus sign next to the line
number to leave comments to the author. Once you have made all your
comments, you can scroll back to the top, and in the upper right, click
the “Finish your review” button.

The author will be notified of your comments, and can work to address
them. They can make the changes on their computer, than push them, and
the pull request will be updated. In this way, teams can collaboratively
work on code *before* it gets integrated into `main`. Try this process
of leaving comments to each other out now, but *do not* confirm the pull
request yet.

## Dealing with conflict

Sometimes there will be conflicts, aka two people worked on the same
file in a way they git can’t combine by itself. When this happens, it
will need you pick the “real” version of the code.

<span class="blue">Member 1</span> should go to their pull request, and
click on the “Merge pull request” button. This will add their name to
the `DESCRIPTION` file on `main`.

<span class="red">Member 2</span> should then go to their pull request.
They will see that there is a conflict, and the following message:

![][6]

It is telling you that some file you modified now has a conflict with
some file already on main. In this case, it is because now your version
of `DESCRIPTION` cannot be merged with the version on `main`. This is
because <span class="blue">Member 1</span> added their name in the same
spot you added your name. We thus need to resolve the conflict.

We can do this right in GitHub if we want. Click on the grey “Resolve
conflicts” button, and it will take you to a page showing the source of
the conflicts. In this case, it will be the `DESCRIPTION` file, and will
look similar to the following:

![][7]

This page is a text editor where you can edit the files in question to
create the “real” version of the file. The red bars show you the two
conflicting versions of the code occupying the same lines; one version
before the `=======`, on version after. Modify this code into a unified
version similar to the following and click the “Mark as resolved” and
the “Commit merge” buttons. Be sure to include the comma!

![][8]

You have now resolved the conflict, and you can merge your branch into
main!

<span class="green">Member 3</span> (and <span class="mco">Member
4</span>) should do the same. Everyone should then go back to R and
press “Pull” to get the changes onto their machines. Be sure to switch
back to the `main` branch!

## Conclusion

It may be a fair bit of work, but if you follow this method, teams of
hundreds of people can work on the same code base at the same time. When
the alternative is emailing around dozens of files, hoping you have the
most recent one, you can start to see how this would be preferred.
Additionally, whole process we went through today can be linked with the
issue and KanBan board system we learned of previously to really help
keep track of your tasks.

While it is probably overkill for a project of this size, mastering
these skills will make you *much* more valuable in a team setting in the
real world. I encourage you to try your best and treat this as training
for a real world project.

  [Overview]: #overview
  [Why Bother?]: #why-bother
  [Adding a File]: #adding-a-file
  [Create a Branch]: #create-a-branch
  [Modifying a Shared File]: #modifying-a-shared-file
  [Make a Pull Request]: #make-a-pull-request
  [Code Review]: #code-review
  [Dealing with conflict]: #dealing-with-conflict
  [Conclusion]: #conclusion
  [Git Branches - The Turing Way]: https://the-turing-way.netlify.app/reproducible-research/vcs/vcs-git-branches.html
  [1]: ./img/sub-branch.png
  [2]: ./img/pull_request.png
  [3]: ./img/new_request.png
  [4]: ./img/merge.png
  [5]: img/code_review.webp
  [6]: ./img/conflict.webp
  [7]: ./img/conflict_page.webp
  [8]: ./img/resolved.webp