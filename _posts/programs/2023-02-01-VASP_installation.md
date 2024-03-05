---
layout: page-fullwidth
title:  "Installing VASP"
teaser: ""
categories:
    - programs
    - VASP
tags:
    - VASP
    - installation
    - summit
    - alpine
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

### Pre-Installation

Regardless of the computer architecture, the first step of installing VASP is to retrieve the necessary files. VASP is not a free program and, therefore, requires a license to download and operate. We obtained our license through [Materials Design, Inc.](https://my.materialsdesign.com) and need to download it from there, not the VASP portal. As of October 13, 2022, [Sina G. Lewis](mailto:sina.lewis@colorado.edu) is the contact for the login details.

After you have downloaded the files from the portal, do NOT unzip them yet. [Peyton]({{ site.url }}/appendix/appendix_people#R.PeytonCline) has experienced issues in the past when he unzips the files on his local machine. Instead, upload them to your project directory on the system where you intend to install VASP. I recommend having a folder in this directory called `programs` where you keep VASP and other programs like [LAMMPS]({{site.url}}/programs/lammps). The command to upload the files to this location on Summit or Alpine would then look like
```bash
    scp filename identikey@login.rc.colorado.edu:/projects/identikey/programs
```
Each installation of VASP should be contained within its own folder within your `programs` folder. The name of the folder should contain the version of VASP and preferably a few of the options that were used in the installation. For example, `summit_vasp.6.3.1_O2_intel20` is the folder name for version 6.3.1 of VASP, installed on Summit, with the O2 optimization flag and version 20 of the intel module.

The structure of VASP within the zip files changes frequently, so I recommend adding each zip file to its own folder within this `summit_vasp.6.3.1_O2_intel20` folder. Typically, there is one zip file for the VASP installation, one for the LDA psuedopotentials, and one for the PBE pseudopotentials. Unzip the files within their folder and then rearrange the output to your desired configuration.

After organizing the files it's time to start the installation process. Make sure you are on a compile node, NOT the login node. The following steps will likely throw an error if you are on a login node and it will slow down the whole system for everyone. Once you are on a compile node, load the modules needed for installation. The order matters for some of them because of dependencies, always load intel first. You can check the available modules with `module avail`. If you don't see the module you want try the command `module spider` or `module spider string` where string is a search keyword enclosed in quotes. The remaining steps may differ depending on where you are installing VASP. See the below sections.

Most of these installation instructions can be found on the [wiki](https://www.vasp.at/wiki/index.php/Installing_VASP.6.X.X). As of VASP version 6 there is a testsuite to ensure the installation completed correctly. This testsuite should be run on the compile nodes after loading the correct modules.

### Alpine Installation
Alpine is the most recent (Fall 2022) supercomputer. It is an institutionally funded supercomputer designed to replace Summit. To access Alpine, login via the same command used to load Summit
```bash
    ssh -X identikey@login.rc.colorado.edu
```
and then load Slurm for Alpine (no longer required as of mid-2023)
```bash
    module load slurm/alpine
```
To access an Alpine compile node, submit a compile job by typing `acompile --ntasks=4` on the terminal line. Note that there is no `ssh` needed, as was previously used on Summit. The specification `--ntasks=4` is used because we later install VASP with 4 parallel processes.

Installing VASP requires us to load three modules: intel, mkl, and impi. Intel is the compiler, mkl stands for math kernel library, and impi is our intel message passing interface that is needed for parallel computing. Remember that the order modules are loaded matters because of possible dependencies. I spoke with someone at research computing who recommended intel followed by impi and finally mkl. Peyton has said in the past that it didn't seem to matter if you installed impi before mkl or after.

Alpine currently has limited version choices for these modules. Nevertheless, it is best to specify the version so that you know concretely what you are using. As of November 2022, the command you would want to type is
```bash
    module load intel/2022.1.2 impi/2021.5.0 mkl/2022.0.2
```

After loading these modules, we want to grab the correct makefile for our computer architecture from the `arch` folder that should have been unpacked from the VASP zip file. Because we are using intel, we will grab the makefile titled `makefile.include.intel`. Copy this file to the parent directory, where the rest of your VASP files should be, and rename it. This command would be
```bash
    cp makefile.include.intel ../makefile.include
```
As a final step, we need to edit a few lines in our new file `makefile.include`. If we are using Intel Parallel Studio's MKL, which we most likely are, we want to find the line `FCL += -qmkl=sequential` and remove the `q` so that it reads `FCL += -mkl=sequential`. While we are here, we can go ahead and comment out the next line that starts `MKLROOT`. Finally, in the line `#LLIBS += -L$(WANNIER90_ROOT)/lib -lwannier`, we want to remove the `/lib` part. These last two steps are only important for a Wannier installation, but are fine to do in a general installation.

Most importantly, because Alpine has AMD CPUs and not Intel CPUs we need to tell the compiler to use a different instruction set. This is done by finding the line that reads
```bash
    VASP_TARGET_CPU ?= -xHOST
```
and changing it to read
```bash
    VASP_TARGET_CPU ?= -march=core-avx2
```

As a final step, it is recommended to compile VASP 6.2 and up with the flag `-DVASP_HDF5` in the `CPP_OPTIONS`, includes `INCS`, and linking `LLIBS` instructions. There is a section near the bottom of the `makefile.include` that you can simply uncomment for this.

We are now good to install VASP. We want to run the command
```bash
    make DEPS=1 -j4 all
```
to install `all` versions of VASP with 4 parallel processes and `DEPS=1` ensures the installation doesn't crash because of dependency issues while installing in parallel. VASP can also be installed with standard-only, gamma-point only, or non-collinear only.

### Summit Installation
Summit is the supercomputer that we used to use, but was largely phased out by CU in August 2022. Although it currently can be used, the scratch space is no longer supported and is unstable. These instructions for installing VASP on Summit are kept for posterity.

To access Summit, login using the following command
```bash
    ssh -X identikey@login.rc.colorado.edu
```
and then access a compile node using `ssh compile`.

Installing VASP requires us to load three modules: intel, mkl, and impi. Intel is the compiler, mkl stands for math kernel library, and impi is our intel message passing interface that is needed for parallel computing. Remember that the order modules are loaded matters because of possible dependencies. I spoke with someone at research computing who recommended intel followed by impi and finally mkl. Peyton has said in the past that it didn't seem to matter if you installed impi before mkl or after. In my first installation of VASP, I used
```bash
    module load intel/20.2 mkl/20.2 impi/19.8
```
to load the intel compiler version 20.2, the math kernel library (mkl) version 20.2, and the intel message passing interface (impi)--needed for parallel computing--version 19.8 in that order.

As a final step, we need to edit a few lines in our new file `makefile.include`. If we are using Intel Parallel Studio's MKL, which we most likely are, we want to find the line `FCL += -qmkl=sequential` and remove the `q` so that it reads `FCL += -mkl=sequential`. While we are here, we can go ahead and comment out the next line that starts `MKLROOT`. Finally, in the line `#LLIBS += -L$(WANNIER90_ROOT)/lib -lwannier`, we want to remove the `/lib` part. These last two steps are only important for a Wannier installation, but are fine to do in a general installation.

We are now good to install VASP. We want to run the command
```bash
    make DEPS=1 -j4 all
```
to install `all` versions of VASP with 4 parallel processes and `DEPS=1` ensures the installation doesn't crash because of dependency issues while installing in parallel. VASP can also be installed with standard-only, gamma-point only, or non-collinear only.


### Wannier Compatibility
If we want to be able to use Wannier we need to do a few more things in the makefile before installing VASP. In 'makefile.include' we want to add the option '-duse_shmem' under the ''CPP_OPTIONS'. Don't forget to add a forward slash '\' to the end of the line preceding it. I seem to recall something else needing to change somewhere \authorNote{ask Peyton!}.