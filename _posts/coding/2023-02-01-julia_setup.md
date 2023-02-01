---
layout: page-fullwidth
subheadline:  ""
title:  "Setting up Julia"
teaser: ""
categories:
    - Julia
tags:
    - Julia
    - setup
header: no
breadcrumbs: true
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

## Installing Julia

### Jupyter

[Jupyter](https://jupyter.org/about) is an open-source project developed on GitHub that has numerous tools that make it easy to dive into coding with Julia, Python, C++, and numerous other languages. The two main tools are [JupyterLab](https://docs.jupyter.org/en/latest/start/index.html#id3) and [the Jupyter Notebook](https://docs.jupyter.org/en/latest/start/index.html#id2). The JupyterLab interface provides close to a full IDE experience hosted entirely online. It can integrate terminals, text editors, and Jupyter notebooks for various documents and activities. The Jupyter Notebook is an online Mathematica-esque document-oriented interface. It's useful to simple projects or if you want to just play around with a language for a bit. Because its focus is integrating code with its output, documentation, images, etc. it's not the best for creating full coding projects but can work well for snippets or if you're just testing things out.

A lot of introductions to Julia will use Jupyter notebooks to provide examples or allow the viewer to follow along. I include it as an option here for this reason only. In my experience it is not an ideal interface for building larger code projects.

### Get Julia

The first step of coding in Julia in any other environment is to download the language from the [website](https://julialang.org/). This step is typically very straightforward and instructions are given on the website for most typical operating systems. Once you have downloaded, installed, and pathed Julia you should be able to start a REPL from the terminal by simply typing `julia`. 

### Install Your IDE

After you have Julia available on your device you can theoretically begin to start coding using your favorite text editor. However, an IDE can provide a nicer environment with functionality like autocomplete, code formatting, GitHub integration, etc. Currently (Jul. 2022) [VS Code](https://code.visualstudio.com/) is the officially supported IDE for Julia. Simply download and install VS Code, then add the Julia language extension. You should be able to use `SHIFT+ENTER` to run individual lines of code within a file. Or open a terminal (`CTRL+SHIFT+\``) and type Julia to open a REPL.

## Starting a New Project

Julia uses modules 

### Using a Template

Getting a new project started in Julia can be a little tricky if you want to use a template and upload it to GitHub. There are a few steps you want to make sure you do in the correct order, or you'll need to restart.

You can start by creating a new repository on GitHub. It's important to make sure the repository name ends `.jl`, or we won't be able to push the project that we made with the template. Don't initialize the repository with anything, the template will take care of that.

Start up Julia in a terminal. This can be a local terminal or within your IDE of choice. Using the package manager, accessed by pressing the `]` key, add the package PkgTemplates. Back in the main environment, accessed by pressing backspace so that the line reads `julia>`, we want to tell Julia we want to use the package PkgTemplates. Once we do this we can assign a template object. For this step we need to either have a Git username set locally or pass it to the template initializer. We can then use the template object to create a template.  Altogether this looks like
```julia
    julia> ]
    pkg> add PkgTemplates
    *press backspace*
    julia> using PkgTemplates
    julia> t = Template(user="git_username")
    julia> t("packageName.jl")
```
Make sure that the package name used in the last step matches the repository name on GitHub.

The last step is to connect the repository made on GitHub with the package just made locally. For this I use GitKraken, a desktop app for using Git. The process in GitKraken is to first open the local repository. It will be located at `~/.julia/dev`. Then, simply push the package to GitHub, and you're done!

## Components of Julia

Julia is focused around a few different buildings blocks. Some of the most important ones are the package, the environment, and the module.

### Packages

### Environments

Julia environments keep track of the different packages and their versions that you have added to a project. Typically, you want to load the environment of the project that you are working on when you start up Julia. To facilitate this you can add the following block of code to your `.julia/config/startup.jl` file.

```julia
using Pkg
if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end
```

### Modules

## Learning Julia

[JuliaAcademy](https://juliaacademy.com/courses/)