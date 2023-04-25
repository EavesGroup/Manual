---
layout: page
subheadline:  ""
title:  "Revise"
teaser: ""
categories:
    - Julia
tags:
    - Julia
    - usefulPkgs
header: no
breadcrumbs: true
author: sinalewis
---

`Revise.jl` is a useful package that allows you to restart the Julia REPL less often. As the [GitHub README](https://github.com/timholy/Revise.jl) states,

> With Revise, you can be in the middle of a session and then update packages, switch git branches, and/or edit the source code in the editor of your choice; any changes will typically be incorporated into the very next command you issue from the REPL. This can save you the overhead of restarting Julia, loading packages, and waiting for code to JIT-compile.

To get the full effect of the package, it is recommended that users add the line `using Revise` to their `.julia/config/startup.jl` file. 