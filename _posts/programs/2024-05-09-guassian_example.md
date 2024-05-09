---
layout: page-fullwidth
title:  "Gaussian Example"
categories:
    - programs
    - Gaussian
tags:
    - Gaussian
    - computing
    - programs
header:  no
breadcrumb: true
authors:
    - sinalewis
---

To help familiarize the user with Gaussian, I have put together a page with all of the knowledge needed to run a simple calculation for anthracene.

Gaussian is installed as a module on the university's high performance computing (HPC) system, Alpine. See [the CURC page]({{ site.url }}{{ site.baseurl }}programs/CURC) if you are new to HPC. There are two files that are important for getting started: the input file and the sbatch file.

Although Gaussian can be run entirely within an interactive session (via the command 'acompile' followed by 'module load gaussian'), for multiple or longer jobs we want to submit it through a sbatch script. An [example sbatch script]({{site.url}}{{site.baseurl}}appendix/code#gaussian-sbatch-file) has been uploaded for reference. The majority of the file handles telling Slurm the requested details for running the calculation (length of time, account to use, number of nodes...) or moving files around to places convenient for running the calculation (e.g. so we don't run out of space in our project or home directory due to intermediate files). The most important lines specific to a Gaussian calculation are

```bash
module purge
module load gaussian

g16 <${JOBNAME}.in >${JOBNAME}.log
```

these lines, in order, clear any extraneous modules loaded on the CPUs to avoid any strange behaviour, load Gaussian so we can run the program, and then run the program with the details specified in our input file while printing the output to a sensibly named log file.

The `${JOBNAME}.in` file we feed into Gaussian has a somewhat straightforward structure, as long as what you want to do isn't too complex. For our anthracene example, let's say we want to simply relax the geometry to find the ground state structure. The file begins with some optional lines starting with `%` indicating if we're going to read in from any previous calculations or want to save some intermediate files. Most frequently you will specify the name of the checkpoint file via `%Chk=chkpointName` so that you can start a new calculation from the old one. The immediate next line begins with a `#` and is called the route section. For all calculations, this line should specify the desired density functional method and basis set. If no basis set is specified, Gaussian will default to STO-3G for most calculations. There does not seem to be a specified default density functional. This section is 'blank line terminated' meaning you can break it up between lines and MUST have a blank line before the next section. Following the blank line is our title section. As the name suggests, you should put a short line here that gets printed in various output files to help you identify the calculation that the file came from. The title is also blank line terminated and is followed by information about the molecule you are interested in calculating. The molecule section is again blank line terminated, so most of your calculations should end with a blank line or the calculation will crash. The first line of the molecule section should specify the charge (typically 0) and the multiplicity (typically 1). The following lines are xyz file format style information about the molecule.

Our example input file, following the instructions above, looks like this

```bash
%Chk=opt
#p B3LYP/aug-cc-pVDZ Opt

Optimize an anthracene molecule using the hybrid density functional B3LYP
and the basis set cc-pVDZ (correlation consistent double zeta) that has been *aug*mented with diffuse functions.

   0   1
C         10.78830        5.60957       26.31730
C          9.92421        6.47424       25.63038
C         12.00347        5.21621       25.73742
C         10.27019        6.93771       24.33700
C         11.47751        6.53025       23.74973
C         12.35030        5.68044       24.44474
C         12.88610        4.37527       26.43378
C         14.10475        4.00577       25.85792
C         14.44717        4.46338       24.58321
C         13.57402        5.29381       23.87450
C          8.72180        6.89549       26.21979
C          7.87542        7.77343       25.53757
C          8.21584        8.23016       24.26138
C          9.40604        7.81226       23.65865
H          8.44182        6.55450       27.20957
H          6.95432        8.10375       26.00104
H          7.55741        8.91257       23.73981
H          9.65406        8.17971       22.66967
H         10.52354        5.25562       27.30812
H         13.85852        5.64034       22.88784
H         15.39452        4.17703       24.14417
H         12.63870        4.01237       27.42454
H         14.78634        3.36575       26.40315
H         11.74398        6.88702       22.76106

```

To use the checkpoint file that we saved, and demonstrate another feature of Gaussian, we can take our new anthracene structure and ask to obtain information needed for calculating the absorption spectra. We can use the same sbatch file, just changing the `JOBNAME` variable if you wish, and the following input file

```bash
%OldChk=opt
%Chk=TD-root0
#p B3LYP/aug-cc-pVDZ Freq(HPModes,SaveNM) TD(NStates=20,Root=0) Guess=Check Geom=AllCheck

```

Because we have used the keyword/option combo `Geom=AllCheck`, Gaussian will look in the file `opt.chk` for all the information it needs about the geometry. To highlight some of the other options, we have asked Gaussian to perform a frequency calculation, saving the normal modes and keeping the values of the modes to high precision. We want to solve for 20 excited states with TD-DFT, specifying the ground state as the state of interest. And we want to pull the initial guess for the Hartree-Fock wavefunction from the checkpoint file.

Running this again, specifying state 1 as the state of interest gives us everything we need for a rudimentary absorption spectra calculation. To use the output files (i.e the *.chk files) with other programs, we need to ask Gaussian to format them. I typically wait for the calculations to finish after submitting them with the sbatch file and then load up Gaussian in an `acompile` session. We use the `formchk` command to get the formatted checkpoint file, if no output filename is given the default is the name of the checkpoint file with the extension `.fchk`.

```bash
acompile
module load gaussian
formchk CHECKPOINT
```

These files can be given to the tools packaged with FCClasses3 to calculate a one-photon absorption spectra using the vertical gradient method (see the [FCClasses3 tutorial]({{site.url}}{{site.baseurl}}programs/gaussian/Using_FCClasses3)).
