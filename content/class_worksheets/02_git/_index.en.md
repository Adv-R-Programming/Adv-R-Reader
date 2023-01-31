---
pre: <b>1/30. </b>
title: "git"
weight: 2
summary: "Practise some git fundamentals."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---

-   [Overview]
-   [A Simple Repo]
    -   [1. Make a New Project]
    -   [2. Your First Commit]
    -   [3. Making a Change]
    -   [4. Adding More Files]
    -   [5. Breaking Things]
    -   [6. Time Travel for Beginners]
    -   [7. To the Cloud]
    -   [8. Conflict]
-   [Conclusion]

## Overview

git is remarkably useful, but it takes an investment in using it well to gain the full benefits. Today we're going to try and develop some good habits. While they sometimes feel like a chore to adhere to, if you continue on in data science, good git practice *will* save you some day. It saved me from losing days worth of progress on a research paper when my file syncing service corrupted my files.

## A Simple Repo

### 1. Make a New Project

git store information in a special file structure called a *repository*, commonly called the *repo*. Under the hood, this is really just a folder that is organized in a very specific way on your computer. While you can go digging through it in the file browser, it is not recommended.

All git repositories start with an **initialization**. For us, that will usually mean starting a new R studio project. It is possible to initialize a git repo in a project that you already have files in, and we will cover that process later in the semester. For now, in the upper right corner of R studio, create a project in a new directory called `git_worksheet`, and make sure the "Create git Repository" box is checked when you do.

![][1]

Once the project is created, find the folder in your file browser or finder window, and double click on the "git_worksheet.Rproj" file to open that R project. In the far upper right of your screen, you should now see that the project is set to `git_worksheet`.

![][2]

You should also see in the upper right pane a new tab that says `git`. If you don't, something has gone wrong.

### 2. Your First Commit

Now that we have a project with a git repository, we can start adding files that we want to keep track of. In general, you want to commit all code files, but **not** data files. Data files are much larger than what git was made for, and you will quickly run out of storage space on sites like Github if you **push** them. If you do it by accident, it is possible to break your repo!

*It is also critically important that you do not commit any files with sensitive information like passwords*. Other people will be able to see them, as git is in no way encrypted. It is also very difficult to remove a file from git's memory; it was made to save things!

{{% notice warning %}}
Never commit sensitive files like passwords or API keys.
{{% /notice %}}

Before we go on, a quick review of the git workflow. First, we tell git to start watching the file by *staging* it. Then, we commit it to git's memory by *committing* the file. Later in this worksheet, we will then work on *pushing* files to a remote server online. It is crucial to understand that each of these are **separate and distinct** steps!

![][3]

Create a new `.txt` file called `git.txt` and save it within your project folder. Copy the following into that text file.

                                                       
                                                       
                          iiii           tttt          
                         i::::i       ttt:::t          
                          iiii        t:::::t          
                                      t:::::t          
       ggggggggg   gggggiiiiiii ttttttt:::::ttttttt    
      g:::::::::ggg::::gi:::::i t:::::::::::::::::t    
     g:::::::::::::::::g i::::i t:::::::::::::::::t    
    g::::::ggggg::::::gg i::::i tttttt:::::::tttttt    
    g:::::g     g:::::g  i::::i       t:::::t          
    g:::::g     g:::::g  i::::i       t:::::t          
    g:::::g     g:::::g  i::::i       t:::::t          
    g::::::g    g:::::g  i::::i       t:::::t    tttttt
    g:::::::ggggg:::::g i::::::i      t::::::tttt:::::t
     g::::::::::::::::g i::::::i      tt::::::::::::::t
      gg::::::::::::::g i::::::i        tt:::::::::::tt
        gggggggg::::::g iiiiiiii          ttttttttttt  
                g:::::g                                
    gggggg      g:::::g                                
    g:::::gg   gg:::::g                                
     g::::::ggg:::::::g                                
      gg:::::::::::::g                                 
        ggg::::::ggg                                   
           gggggg                                      

Look at the git panel in the upper right pane of R Studio. You should now see the `git.txt` file we just saved. It should have a yellow question marks next to it. That means git is not currently keeping track of that file. It is unknown.

We want to tell git to start tracking `git.txt`. To do so, click on the white check box under the "Staged" column next to `git.txt`. Once you click that, the file is **staged**, meaning when we make our next **commit** to the git timeline, that file will be saved.

![][4]

Let's make out first commit. In the git pane, click on the "Commit" button. This will open the commit window. **Nothing has been committed yet**.

