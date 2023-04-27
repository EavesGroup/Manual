---
layout: page-fullwidth
subheadline:  ""
title:  "VASP Misc. Tips and Tricks"
teaser: ""
categories:
    - programs
    - VASP
tags:
    - VASP
    - misc
header: no
breadcrumb: true
---
{% include mathjax.html %}

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

This chapter will collect various tips and tricks about VASP that don't fit neatly into any of the other chapters. If a particular section becomes long enough it may become it's own chapter.

### Psuedopotentials
While perusing the PBE psuedopotential folder you may notice that there are GW versions of some of the psuedopotentials. Peyton has found that the PBE and PBE_GW potentials are the same if you don't do a GW step. However, one might provide better/faster convergence than the other. If you are having trouble with one potential it can be valuable to test the other.

### Convergence

#### Cell Volume

If you want to do a calculation for a system that is relatively stiff (i.e. Si) you want to use the DFT ground state for your calcluations. The DFT ground state for the volume may differ from the experimental values by a few percent, but not too drastically. There are three primary paths for approaching volume relaxation: ISIF equals 3, ISIF equals 4, and a combination. This section will describe how these approaches work.

##### Iterative ISIF=3

The best way to relax the cell volume is to use ISIF equals 3, which allows all degrees of freedom to relax, with increasingly stricter force cutoffs (see [Inputs]({{ site.baseurl }}/programs/2023-02-01-VASP_inputs.md)). This iterative process can help us identify and avoid Pulay stress. A basic cell volume relaxation calculation might have the following INCAR
```bash
##
System = diamond Si

# startup
ISTART = 0

# electronic
ENCUT = 460 ; ISMEAR = 0
SIGMA = 0.025 ; EDIFF = 1e-9

# forces
EDIFFG = -1e-1 ; PREC = Accurate

# misc
NBANDS = 12 ; KPAR = 2

# relax
IBRION = 2 ; ISIF = 3
NSW = 1000
```

I have put a few commands on the same line-separated by a semicolon-to shorten the file length a bit. This also works in an actual input file but I don't recommend it. The most important parameter here is EDIFFG, which-when negative-defines the force cutoff for the calculation to stop (see [Inputs]({{ site.baseurl }}/programs/2023-02-01-VASP_inputs.md)]). In this example INCAR, EDIFFG is quite large because we want to slowly step down to the desired EDIFFG. Also note the `ISTART = 0` that is important for not reading in a previous WAVECAR. Because these calculations change the cell volume, reading in a previously calculated WAVECAR would be really bad.

For our first calculation we want to change the starting volume of the cell in the POSCAR to be away from equilibirum. By kicking the system out of equilibrium the calculation should be better able to find the actual minimum. Be careful while changing the volume to not effect the symmetry of the system. Run this system multiple times until the calculation only takes one step, i.e. the command `tail screen*`  returns a line that looks like `   1 F= XXX E0= XXX  d E =XXX` where the `XXX` are unspecified values. More explicitly, each time the run finishes, check the screen file and, if it took more than one step, copy the CONTCAR into the POSCAR and submit the job again. Peyton's script for submitting the jobs does this copying automatically.

After the calculation takes only one step we want to restric the forces more by updating EDIFFG from `-1e-1` to `-1e-2`. We then repeat the above steps, running the system mulitple times until the calculation takes only one step. Rinse and repeat until the system takes only one step with the desired EDIFFG.

Another way to use ISIF=3 to find the converged volume is to keep increasing ENCUT. The volume will change as we do this, which is a sign of Pulay stress. The cell is converged when the volume change is minimal.

##### ISIF=4

