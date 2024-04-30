---
layout: page-fullwidth
title:  "VASP Input Files and Flags"
teaser: "VASP has four main files that are required for any calculation and numerous flags that can be changed. This list is not exhaustive, but demonstrates some of the most common ones."
categories:
    - programs
    - VASP
tags:
    - VASP
    - input
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

## SBATCH File

The `sbatch` file is used to submit your calculation to slurm---the cluster management, job scheduling system. An example sbatch file designed for VASP is included in the [Appendix Code Database]({{ site.url }}{{ site.baseurl }}/appendix/code#vasp-sbatch-file). The most common settings that will need to be changed are located at the beginning of the file in blue. Available options for these settings can be found in the CU Research Computing [documentation](https://curc.readthedocs.io/en/latest/running-jobs/job-resources.html).

The first setting in the sbatch file defines the account information. We primarily want to use the group account, which you need to be added to by the manager of the allocation. The general account `ucb-general` has limited availability, but is good for when you are starting out running jobs on CURC.

The next setting specified is the quality of service (QOS). This setting defines the maximum walltime, maximum number of jobs per user, and node limits. We use the `condo` QOS.

The number of `nodes`, `ntasks-per-node`, and `ntasks-per-socket` lines can be used to improve job efficiency. Typically, only `ntasks-per-node` should be used on Alpine.  The number of nodes `nodes` is given in a minimum--maximum format. If the minimum and maximum are the same it will force the job to run only when the requested number of nodes are available. This forcing the number of nodes is more efficient because a lot of parallelization options you have available in VASP depend on knowing the number of nodes you're planning to use. `ntasks-per-node` defines the number of tasks you want to run on a node. The number of tasks is effectively equivalent to the number of cores. If you want to use only half a node, one socket, this quantity should be set to 32 (on Alpine). If you want to use fewer than a socket it should be less than 32. If you are using more than one node it should be set to a multiple of 64, which is the total number of cores on a node. The final option, `ntasks-per-socket`, defines the number of tasks that should be run per socket. This setting, like `ntasks-per-node`, defines the number of tasks you want to run on a socket, which consists of 32 cores. If `ntasks-per-node` is equal to or less than 32 then `ntasks-per-socket` should be the same value. Otherwise it should be set to 32 to ensure that the work load is balanced. Please consult the CURC [documentation](https://curc.readthedocs.io/en/latest/clusters/alpine/alpine-hardware.html) for the most up to date information.

| number of nodes | ntasks-per-node | ntasks-per-socket |
| :-------------: | :-------------: | :---------------: |
| n < 1 | number of desired cores, less than 32 | same as ntasks-per-node |
| 1 | 32 | 32 |
| n > 1 | 64*n | 32 |

Table: Guidlines on how to set the number of nodes, the ntasks-per-node, and the ntasks-per-socket.

## POSCAR

The POSCAR is the input file that specifies the geometry of the lattice and the position of the atoms for the calculation. A general POSCAR for various systems can be found on the VASP wiki under [examples](https://www.vasp.at/wiki/index.php/Category:Examples). The structure of the file will be explained in this section.

The first line of the file is a comment line. I recommend using it to note the name of the system or characteristics about it. For example, if the POSCAR file describes a face centered cubic cell of silicon that hasn't been optimized, you might write `fcc Si #####unoptimized`.

The second line of the file specifies a scaling factor for the lattice vectors and atomic coordinates. It is mine and Peyton's preference to define the lattice so that the scaling factor is $1$. This choice results in the rest of the POSCAR being a little more human readable. The wiki states that if the second line is negative it is interpreted as the total volume of the cell. I have never used this option and it wasn't mentioned by Peyton, so I imagine its utility is rare.

The third through fifth line define the lattice vectors. For a cubic unit cell with unit length vectors, these lines would look like

```bash
    1.000000000000000 0.000000000000000 0.000000000000000
    0.000000000000000 1.000000000000000 0.000000000000000
    0.000000000000000 0.000000000000000 1.000000000000000
```

where I have included 15 digits after the decimal place because this is the precision used by VASP. This precision is important to keep in mind because it may effect the ability of the program to identify the symmetry of the system if you specify too few digits.

The sixth line is optional according to Peyton and specifies the type and order of the atoms. The VASP wiki doesn't say this line is optional and it is definitely highly recommended by Peyton. Without this line, visualization programs won't know what species each atom is and will visualize them all the same way. Additionally, the POSCAR is more human readable as well since it will tell you what atoms are meant to be in the file. Note that you can repeat atom species in this line, which can enhance readability. For example, for a methylammonium molecule you might want to write a line that looks like `C H N H`. This format lets someone looking at the file identify that there are two groups of hydrogen atoms, perhaps one group is bonded with carbon and the other group is bonded to nitrogen.

The seventh line specifies the number of atoms per species. This line would match the order of the sixth line. For the above methylammonium molecule this line would be `1 3 1 3`.

The next line is an optional tag for selective dynamics, which we rarely use. If selective dynamics aren't requested then this line is instead a tag specifying whether the atomic positions are given in direct or cartesian coordinates. If selective dynamics are requested then this direct/cartesian specification is pushed to the next line. Direct coordinates can also be called fractional coordinates since they are given in terms of the lattice vectors. The coordinates of an atom in the middle of the box would be given as `0.5 0.5 0.5` in direct coordinates, no matter the size of the box.

The rest of the file is a list of the atomic positions followed optionally by the initial velocities. There should be three coordinates for each atom and one atom per line. In direct coordinates, an atom in the middle of the box would be given as `0.5 0.5 0.5`, no matter the size of the box. See the VASP wiki [POSCAR](https://www.vasp.at/wiki/index.php/POSCAR) page for more details and examples.

Historically, a calculation returns a file called the CONTCAR. This file contains the lattice vectors and atom positions of the system at the end of a run. In a static calculation this should be identical to the POSCAR, although historically VASP would convert direct coordinates to cartesian coordinates and scale everything so the scale factor becomes 1.

## POTCAR

The POTCAR is the input file that specifies the psuedopotentials that you want to use for each atom species. LDA and PBE type POTCARs are available with the VASP download files in specific zip files. There are often multiple potentials for each atom species. The standard potential will be in a folder labeled solely by the name of the atom. GW potentials have `_GW` appended to the name of the atom. There are then sometimes folders with additional suffixes such as `sv` and `pv`. These suffixes denote the fact that the $s$ and $p$ semi-core states are, respectively, treated as valence states. You probably only need to use these POTCARs with additional valence electrons if you are doing something crazy.

Hydrogen has numerous versions. Some are simply the GW or hard/soft psuedopotentials but there are also many with a number appended on the end. These are psuedo-hydrogens. Psuedo-hydrogens can be very useful for passivating surfaces or mimicking ligands.

Once you have decided what potentials are appropriate for the simulation you want to run, you want to concatenate the POTCARs in the same order that the atoms are given in the POSCAR file. For example, if you want to use the standard PBE potentials for the methylammonium example given earlier, you would type in one line, while located in the folder you want to run your simulation from,

```bash
    cat $VASP_DIR$/PBE/C/POTCAR $VASP_DIR$/PBE/H/POTCAR
        $VASP_DIR$/PBE/N/POTCAR $VASP_DIR$/PBE/H/POTCAR >> POTCAR
```

where `$VASP_DIR$` is the path to where you installed VASP and the psuedopotentials. Since the command `>>` appends the contents of these files to the new file named POTCAR, it's wise to ensure that the POTCAR file doesn't already exist. It's best practice to also check the contents of the POTCAR file afterwards by typing `grep TITEL POTCAR`. This will display on your screen every line in the POTCAR with the phrase TITEL. Since TITEL gives the title of the POTCAR following it, you want this output to match the content and order of your POSCAR file.

Aside from this concatenation, you will almost never edit the contents of a POTCAR file. However, some useful values to note are the ENMIN/ENMAX values and occasionally the POMASS value. The ENMIN/ENMAX values define the absolute minimum and default maximum energy cutoffs respectively. When defining the planewave energy cutoff in the INCAR file---ENCUT---you never want to go below the ENMIN value and a good rule of thumb is to be at least 1.3 times the default (ENMAX) value for publication quality results. When you have multiple POTCARs, you want to treat the smallest ENMIN as your minimum and the largest ENMAX as your default. However, generally you don't want ENCUT to exceed the ENMAX of any potential by too much.

If you are not running a GW calculation you can still use the GW psuedopotentials. These are identical to the standard versions if you don't do a GW step. However, Peyton has found that sometimes the GW potential provides better or faster convergence than the standard potential. If you are having trouble with one type of potential it can be valuable to test the other one. Peyton has not tried mixing GW and standard POTCARs for different atoms, so either use all standard, all GW potentials, or try to mix and match at your own risk.

## KPOINTS

The KPOINTS file is the input file that specifies the type and number of Bloch vectors used to sample the Brillouin zone. Converging the number of KPOINTS is one of the necessary tasks for obtaining an accurate calculation. The KPOITNS is structured as follows.

The first line is a comment line. This can be used as a throwaway line or as a way to remind yourself about why you've chosen a particular k-point mesh. The second line is where you can specify the number of k-points. Use the number zero if you want the program to calculate this automatically.

For a specific number of k-points, the third line defines the coordinate system as either Cartesian or fractional/reciprocal. The remaining lines contain the coordinates and weight of each k-point.

For an automatic generation of k-points, the third line specifies the center of the mesh as either gamma-centered or Monkhorst pack. The next line is then the number of subdivisions along the 3 reciprocal lattice vectors. For an odd number of subdivisions, the two schemes are the same. Different people have their preferences and opinions about what kind of k-point mesh is better. In my and Peyton's experience you typically want to use a gamma-centered mesh with odd subdivisions. This choice tends to align better with the symmetry of your systems. The VASP wiki [KPOINTS](https://www.vasp.at/wiki/index.php/KPOINTS) page has good guidelines on the relative size of the subdivisions based on the geometry of your Bravais lattice. The fifth line in the file is an optional shift of the k-point mesh. I have never seen a reason to shift this mesh and always see it set to `0 0 0`.

## INCAR

The INCAR is where the majority of the calculation settings are defined. The list of settings to play with is exhaustive and can be seen in the OUTCAR of any calculation. This section will outline only the most common parameters that Peyton has used and has some insight about. It is best to sort the INCAR file by grouping settings with similar functions. The following subsections follow this format.

### Startup

##### [ISTART](https://www.vasp.at/wiki/index.php/ISTART)

Defines if the job should start from scratch or use the wavefunctions from a previous job that are stored in the WAVECAR\index{WAVECAR}. It's best to set `ISTART = 0`, which is a clean start with random wavefunctions. The default of ISTART is already 0 if a WAVECAR doesn't exist in the folder. But the default is 1 if a WAVECAR does exist. Preemptively setting `ISTART = 0` prevents an accidental restart if a WAVECAR exists in the folder. See the VASP wiki for all the ISTART options.

##### [ICHARG](https://www.vasp.at/wiki/index.php/ICHARG)

Defines how the job should construct the initial charge density. If ISTART is set to zero, the default is `ICHARG = 2`, which takes the superposition of atomic charge densities. If ISTART is anything else, the default for ICHARG is 0, which calculates the charge density from the initial wave functions. Like ISTART, I recommend manually setting ICHARG equal to 2 so that any other behaviour is intentional. See the VASP wiki for all the ICHARG options.

### Electronic Relaxation

##### [ISMEAR](https://www.vasp.at/wiki/index.php/ISMEAR)

Determines how the partial occupancies $f_{n\mathbf{k}}$ are set for each orbital. The default is `ISMEAR = 1`, which uses the method of Methfessel-Paxton scheme of order 1. As noted in the wiki, the Gaussian smearing method---`ISMEAR = 0`---is good for most cases. Using `ISMEAR = -5` during geometry optimization can result in strange forces in metallic systems.

##### [SIGMA](https://www.vasp.at/wiki/index.php/SIGMA)

Determines the width of the smearing used in setting the partial occupancies. The default is `SIGMA = 0.2`. For something like silicon, 0.05 is a better value. For semiconductors, a good value is $\approx$ 10% of the band gap. Note that most of the information about SIGMA and how it should be set for various materials is on the ISMEAR wiki page. A good sanity check for the value of SIGMA is the size of the `entropy' contribution to the energy of the system. For an appropriate SIGMA, the energy without entropy and the energy as sigma goes to zero will match in the OUTCAR for a converged run.

##### [IALGO](https://www.vasp.at/wiki/index.php/IALGO)

Determines the algorithm used to optimize the orbitals. The default for VASP 4.5 and up is 38, which is a blocked-Davidson algorithm. According to Peyton, this is a good default that doesn't usually need changed. Note that the VASP wiki recommends setting the algorithms via the ALGO tag. Peyton noted that some people in the literature really prefer the RMM-DIIS setting---`IALGO = 44-48`.

##### [ENCUT](https://www.vasp.at/wiki/index.php/ENCUT)

##### [EDIFF](https://www.vasp.at/wiki/index.php/EDIFF)

Determines when the electronic self-consistent loop is complete. The relaxation of the electronic degrees of freedom are stopped when the total free energy change and the band-structure-energy change between two steps are smaller than EDIFF. The default value is `EDIFF = 1e-3`. A value of 1E-9 is pretty strict, especially for a convergence run.

##### [NELM](https://www.vasp.at/wiki/index.php/NELM)

Determines the maximum number of electronic self-consistency steps the calculation should run. This setting is useful in conjunction with NELMIN if you want to ensure all your efficiency testing calculations are similar. The default NELM value is 60. The VASP wiki states that normally if the self-consistency step does not converge within 40 steps it will not converge at all.

##### [NELMIN](https://www.vasp.at/wiki/index.php/NELMIN)

Determines the minimum number of electronic self-consistency steps the calculation should run. This setting is useful in conjunction with NELM if you want to ensure all your efficiency testing calculations are similar. The default value is 2. For molecular dynamics or ionic minimization the manual recommends increasing this to a value between 4 and 8.

### Ionic Relaxation

##### [ISIF](https://www.vasp.at/wiki/index.php/ISIF)

Determines if or how the geometry is updated. The default for `IBRION = 0` is `ISIF = 0`. This setting calculates the forces and allows the positions to change but doesn't calculate the stress tensor or change the cell shape or volume. If IBRION is not equal to zero, the default for ISIF is 2. `ISIF = 2` adds the calculation of the stress tensor. See Section~\ref{sec:convergence} for how to use different ISIF settings to converge the cell volume.

##### [IBRION](https://www.vasp.at/wiki/index.php/IBRION)

Determines how the ion positions are updated and moved. The default is `IBRION = -1`---no position update---if the maximum number of ionic steps is set to -1 or 0. Otherwise, the default is `IBRION = 0`, which does molecular dynamics. When Peyton needs the ions to move, he uses `IBRION = 2`---ionic relaxation with conjugate gradient algorithm---aside from extenuating circumstances.

### Forces

##### [EDIFFG](https://www.vasp.at/wiki/index.php/EDIFFG)

Determines when the ionic relaxation is complete. If EDIFFG is positive the value is interpreted as the maximum change of the total energy between ionic steps. If EDIFFG is negative the value is interpreted as the maximum size of the forces. The default value is `EDIFFG = EDIFF x 10`. A value of -1E-6 is very strict and you may want to step it down to this value over many calculations.

##### [PREC](https://www.vasp.at/wiki/index.php/PREC)

Specifies the ``precision" mode. This mode determines the defaults for four other sets of parameters. Peyton says that the only reason to use `PREC = NORMAL` is for a molecular-dynamics calculation. Otherwise, you want to use `PREC = Accurate`.

### Density of States

### Read/Write Flags

### Misc

##### [IDIPOL](https://www.vasp.at/wiki/index.php/IDIPOL)

For IDIPOL=1-3, the dipole moment will be calculated only parallel to the direction of the first, second or third lattice vector, respectively. The corrections for the total energy are calculated as the energy difference between a monopole/dipole and quadrupole in the current supercell and the same dipole placed in a super cell with the corresponding lattice vector approaching infinity. This flag should be used for slab calculations.

For IDIPOL=4 the full dipole moment in all directions will be calculated, and the corrections to the total energy are calculated as the energy difference between a monopole/dipole/quadrupole in the current supercell and the same monopole/dipole/quadrupole placed in a vacuum, use this flag for calculations for isolated molecules.

##### [LDIPOL]()

LDIPOL is a tag related to IDIPOL that controls whether or not the calculated dipole moment affects only the correction for the total energy (`LDIPOL = FALSE`) or is also added to the forces and ...

##### [IVDW](https://www.vasp.at/wiki/index.php/IVDW)

IVDW is the tag that determines whether van der Waals corrections are calculated and added to the potential energy, interatomic forces, and stress tensor. These corrections are ad-hoc and do not add much time to your calculation unless you choose to use IVDW equal to 4, 202, 21 or 2`20. For these four options you are better off using a self-consistent approach instead. Typically`IVDW = 11` (DFT-D3) or `IVDW = 12` (DFT-D3 with Becke-Jonson damping) are good choices. `IVDW = 13`, or DFT-D4, requires an extra package and is not much improved over the DFT-D3 options. In contrast, the difference between DFT-D3 and DFT-D2 is very large.

Van der Waals corrections are primarily important when you need to attach a molecule to a surface. This can be demonstrated with a silicon cell. Without van der Waals corrections the calculated size of the conventional cell of Si is 5.47 $\overset{\circ}{A}$. This is in line with PBE overestimating lattice constants and is not too far off the actual value of 5.43 $\overset{\circ}{A}$. However, small errors in the bulk cell are magnified when cut into a surface\index{surface} slab. Therefore, if you know you are going to convert your bulk system into a surface it is best to include van der Waals corrections for all your convergence testing.

##### [ISYM](https://www.vasp.at/wiki/index.php/ISYM)

Determines how symmetry is treated within the calculation. By default---unless one uses ultrasoft psuedopotentials or `LHFCALC = .TRUE.`---VASP utilizes a memory conserving symmetrization of the charge density. Symmetry can be turned off completely by setting `ISYM = -1`, but this is not recommended unless one is trying to look at noncollinear magnetic effects. If you want to change how VASP uses symmetry you will more frequently  use `ISYM = 0`. This setting turns off symmetry except when calculating the wavefunction, $\psi_k = \psi_{-k}^*$. The VASP manual says that this value should be used for molecular dynamics\index{molecular dynamics}. You should also turn off the symmetry (`ISYM = 0`) when you are attaching a molecule to a surface. Sometimes you are able to shift your molecule and unit cell to preserve some sort of symmetry--such as planar symmetry. However, if you are not sure then you should turn symmetry off. Otherwise you may find weird results because VASP is trying to enforce a symmetry that doesn't exist. This is an \textbf{\textit{IMPORTANT}} setting to track. You do not want to publish results where you are accidentally enforcing nonexistent symmetry.

##### [LHFCALC](https://www.vasp.at/wiki/index.php/LHFCALC)

Specifies whether Hartree-Fock/DFT hybrid functional type calculations are performed.

##### [ISPIN](https://www.vasp.at/wiki/index.php/ISPIN)

Determines whether or not a spin polarized calculation is performed. The VASP wiki page is relatively sparse on the details of where this is useful. A forum page answer says that if you're trying to do this for a compound with small local magnetic moments, then it may be a clever choice to first do the optimization using a non-magnetic setting and then complete it with a a fully spin-polarized one (ISPIN=2). On the other hand, if you're working on strongly correlated materials containing high spin-multiplicity elements such as 3d transition metals or rare-earth f-electron elements such as Sm, Eu or Gd, you may never get a converged solution using ISPIN=1. The reason is, such localized states want to obey Hund's exclusion rule and get spin-polarized which obviously can't be fulfilled with this setting. As a result, they keep fluctuating around the Fermi-level, leading to instabilities or even divergence in the SCF loop.

##### [NUPDOWN](https://www.vasp.at/wiki/index.php/NUPDOWN)

Allows calculations for a specific spin multiplet, i.e. the difference of the number of electrons in the up and down spin component will be kept fixed to the specified value. There is a word of caution required: If NUPDOWN is set in the INCAR file the initial moment for the charge density should be the same. Otherwise convergence can slow down. When starting from atomic charge densities (ICHARG=2), VASP will try to do this automatically by setting MAGMOM to NUPDOWN/NIONS. The user can of course overwrite this default by specifying a different MAGMOM (which should still result in the correct total moment). If one initializes the charge density from the one-electron wavefunctions, the initial moment is always correct, because VASP "pushes" the required number of electrons from the down to the up component. Initializing the charge density from the CHGCAR file (ICHARG=1), however, the initial moment is usually incorrect!

If no value is set (or NUPDOWN=-1) a full relaxation will be performed. This is also the default.

### Parallelization

##### [KPAR](https://www.vasp.at/wiki/index.php/KPAR)

Tells VASP to determine treat some number of k-points in parallel. "To obtain high efficiency on massively parallel systems or modern multi-core machines, it is strongly recommended to use [KPAR and NCORE] at the same time." A group of $N=(number of cores / KPAR)$ compute cores work together on an individual k-point. If the number of cores is not divisible by KPAR, VASP will change KPAR to the default value of 1. Within the group of cores working on each k-point, there is additional parallelization of the bands or plane waves handled by `NCORE` or `NPAR`.

The value of KPAR greatly influences the amount of memory required by the calculation. If you are running into out of memory problems, you can try and reduce the value of KPAR as noted in the [VASP wiki](https://www.vasp.at/wiki/index.php/Not_enough_memory)

##### [NCORE](https://www.vasp.at/wiki/index.php/NCORE)/[NPAR](https://www.vasp.at/wiki/index.php/NPAR)

NCORE and NPAR have been grouped because they are related and you should set only one of them. NPAR determines the number of bands that are treated in parallel and is considered deprecated as of VASP.5.2.13. NCORE determines the number of compute cores that work on each individual orbital. They are related by the equation $NCORE = number of cores/KPAR/NPAR$. The recommended value of NCORE is the number of cores per compute node (64 on Alpine, possibly better to use the number of cores per socket which is 32).

Like the KPAR setting, NCORE and NPAR influence the memory requirements. A smaller NCORE value will increase the amount of memory required per core, while NPAR has the inverse behaviour.
