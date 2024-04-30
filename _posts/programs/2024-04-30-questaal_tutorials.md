---
layout: page-fullwidth
title:  "Questaal Tutorials"
categories:
    - programs
    - Questaal
tags:
    - Questaal
    - tutorials
header: no
breadcrumb: true
authors:
    - sinalewis
---
{% include mathjax.html %}
<div class="row">
<div class="medium-4 medium-push-8 columns" markdown="1">
<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
* TOC
{:toc}
</div>
</div><!-- /.medium-4.columns -->

<div class="medium-8 medium-pull-4 columns" markdown="1">

The questaal developers have made an extensive set of tutorials to follow. Below I have highlighted the tutorials workshopped at the 2024 workshop hosted at NREL.

## [Introductory lmf Tutorial](https://www.questaal.org/tutorial/lmf/si_calculation/)

"This tutorial provides a light introduction to running a self-consistent DFT calculation for silicon, using the main density-functional code in the Questaal suite, lmf."

## [Introductory QSGW Tutorial](https://www.questaal.org/tutorial/gw/qsgw_si/)

"This tutorial provides a basic demonstration of a quasi-particle self-consistent GW (QSGW) calculation. Theory for GW and QSGW, and its implementation in the Questaal suite, can be found in [references 1-5](https://www.questaal.org/tutorial/gw/qsgw_si/#footnotes-and-references)."

## [QSGW Tutorial for magnetic bcc Fe](https://www.questaal.org/tutorial/gw/qsgw_fe/#2-qsgw-calculation-for-fe)

"This tutorial describes how to make a QSGW self-energy, and draw energy bands for elemental Fe, a bcc metal.

Several tutorials build on this one, in particular the tutorial for the dynamical self-energy."

## [Making the dynamical GW self energy](https://www.questaal.org/tutorial/gw/gw_self_energy/#table-of-contents)

"The GW approximation makes a fully nonlocal $\Sigma(k,r,r′,\omega)$, and this tutorial describes how to construct and analyze it. The main utility used to analyze $\Sigma$ is lmfgws. Dynamical Mean Field Theory (DMFT) is a single-site approximation; it thus makes $\Sigma$ nonlocal in time but local in space. However its time-dependence is calculated to a higher level of theory than is done for the GW approximation. The DMFT package generates $\Sigma$ in a different way but, once created, can also use lmfgws to analyze it."

## [Extremal points and effective mass](https://www.questaal.org/tutorial/lmf/bandedge/)

"This tutorial demonstrates how to find extremal points (maxima, minima, and saddle points) in the Brillouin zone, and calculate effective masses using the band-edge utility. LDA silicon was chosen for simplicity, though it is a trivial example as its extremal points are found on high-symmetry lines. band-edge is particularly useful when searching for multiple extremal points, and/or points distinct from those of high symmetry."
