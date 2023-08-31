---
layout: page-fullwidth
title:  "Common Calculations in VASP"
teaser: ""
categories:
    - programs
    - VASP
tags:
    - VASP
    - bandstructure
    - density-of-states
    - surfaces
header: no
breadcrumb: true
authors:
    - sinalewis
    - peytoncline
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

### Geometry Optimization

#### Surfaces

**Useful Tags**
- selective dynamics (in the POSCAR)
- IDIPOL

Building and optimizing a surface is rather straightforward, but requires some careful testing to ensure that you are balancing efficiency and accuracy.

Any surface build should start with a well-converged bulk unit cell. Some tips and tricks on this procedure are detailed [here]({{site.baseurl}}/programs/vasp/VASP_tips-tricks/#convergence). After you have your bulk system, create a supercell and cut along the desired facet. From here you need to test if you have enough of a unit cell in the xy-plane, or direction of the plane of your surface, enough thickness in the z-direction, and enough vacuum.

The testing procedure for this cell volume and vacuum size is similar to when testing for the energy cutoff and k-point grid values. Keeping the other parameters fixed, gradually change one parameter and see how the energy changes (e.g. increase the unit cell thickness and check the energy/atom). Because we want to simulate the surface of a larger bulk material, *selective dynamics* is a useful tag. This tag allows us to freeze one or more layers of our surface in our converged bulk geometry. Because of the vacuum in the unit cell, we also need to include the IDIPOL=3 tag. The option 3 only includes corrections in the z-direction (the direction with vacuum). Note that there is also a tag LDIPOL. While IDIPOL is used for slab calculations, LDIPOL is important for charged molecules as well as molecules and slabs with a net dipole moment (see the [next section](#molecules-on-surfaces)).

[See for reference]({{site.urlfile}}examplesVASP/POSCAR_Si_surface.vasp) the Si(111) surface where the inner 2 layers have been frozen at bulk geometry.


#### Molecules on Surfaces

**Useful Tags**
- selective dynamics (in the POSCAR)
- NSW
- IDIPOL
- LDIPOL (in the last convergence step)

If you want a molecule on a surface, it is best to start as advised in the [last section](#surfaces) unless you are lucky and someone hands you a slab that they have already tested. In either case, once you have a good slab you need to add your molecule and then optimize the geometry.

Sometimes optimizing a molecule on a surface can be tricky, especially if it is in a very bad starting configuration. To speed up this optimization, start with a low force convergence and only allow the molecule atoms to move and only in the z-direction. After this step is complete, allow the molecule to move in all directions with a higher force cutoff. Finally, allow the molecule and surface atoms to move in all directions, potentially with the LDIPOL tag turned on. In all of these steps, be sure to have NSW set to some non-zero value, otherwise, nothing will happen.


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