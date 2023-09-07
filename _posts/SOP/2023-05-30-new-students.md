---
layout: page-fullwidth
title:  "New Students Start Here"
categories:
    - sop
tags:
    - sop
    - new-student
header: no
breadcrumb: true
---
<div class="row">
<div class="medium-4 medium-push-8 columns" markdown="1">
<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>
</div><!-- /.medium-4.columns -->

<div class="medium-8 medium-pull-4 columns" markdown="1">

### Set Up Your IDE

If you do any coding during your time in the Eaves Research Group--and chances are high that you will--you need an IDE (integrated development environment). The preferred IDE is Visual Studio Code developed by Microsoft. Installation of VS Code is straightforward, just [download](https://code.visualstudio.com/download) the correct file for your system and follow the instructions. In addition to supporting most programming languages straight out of the box, VS Code is currently (2023) the official editor for Julia. See [this installation guide](https://www.julia-vscode.org/docs/dev/gettingstarted/) to prepare to use Julia in VS Code.

#### Extensions

VS Code works primarily by starting with a lightweight frame that allows you to build on the functionality that you need through extensions. While this feature makes it less specialized in any particular language, it makes it a fairly decent localized place to do all of your coding. Some useful extensions are

- GitLens -- Git supercharged: Adds useful version control information in your GitHub panel (source control CTRL-SHIFT-G)
- Julia: Support for the Julia language. Includes formatting, syntax, and color coding.
- Julia Color Themes: Color themes for Julia (and Python!)

### Git/GitHub

GitHub is an online platform that hosts Git repositories, perfect for version control and sharing your work. Version control is the most important part of why you should use GitHub and some of the lingo and best practices surrounding that will be explained below. Our group does not often work on a code project synchronously, but being able to easily share your work with Joel or other inheritors of your work can be useful.

#### Push/Pull/Commit/Fork/Clone

These words form the core of the lingo that you will frequently use when working with GitHub. To build familiarity with the usage of these words, we will work through a useful example using the LAMMPS code repository.

Begin by creating/logging into your account on GitHub and navigating to the [LAMMPS code repository](https://github.com/lammps/lammps). We wish to use LAMMPS in a slightly edited form for our own research, so we will **[fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo)** the repository to our own account. During this process, you can give the forked repo a different name and you should change the description to something that is more reflective of your version.

Now that we have our own version of LAMMPS on GitHub, we need to copy the files to our local machine to install and run the program. It is also easier to make edits to any files on our local machine. This process of copying files is called **[cloning](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)**. If you have installed VS Code as your IDE, you can clone a repo through the following steps: open a new VS Code window, start a new project by clicking "Clone Git Repository..." then "Clone from GitHub", VS Code will likely prompt you to sign in, and then you will find within the dropdown the project you wish to clone, in this case your version of LAMMPS. At this point, VS Code asks where you would like to save the files. This is fully up to you, but we recommend grouping it with similar folders possibly in your Documents folder. After confirming the location, VS Code will open the project workspace for you. **[Pulling](https://github.com/git-guides/git-pull)** a repository is essentially cloning the repository after it has already been cloned to your machine. It ensures that your local files match what exists on GitHub.

In your LAMMPS project workspace, make some edits to any files you wish. In order to make the local changes accessible on GitHub we need to **[commit](https://github.com/git-guides/git-commit)** the changes and **[push](https://github.com/git-guides/git-push)** them to GitHub. Commits are how you will track the changes you have made to your code and should be made frequently. Pushes can be made less often as a way to backup your work. Your VS Code window should have some symbols on the left side, find the one labeled "Source Control" (CTRL-SHIFT-G on a Mac). Before commiting your changes, you need to **stage** them. This is done by clicking the "+" symbol that appears next to a changed file when you hover over it. If you don't stage any changes before hitting commit, VS Code will ask if you want to stage all changes. After staging all or a subset of your changes, type a commit message and hit commit. The commit message should briefly describe the changes you made in an informative way. If there are no changes to commit, VS Code will prompt you to sync changes, performing a simultaneous push/pull that will try to make sure your local files and GitHub files match. If you want more options or to only push your changes you can do so in a '...' menu that appears when you hover over the source control bar immediately above the commit message space.

#### More Reading

Congratulations! You have learned the basics of interacting with a Git repository on GitHub. Aside from the occasional conflict that you'll need to solve with Google, this should be all you really need. If you want to do any more reading on the topic here are guides on [Git](https://github.com/git-guides) and [GitHub](https://docs.github.com/en/get-started/quickstart/hello-world).

### Getting Started with CURC

### Interacting with Teams

### All Together Now!

#### Numerical Integration with Monte Carlo

#### The Ising Model