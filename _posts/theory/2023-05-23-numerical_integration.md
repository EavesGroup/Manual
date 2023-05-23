---
layout: page-fullwidth
title:  "Numerical Integration"
categories:
    - theory
    - MM
    - MM_Integral_Transforms
tags:
    - theory
    - page
    - math-method
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

{% include mathjax.html %}

Research in this group will inevitably confront the researcher with a numerical integral. What should be the immediate considerations? A few that probably came to mind are: (1) "Is the integrand measured or a known function?" and (2) "Is the integrand sampled uniformly?" The answers to these questions, in principle, shouldn't affect too much in terms of the choices we have available to us. In practice, however, there are only three methods in the SciPy library to evaluate, for example, an integral of an experimental time-series with uniform sampling rate. There is only one way in standard MATLAB. Being considerate about these details is crucial.

This section is a brief introduction to a few of the most common and successful methods in quadrature. Possible answers to both of the above questions are considered. At the end, there is lengthy discussion of how these methods can fail when attempting to apply them to singular integrals and what to do about it.

### Newton-Cotes

The one way to integrate uniform data in MATLAB is the trapezoidal rule. This algorithm falls under the class of Newton-Cotes formulas, which use increasingly complicated combinations of the values of the data at equally spaced points to approximate the integral. These formulas can either be "closed" and require evaluating the integral on the integration boundary, or "open". Either way, the integral is written:

$$ A\ =\ \int f(x) dx\ \approx\ \sum_i w_i f(x_i) $$

where $$w_i$$ are weights determined from an interpolating polynomial and $$f(x_i)$$ is the sampled function.