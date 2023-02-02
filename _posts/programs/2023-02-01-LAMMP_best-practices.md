---
layout: page
title:  "LAMMPS"
categories:
    - LAMMPS
tags:
    - LAMMPS
    - setup
header: no
breadcrumb: true
---

Joel recommends that everyone uses the following steps when using LAMMPS locally. First, you need to get your Github files organized. Organizing your files includes creating a local directory for Github, creating a fork of LAMMPS on Github, and then cloning this fork to the local directory that you made. Create a new branch of your forked LAMMPS for each type of LAMMPS installation you want to have.

## VS Code

Running LAMMPS in VS Code requires you to be able to run C++ programs. The first step to achieve this is to make sure you have the CMake extension installed in VS Code. CMake should have its own versions of things for python, LAPACK, etc., but it can be more efficient to install your own versions of MPI, fftw, python, and LAPACK installed. On a Mac with Homebrew installed, this can be achieved using the command line argument `brew install ...`. On other systems you should use the relevant package manager (likely yourself). Another useful package to install is `ninja`, a build system that acts as another (better?) interface for CMake.  

Once you have installed these packages, open the local LAMMPS branch that you made. Open the command palette using `CMD+SHIFT+P` on a Mac or `CTRL-SHIFT-P` on a Windows or Linux OS. The command palette is a way to quickly find and execute commands. We want to use it to configure our CMake. The first time you do this, VS Code should prompt you for a 'Kit' to use, choose one or let it choose for you. If you run into errors on this step, make sure everything if up to date. I needed to use the command `brew upgrade` and do a few things so that completed without errors before I was able to successfully build LAMMPS. After doing this, you should have a `build` folder and a `.vscode` folder populated with some files.

Edit the Cache Editor so you are using your desired lammps settings and click `CMake: [Debug]` on the bottom of the screen to reinstall. You should now be able to hit `build`. Once LAMMPS is done building, you should have a build folder with a `lmp` executable. To start lamps with the desired input/output files with the touch of a button, our last step is to create a `launch.json` file in the `.vscode` folder. This file should be created automatically using the process in the "Run and Debug" tab. However, we haven't figured out why the GDB debugger doesn't show up as an option. A workaround is to create the file by hand and then hit the "Add Configuration" button.