In this window we will see all our files again on the top left, as well as two new areas. In the top right is a box labeled "Commit message." This is where you can write a message that will appear on the git timeline describing what you are adding or changing in this commit. For now, type in "adding git art." Press the "Commit" button once you are done. A progress window will pop up letting you know what is happening. Once it stops changing, you can close it and the commit window.

![][5]

### 3. Making a Change

We've now saved a checkpoint of our `git.txt` file. This means we can return this file to this exact state at any point in the future. We can even delete it and bring it back from oblivion! For now, we'll just make some changes to it.

Say this was actually the start of a little report on what git does. Below the git logo, write a three sentence summary of what you know about git thus far. Save the file when you are done.

Now that we've saved out file, it should appear in our git panel again with a blue "M" next to it, signifying the file has been "Modified." Repeat the process of staging it (clicking check box), and committing it (going into the commit menu, adding a message, and pressing commit). We have now added another checkpoint to our git timeline.

{{% notice info %}}
git can only ever see changes to your file *after you have saved the file*.
{{% /notice %}}

### 4. Adding More Files

Thus far, working with one file seems a lot like saving with extra steps. The true value of git starts to appear once we have multiple files in a project. Create a new R script file called `octocat_load.R`, fill it with the following, and save it:

    # Code to load in Octocat (github mascot) art

    octocat = readLines("https://raw.githubusercontent.com/Adv-R-Programming/Adv-R-Reader/main/content/class_worksheets/02_git/octocat.txt")

    writeLines(octocat, "./octocat.txt")

`readLines` works like `read.csv` in that it is a function to load data into R. Instead of loading CSVs though, it loads text files. Execute this code and then commit the `octocat_load.R`, but *not* the newly created `octocat.txt` file.

Create another new R script called `octocat_print.R`. Inside this file, copy the following code into it:

    # to load the local octocat data and print it

    octocat = readLines("./octocat.txt")

    print(octocat)

Save this file and commit it.

![][6]

Create one last script called `octocat_count.R`. In this script, copy the following:

    # to count the lines in octocat.txt

    octocat = readLines("./octocat.txt")

    length(octocat)

Save this file and commit it. We now have a toy example of a fairly common data science workflow:

-   `octocat_load.R` downloads the file from the internet and saves it locally.
-   `octocat_print.R` is like exploratory data analysis, where we look at the data to understand it.
-   `octocat_count.R` performs some sort of analysis to convert our data into information.

In short, get the data, inspect the data, and perform analyses on the data.

### 5. Breaking Things

Now that we have out mini data science workflow, we can start to modify it (and break it). Start by opening `octocat_load.R`. We can replace the `readLines` function to load the local version of octocat, because we no longer need to grab it from the internet. Replace:

    octocat = readLines("https://raw.githubusercontent.com/Adv-R-Programming/Adv-R-Reader/main/content/class_worksheets/02_git/octocat.txt")

With

    octocat = readLines("./octocat.txt")

Save the file and commit the changes.

Say we want to quickly modify our octocat art by adding an extra line for a caption. Create a new script called `octocat_modify.R` and add the following code to it:

    # to add a caption to octocat

    octocat = readLines("./octocat.txt")

    octocat = c(octocat, "ASCII Art of the Octocat Mascot for Github")

    writeChar(octocat, "./octocat.txt")

We use `c()` here to combine octocat with our caption, and then assign it back to our `octocat` object. Save `octocat_modify.R`, run all the code, and commit it to the repo.

Great, now we have out data updated, let's open up our `octocat_print.R` and run it again to see our beautiful art again.

Uh-oh. It doesn't work anymore. You may have noticed we used the wrong function to save out modified `octocat` object (we used `writeChar` rather than `writeLines`). That's fine, we can load the data in again in our `octocat_load.R` script... but we can't because we changed that script to use the local copy which we just broke.

Time to power up the time machine.

### 6. Time Travel for Beginners

In the git pane, click on the "History" button to open up the git timeline (**not** the history tab, the history button in the git tab).The history window is broken in to to main parts.

![][7]

At the top you have your git timeline, which shows all of your commits in this project. The timeline shows you commit messages, the author of those commits, when the commit happened, and an "SHA" which you can think of as a unique ID for that commit. On the bottom is the **diff** or "difference" window. It will show you what files were changed in that commit, and *how* they changes. Sections in green were added, while sections in red were removed.

