---
layout: page-fullwidth
subheadline:  ""
title:  "Using Julia on a Supercomputer"
teaser: ""
categories:
    - Julia
tags:
    - Julia
    - summit
    - alpine
    - CURC
header: no
breadcrumbs: true
author: sinalewis
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

## Summit

### Installation

Julia can be very easy to install on Summit. The instructions can be found [here](https://julialang.org/downloads/platform/#linux_and_freebsd) and are repeated in this section. It is highly recommended that you install the official generic binaries from the downloads page using the following set of commands. These commands extract the latest version of Julia (1.8.0) into a directory named `julia-1.8.0`.

```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz
tar zxvf julia-1.8.0-linux-x86_64.tar.gz
```

After running these commands, you want to add Julia to your path, otherwise you'll need to specify the full path to where Julia is installed everytime. To add Julia to your path open your `~/.bashrc` or `~/.bash_profile` and add the line

```bash
export PATH=$PATH:/path/to/JuliaDirectory/bin
```

Don't forget to source your `.bashrc` or `.bash_profile` afterwards. You should now be able to start a REPL by calling `julia` anywhere in your system.

### Submitting a Job

- Add `using Pkg` and `Pkg.activate(".")` at the top of a dedicated `run.jl` file
- Don't use special characters in your code


### Pulling from GitHub



### Adding your own Packages

Unlike my experience locally, if you want to add a package of your own to you current environment `dev PackageName` doesn't work. Instead, you need to use the command `dev "git@github.com:user/PackageName.jl.git"`.