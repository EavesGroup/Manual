---
layout: page-fullwidth
title:  "Making Julia Work"
teaser: ""
categories:
    - coding
    - Julia
tags:
    - Julia
    - debugging
header: no
breadcrumb: true
authors:
    - sinalewis
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

# Debugging

There are [a few different methods](https://julialang.org/blog/2019/03/debuggers/) available for debugging your Julia code. 

The option that provides the most control is the `gdb` like debugger enabled through the [package](https://github.com/JuliaDebug/Debugger.jl) `Debugger.jl`. Within VS Code, the Julia supported IDE, a debugging session can be started by adding `Debugger` to your environment (`Pkg.add("Debugger.jl")`), adding the line `using Debugger` to your code, and then hitting `F5`. I recommend commenting out the `using Debugger` line when you are done as I've run into minor performance issues in the past when leaving it in. In VS Code there is a `DEBUG CONSOLE` tab next to the terminal (opened with `CTRL-SHIFT-\``). This tab is where you can execute commands while at a breakpoint to manipulate variables and the behaviour of your code.