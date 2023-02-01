---
layout: page-fullwidth
subheadline:  ""
title:  "Common Calculations in VASP"
teaser: ""
categories:
    - VASP
tags:
    - VASP
    - bandstructure
    - density-of-states
    - surfaces
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

### Surfaces

### Density of States

In Peyton's experience, it is best to use ISMEAR equal to `-5`, the tetrahedron method with Blöchl corrections, for calculating the charge density for density of state calculations. This value of ISMEAR is better for catching fine details in the spectrum. It is important to note that `ISMEAR = -5` can only be used if you have four or more k-points and should never be used to relax the structure of a metal.

#### Checklist

- 

### Bandstructure

Unlike the density of states, calculating the charge density for a bandstructure calculation should be done with `ISMEAR = 0`, which is Gaussian smearing. It is highly likely that you used this setting for your convergence so you can pull the necessary files from there instead of repeating a calculation.

For this setting make sure that `LWAVE = .FALSE.` so that the WAVECAR is not written. Because of the settings we use, the printed WAVECAR will be junk anyways so we can save time and space by not printing the large WAVECAR.

To create the bandstructure you need to know the high-symmetry points of your system's Brillouin zone. First, identify the space group of system (point group given by VASP plus the Bravais lattice). [This link](https://www.staff.ncl.ac.uk/j.p.goss/symmetry/index.html) provides one way of helping identify the space group once you have those two pieces. \href{https://www.cryst.ehu.es}{This site} can then help identify the fractional coordinates of the k-points of high symmetry points ($\Gamma$, M, K, $\Lambda$, etc.). Alternatively, you may find the paper by Setyawan and Curtarolo helpful.\cite{Setyawan.Curtarolo.2010.10.1016/j.commatsci.2010.05.010} After you decide the path you want to take, enter the fractional coordinates into the KPOINTS file.

#### Checklist

- Copy CHGCAR from converged run
- Set `ICHARG = 11` in the INCAR
- Change KPOINTS file
    - 2nd line $\rightarrow$ number of points per line
    - 3rd line $\rightarrow$ line mode
    - 4th line $\rightarrow$ fractional or cartesian coordinates
    - remaining lines $\rightarrow$ path through the Brillouin zone
- 