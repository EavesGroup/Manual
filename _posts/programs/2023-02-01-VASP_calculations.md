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
    - charge-density
header: no
breadcrumb: true
authors:
    - sinalewis
    - peytoncline
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

**Useful Tags**

- ISTART = 1 (read from existing WAVECAR)
- ICHARG = 1 (read from existing CHGCAR)
- LWAVE = F (don't waste time writing an unchanged WAVECAR)
- LCHARG = F (don't waste time writing an unchanged CHGCAR)

In Peyton's experience, it is best to use ISMEAR equal to `-5`, the tetrahedron method with Blöchl corrections, for calculating the charge density for density of state calculations. This value of ISMEAR is better for catching fine details in the spectrum. It is important to note that `ISMEAR = -5` can only be used if you have four or more k-points and should never be used to relax the structure of a metal.

#### Checklist

-

### Bandstructure

**Useful Tags**

- ISTART = 1
- ICHARG = 11
- LWAVE = .FALSE.
- LCHARG = .FALSE.

#### Checklist

- Copy CHGCAR from converged run with `ISMEAR=0`
- Set `ICHARG = 11` in the INCAR
- Change KPOINTS file
  - 2nd line $\rightarrow$ number of points per line
  - 3rd line $\rightarrow$ line mode
  - 4th line $\rightarrow$ fractional or cartesian coordinates
  - remaining lines $\rightarrow$ path through the Brillouin zone
-

Unlike the density of states, calculating the charge density for a bandstructure calculation should be done with `ISMEAR = 0`, which is Gaussian smearing. It is highly likely that you used this setting for your convergence so you can pull the necessary files from there instead of repeating a calculation.

For this setting make sure that `LWAVE = .FALSE.` so that the WAVECAR is not written. Because of the settings we use, the printed WAVECAR will be junk anyways so we can save time and space by not printing the large WAVECAR.

To create the bandstructure you need to know the high-symmetry points of your system's Brillouin zone. First, identify the space group of system (point group given by VASP plus the Bravais lattice). [This link](https://www.staff.ncl.ac.uk/j.p.goss/symmetry/index.html) provides one way of helping identify the space group once you have the point group and Bravais lattice. [This site](https://www.cryst.ehu.es) can then help identify the fractional coordinates of the k-points of high symmetry points ($\Gamma$, M, K, $\Lambda$, etc.). Alternatively, you may find the [paper](https://doi.org/10.1016/j.commatsci.2010.05.010) by Setyawan and Curtarolo helpful or you may want to use [this tool](https://www.materialscloud.org/work/tools/seekpath), but doublecheck the results.[^1] After you decide the path you want to take, enter the fractional coordinates into the KPOINTS file.

[^1]: Setyawan, W. and Curtarolo S. *High-throughput electronic band structure calculations: Challenges and tools*, [Computational Materials Science (49)2 299-312 **2010**](https://doi.org/10.1016/j.commatsci.2010.05.010)

### Partial Charge Density

**Useful Tags**

- LPARD = T (tell VASP you want to calculate the partial charge density)

- ISTART = 1 (read from existing WAVECAR)
- ICHARG = 1 (read from existing CHGCAR)
- LWAVE = F (don't waste time writing an unchanged WAVECAR)
- LCHARG = F (don't waste time writing an unchanged CHGCAR)

- NBMOD = -3 (energy range is relative to the Fermi energy)
- EINT = minE, maxE (narrow range around HOMO/LUMO or entire conduction band or valence band for example)

- LSEPB (boolean, write each band contribution to its own file)
- IBAND (specify which bands you are interested in, leave out if all)
- LSEPK (boolean, write each k-point contribution to its own file)
- KPUSE (specify which k-points you are interested in, leave out if all)

#### Checklist

- Copy CHGCAR and WAVECAR from converged run
- Set `KPAR = 1` or the calculation will crash due to `KPAR > 1` not being implemented
- Set `ISTART=1; ICHARG = 1` in the INCAR
- Set `LPARD = .TRUE.` in the INCAR
- Specify some combination of `EINT`, `IBAND`, and `KPUSE`

The partial charge density can be useful to see a visualization of where the charge is localized over a given energy range, band, and/or k-points. The resulting primary file from this calculation, the PARCHG, can be dropped into VESTA where you can specify an 'isosurface', which the wiki defines as a constant current image. The units of this isosurface can be tricky to define. The units of the PARCHG are electron density * unit cell volume, i.e. number of electrons.

Digging through the VASP code, a comment defines the partial charge as

$$ \rho(r) = \sum_{nk} \phi_{nk}(r)\phi_{nk}^*(r) f_{nk} $$

where $\phi_{nk}(r)$ is the psuedo-wavefunction of band $n$ and k-point $k$ at position $r$ and $f_{nk}$ is the Fermi occupation of band $n$ and k-point $k$. In a partial charge calculation, these Fermi occupations are used primarily as a step function to focus the sum on the requested energy interval, bands, or k-points. When requesting a specific energy interval, the VASP code does a loop over every band and k-point and checks if the eigenvalue of the psuedo-wavefunction at that point is within the range of interest. If this check statement returns true, the eigenvalue of $\phi_{nk}$ is within the range, it sets the corrersponding Fermi occupation $f_{nk}$ to one and sets it to zero otherwise. More mathematically, it obtains $E_{nk}$ as defined by the Schrödinger equation

$$ \mathcal{H}\phi_{nk}(r) = E_{nk}\phi_{nk}(r) $$

and asks `minE`$< E_{nk} <$`maxE ?` $f_{nk} = 1$ `:` $f_{nk}=0$.

An integral over the entire unit cell $\int \rho(r)dr$ should return the number of electrons, but because of missing weight factors across k-points and energy bands this is not quite the case. Along an isosurface $\Omega$ of 0.1 for example, we are saying $\rho(r\in\Omega) = 0.1$.