Find the commit in the timeline where we changed `octocat_load.R`. Inside the **diff** window, on the box labeled `octocat_load.R`, click on the "View file @ \########" button in the upper right of the box. This will open the file as it was when you committed it. Use this to fix our `octocat_load.R` script, and save an working copy of `octocat.txt` again.

### 7. To the Cloud

Now we're going to go over how to set our new repo up on Github. Head to <https://github.com/> and log in. Once you log in, look to the left side of the screen, and click on the green "New" button.

![][8]

This will take us to the screen to create a new repo. Enter "git_worksheet" under *Repository name* and then scroll to the bottom of the page and click "Create repository." You will now see a page called "Quick Setup." At the top of this page, make sure you select the "SSH" option. The HTTPS will work, but later you wil have to use your username and password to log in every time you want to push or pull.

![][9]

Next, look at the second box that says "...or push an existing repository from the command line."

![][10]

We are going to use these commands to link our local repo with the one on Github. In R Studio, look at the lower left console pane, and click on the "Terminal" tab. Enter the three lines of code from Github into the terminal one by one. They should look like this (**but use the ones from Github, not these!**):

    git remote add origin git@github.com:<REPO-DETAILS>
    git branch -M main
    git push -u origin main

Once you have done that, close R Studio and re-open your project (or right click or command click anywhere on R Studio and select "Reload"). Once you have done that, look at the git pane in the upper right. You will notice you now have the option to click on the "Pull" and "Push" buttons. Click "Push" now, wait for the process to finish, then refresh the page for your new repo on github. You should see your files there!

![][11]

### 8. Conflict

So far so good, but sometimes things go awry. On Github, click on the `octocat_count.R` script to be taken to its page. In the toolbar above the code, on the right hand side, you will see a pencil icon. Click that to edit the file. Add a new comment to the second line that says:

    # Conflict!

Scroll to the bottom of the page and click "Commit Changes." This simulates as if someone else, or yourself, changed the file somewhere else. We'll get into more detail about collaborating with git later on in the semester.

![][12]

Now, in R Studio, open up `octocat_count.R` and on line 2 there, add a comment that says:

    # It happens.

Save the file and commit it using the git pane.

Now, press the "Pull" button in the git pane. This time an error will pop up saying you have a conflict. A conflict happens whenever git can't reconcile the differences between two versions of the same file, so it will ask you to resolve the conflict. In R Studio, around line 2 in `octocat_count.R`, you should now see the following:

    <<<<<<< HEAD
    # it happens
    =======
    # Conflict!
    >>>>>>> <NUMBERS AND LETTERS>

This is git pointing out where the two versions of the file are different. All the differences will exist between the two rows of arrows, the `<<<<<<<` and `>>>>>>>`. The line of equal signs, `=======`, separates the two versions.

To resolve this, we need to pick which version we want to keep. For now, edit this area, so only the comments that says `# Conflict!` remains. You are basically creating the "canonical" version of the file, so it should look like whatever you want all versions of the file to look like. That means you should also delete the `<<<<<<< HEAD`, equal signs, and `>>>>>>> <NUMBERS AND LETTERS>`.

Save the file and commit it again. After you commit the changes, press the "Push" button to update github.

## Conclusion

That was an abstracted version of the full git workflow! We'll have lots of time to practice it throughout the semester, so don't feel worried if it didn't feel normal yet. It takes practice.

While it can be a chore, having good git disciple not only can save yourself a lot of heartache, but it makes you a great team member for real data science projects. Who wouldn't want a time wizard who can move back and forth between long lost code versions?

  [Overview]: #overview
  [A Simple Repo]: #a-simple-repo
  [1. Make a New Project]: #make-a-new-project
  [2. Your First Commit]: #your-first-commit
  [3. Making a Change]: #making-a-change
  [4. Adding More Files]: #adding-more-files
  [5. Breaking Things]: #breaking-things
  [6. Time Travel for Beginners]: #time-travel-for-beginners
  [7. To the Cloud]: #to-the-cloud
  [8. Conflict]: #conflict
  [Conclusion]: #conclusion
  [1]: img/new_proj.png
  [2]: img/git_worksheet_proj.png
  [3]: img/git_workflow.jpg
  [4]: img/staged.png
  [5]: img/commit.png
  [6]: img/octo_print.png
  [7]: img/git_history.png
  [8]: img/github_new.png
  [9]: img/git_ssh.png
  [10]: img/git_existing.png
  [11]: img/github_code.png
  [12]: img/github_conflict.png
