---
layout: page
subheadline:  ""
title:  "Plotting"
teaser: ""
categories:
    - Julia
tags:
    - Julia
    - plotting
header: no
breadcrumbs: true
author: sinalewis
---

The main Julia plotting package is `Plots.jl`. This package imports most plot commands that you need. However, `Plots.jl` is really what is called a metapackage, which means it acts as an interface for other plotting libraries. The plotting library is decided by changing the backend.

The use of `Plots.jl` as a metapackage allows the user to change the plotting library used in the background **without** changing their code. Various types of backends and their different pros and cons can be found [here](https://docs.juliaplots.org/latest/backends/#backends). The main plotting backgrounds are GR and Plotly/PlotlyJS. The GR backend can be set simply by executing the command `gr()`. GR is the default backend and is very fast and is constantly improving. If interactivity is desired, the backends Plotly and PlotlyJS are a good choice instead. These backends are very similar, but are treated as different options and have slightly different pros and cons. For example, Plotly has no dependencies. The JavaScript it requires is bundled in the `Plots.jl` package.  However, it only supports export to `png` file formats. PlotlyJS is the preferred option compared to Plotly, although the `JS` part, which stands for JSON, can reduce performance and this backend requires the user to first add the `PlotlyJS.jl` package to their environment. However, PlotlyJS supports more export formats such as EPS and PDF. To use Plotly execute the command `plotly()`. To use PlotlyJS execute the command `plotlyjs()` after adding `PlotlyJS.jl` to your environment.