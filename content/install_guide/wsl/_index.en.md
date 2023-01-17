---
pre: <b>0. </b>
title: "[WIN ONLY] Windows Subsystem for Linux"
weight: 1
summary: "Set up a full linux terminal on Windows machines."
format:
  hugo:
    toc: true
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---

-   [Overview]
-   [Check your windows version]
-   [Windows version larger than (or equal to) 19041]
-   [Windows version smaller than 19041]
-   [Verifying your install]

## Overview

Windows now has the ability to install a linux operating system on your machine without the use of an emulator. This gives you a full-featured linux environment that can interact with your normal files.

## Check your windows version

First, please check the build version of Windows that you are using. This can be done by selecting the `Windows logo key + r` on your keyboard. Once you do that, you should see the windows Run prompt:

![][1]

Type the command "winver" (no quotes) into the prompt, as depicted in the image above, and hit enter. You should see a screen similar to this:

![][2]

Your build version number is the one that follows the "Windows Build" text (as highlighted in the above image). Depending on whether your build number is larger or smaller than 19041, please follow
the appropriate directions below:

-   [Larger than (or equal to) 19041]
-   [Smaller than 19041]

## Windows version larger than (or equal to) 19041

In the start menu, search for "Powershell", right click and select "run as administrator".

![][3]

A small blue window should open with a flashing cursor. Please type `wsl --install` and hit enter:

![][4]

This will take a few minutes to install everything. Once it is finished, please skip to [verifying your install][5].

If the above installation did not work- please try to install \[using these instructions\]\[Windows version larger smaller than 19041\] (even if your version is not smaller than 19041).

## Windows version smaller than 19041

In the start menu, search for "Turn Windows features on or off" and open that settings window.

![][6]

In the settings window, scroll down to "Windows Subsystem for Linux", check the box next to it, and select `OK` at the bottom of the window.

![][7]

You will not need to restart your computer. Once you have rebooted, open the Windows Store from the start menu.

![][8]

In the Windows Store, search for `Ubuntu`, and select the version-less one unless you have a reason to pick a specific version.

![][9]

On the Ubuntu page, select `Get` to install.

## Verifying your install

In the start menu, search for and run `Ubuntu`.

![][10]

If a terminal window opens, you should be good to go! You can also open this terminal inside any folder on your computer by holding shift and right-clicking, then selecting "Open Linux shell here."

{{% notice warning %}}
This creates an entirely new operating system on your machine. Thus, things like your git configuration and SSH key for Github will not carry over! You will need to configure git again, and create a new SSH key for this operating system.
{{% /notice %}}

{{% notice note %}}
Thanks to the <a href="https://datalab.ucdavis.edu/install-guide/">UC Davis DataLab's Install Guide</a> for providing a portion of this guide.
{{% /notice %}}

  [Overview]: #overview
  [Check your windows version]: #check-your-windows-version
  [Windows version larger than (or equal to) 19041]: #windows-version-larger-than-or-equal-to-19041
  [Windows version smaller than 19041]: #windows-version-smaller-than-19041
  [Verifying your install]: #commandline-verify
  [1]: img/win_version_run.png "Windows check version from run prompt"
  [2]: img/win_version_popup.png "Windows build version"
  [Larger than (or equal to) 19041]: #windows-version-larger-than-or-equal-to-19041
  [Smaller than 19041]: #windows-version-smaller-than-19041
  [3]: img/win_search_powershell.png "Windows search menu for PowerShell"
  [4]: img/win_wsl_powershell.png "PowerShell command for installing WSL"
  [5]: #commandline-verify
  [6]: img/win_wsl_1.jpg "Windows search menu selecting Turn windows features on or off"
  [7]: img/win_wsl_2.jpg "Windows features window turning on Windows Subsystem for Linux"
  [8]: img/win_wsl_3.jpg "Windows search menu opening the Microsoft store"
  [9]: img/win_wsl_4.jpg "Home page of Microsoft store searching for Ubuntu"
  [10]: img/win_wsl_5.jpg "Windows search menu opening Ubuntu"