The ISIF equals 4 option allows most degrees of freedom to relax, but restricts the volume of the cell. We can use this option to find the ground state of the cell by running calculations at numerous volumes of the cell-using a negative value in the 2nd line of the POSCAR to specify the value-and then fitting to an equation of state. This method is the only sure way to remove all Pulay stress. The VASP manual recommends that the volumes don't differ more than 5--10\% to avoid errors introduced by basis set incompleteness. After we have a pair of volumes and their energies we can fit to an equation of state. A common choice is the Birch-Murnaghan equation of state
$$
\begin{equation}\label{eq:Birch-Murnaghan}	E(V) = E_0 + \frac{9V_0B_0}{16}\left\{ \left[\left(\frac{V_0}{V}\right)^{2/3} - 1\right]^3B_0' + \left[\left(\frac{V_0}{V}\right)^{2/3}-1\right]\left[6-4\left(\frac{V_0}{V}\right)^{2/3}\right] \right\}
\end{equation}
$$
where $$E_0$$ is the ground state energy, $$V_0$$ is the ground state volume, $$B_0$$ is the bulk modulus, and $$B_0'$$ is the derivative of the bulk modulus with respect to pressure.

##### Combination

The use of ISIF=4 is sensitive to the step sizes you take in sampling the volume and likely won't agree with a one-shot ISIF=3 calculation. To help get around this contradiction, you can do a finer scan between the ISIF=3 ground state volume and the ISIF=4 combined with the equation of state ground state volume.

#### Energy Cutoff and K-point Grids

##### ENCUT

VASP takes ENCUT as one of its parameters. This is the energy cutoff for the planewave basis set used. The default is 1.3 times the largest ENMAX used in the POTCAR. Typically however a larger ENMAX needs to be used. To test convergence, start with a value for ENCUT near the default and increment in steps of ~20 eV to a very large number such as 1000. In Si, 1000 was a high enough value to converge out Pulay stress. You want to test this range for a very small kpoint grid, such as 5x5x5 and a very large kpoint grid such as 21x21x21.

Note that if you use too large of an energy cutoff you will receive an error
```
    PSMAXN for non-local potential too small
```
Although the error suggests that you should change PSMAXN this is incorrect. In fact, you never want to change PSMAXN. Instead you should take this as a sign to decrease ENCUT. If you search this error you will also see suggestions to reorder the POTCAR files-and thus also the POSCAR-so that the atom with the highest ENMAX-also called the hardest atom-is first in the concatenated POTCAR.

Once the calculations have finished you can use Peyton's `checkE.sh` script to pull the energies from all of the different files into a nice list. Plot the energy vs ENCUT value. At one point you might start to see oscillations in the energy as ENCUT increases. These oscillations are due to corrections in the potentials. The converged ENCUT value is where the energy difference between the converged value and the next is less than your desired accuracy. For paper quality work this is something like 0.01--1 meV/atom.


##### K-points

The k-point grid tells VASP how densely you want to sample reciprocal space. Like ENCUT this value needs to be converged. Start with a small k-point grid, such as 2x2x2 and increase each dimension by 1 up to a very large k-point grid such as 30x30x30. Similarly to ENCUT you want to do this for both a very small ENCUT-around the default value-and for a very large ENCUT. Plot and find where the energy difference is about 0.01--1 meV/atom.

##### Dual Convergence

In the above sections, the other value was kept fixed and we aren't guaranteed to have found the best convergence for each parameter. To fix this, you want to go back and forth a bit on these calculations. Find the converged ENCUT value and then test the k-point grid again. Find the converged k-point grid and test ENCUT again.

If you plan to upscale to a surface structure, it is fine to be on the upper end of the 0.01--1 meV/atom energy range. It is better to start with somewhat `medium` aggressive convergence and see how things go when you upscale to a surface slab. You may find that you can increase the aggressiveness, but you'll save time and energy starting in about the middle. 

#### Efficiency

VASP parallelizes very efficiently, however, the user needs to test what combinations of settings and architecture are most effective. The user should strive to stay between 80% and 100% efficient, with 100% efficiency defined as the total CPU time of the fastest calculation. There is a lot of information available on the [VASP wiki](https://www.vasp.at/wiki/index.php/Category:Parallelization), but the most important settings are NCORE, KPAR, and NBANDS.

The NCORE setting tells the calculation how many compute cores should work on an individual orbital. Note that NPAR is a related setting that takes precedent over NCORE, but is deprecated as of VASP 5.2.13. NPAR is specialized to the specific calculation and requires more careful thought when transferring between systems. NCORE on the other hand is typically very straightforward to use. For any calculation using more than a node, NCORE should be set to the number of cores per socket. The VASP manual says that NCORE can be set up to the number of cores per node, but Peyton has run into issues when trying to set NCORE higher than the number of cores per socket. On Summit, the number of cores per socket is 12. For a small calculation where you are using less than a node, you can use a smaller NCORE such as 6, 4, 2, or even 1. Because of how NCORE works, it should always be set to a factor of the number of cores per socket.

The KPAR setting determines how many k-points should be treated in parallel. Because the k-points are assigned to the compute cores in a round-robin fashion, you want the number of irreducible k-points to be divisible by KPAR. Otherwise you will have some compute cores working on more k-points than the other compute cores, reducing the overall efficiency. For large calculations that have fewer k-points, the best setting is typically KPAR equal to the number irreducible of k-points so that each node is working on one k-point. For smaller calculations where you have many k-points, however, you may be forced to use the default value of KPAR, which is 1. For both situations, ensure that KPAR is a factor of the total number of the cores.

NCORE and KPAR work in slightly contradictory ways. NCORE helps with memory requirements while KPAR increases the memory requirements. Peyton's rule of thumb for these settings is to use `KPAR = # of k-points` and `# of nodes ≈ KPAR`. 

The general scheme for testing the efficiency of different settings is to start with the default KPAR and the minimum number of nodes allowed by your memory requirements. This run will give you a good general baseline 100% efficient run and will also let you find the number of irreducible k-points in your system. You can then start increasing NCORE and KPAR. Adding tags like NELMIN and NELM will ensure that your calculations are more consistent and provide a better baseline. In general, KPAR will be important for surface and defect calculations and less important for systems with less than 100+ atoms or bulk calculations. [Julia code used to compare the efficiency of NCORE and KPAR settings](https://sinalewis.github.io/VASP_postprocessing.jl/). A lot of the information provided in this section is also provided on [this](https://www.nsc.liu.se/~pla/blog/2015/01/12/vasp-how-many-cores/) web page.


### Bandstructures

Peyton brought up an excellent paper for finding paths to use to plot bandstructures.

### Workflow

- You can setup a job log to keep track of all the jobs you have done or are running.
- Use CTRL-r to reverse search your previous commands in the terminal.
- Use two pound signs at the top of your INCAR to color the comments.
- NEVER use tabs in a VASP input file. This will cause your program to crash or otherwise go awry.
- VASP is picky sometimes about empty lines. They are fine in the INCAR file but will cause your program to not run or run incorrectly if used incorrectly in the POSCAR or KPOINTS files.

### Errors

#### PSMAXN for non-local potential too small

#### killed by signal: 9

This error message means that your calculation requires more memory than is available on the number of nodes you are using.