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
    - alexstaat
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

After you have downloaded the files from the portal, do NOT unzip them yet. [Peyton]({{ site.url }}/appendix/appendix_people#R.PeytonCline) has experienced issues in the past when he unzips the files on his local machine. Instead, upload them to your project directory on the system where you intend to install VASP. I recommend having a folder in this directory called `programs` where you keep VASP and other programs like [LAMMPS]({{site.url}}{{site.baseurl}}/programs/lammps). The command to upload the files to this location on Summit or Alpine would then look like
```bash
    scp filename identikey@login.rc.colorado.edu:/projects/identikey/programs
```
Each installation of VASP should be contained within its own folder within your `programs` folder. The name of the folder should contain the version of VASP and preferably a few of the options that were used in the installation. For example, `summit_vasp.6.3.1_O2_intel20` is the folder name for version 6.3.1 of VASP, installed on the cluster Summit, with the O2 optimization flag and version 20 of the intel module.

The structure of VASP within the zip files changes frequently, so **I recommend making a separate folder for each zip file** within this `summit_vasp.6.3.1_O2_intel20` folder. Typically, there are three zip files: one for the VASP installation, one for the LDA psuedopotentials, and one for the PBE pseudopotentials. Unzip the files within their own folder and then rearrange the output to your desired configuration. A good layout for a fully installed VASP is shown in the image below.

<img class="t60" src="{{ site.urlimg }}vasp_install_layout.png" alt="Folder layout example for a fully installed version of VASP" caption="Example of the folder layout for a fully installed version of VASP, contained within folder `alpine _vasp.6.4.2_O2_intel2022`.">

After organizing the files it's time to start the installation process. Make sure you are on a compile node, NOT the login node. The following steps will likely throw an error if you are on a login node and it will slow down the whole system for everyone. Once you are on a compile node, load the modules needed for installation. The order matters for some of them because of dependencies, always load intel first. You can check the available modules with `module avail` and the modules you have already loaded with `module list`. If you don't see the module you want, try the command `module spider` or `module spider string` where string is a search keyword enclosed in quotes. The remaining steps may differ depending on where you are installing VASP. See the below sections.

Most of these installation instructions can be found on the [wiki](https://www.vasp.at/wiki/index.php/Installing_VASP.6.X.X). As of VASP version 6 there is a testsuite to ensure the installation completed correctly. This testsuite should be run on the compile nodes after loading the correct modules.

### Alpine Installation
Alpine is the most recent (Fall 2022) supercomputer. It is an institutionally funded supercomputer designed to replace Summit. To access Alpine, login via the following command
```bash
    ssh -X identikey@login.rc.colorado.edu
```

To access an Alpine compile node, submit a compile job by typing `acompile --ntasks=4` on the terminal line. Note that there is no `ssh` needed, as was previously used on Summit. The specification `--ntasks=4` is used because we later install VASP with 4 parallel processes. You can additionally request more than the default one hour of time by adding `--time=03:00:00` if you wanted three hours for example. The whole process of installing VASP, if you know what you're doing, should take less than an hour, but the testsuite can take several hours to run.

Installing VASP requires us to load three modules: intel, mkl, and impi. Intel is the compiler, mkl stands for math kernel library, and impi is our intel message passing interface that is needed for parallel computing. Remember that the order modules are loaded matters because of possible dependencies. I spoke with someone at research computing who recommended intel followed by impi and finally mkl. Peyton has said in the past that it didn't seem to matter if you installed impi before mkl or after.

Alpine currently has limited version choices for these modules. Nevertheless, it is best to specify the version so that you know concretely what you are using. As of November 2022 (and in March 2024), the command you would want to type is
```bash
    module load intel/2022.1.2 impi/2021.5.0 mkl/2022.0.2
```

After loading these modules, we want to grab the correct makefile for our computer architecture from the `arch` folder that should have been unpacked from the VASP zip file. Because we are using intel, we will grab the makefile titled `makefile.include.intel`. Copy this file to the parent directory, where the rest of your VASP files should be, and rename it. This command would be
```bash
    cp makefile.include.intel ../makefile.include
```
As a final step, we need to edit a few lines in our new file `makefile.include`. If we are using Intel Parallel Studio's MKL, which we most likely are, we want to find the line `FCL += -qmkl=sequential` and remove the `q` so that it reads `FCL += -mkl=sequential`. While we are here, we can go ahead and comment out the next line that starts `MKLROOT`. Finally, in the line `#LLIBS += -L$(WANNIER90_ROOT)/lib -lwannier`, we want to remove the `/lib` part. These last two steps are only important for a Wannier installation, but are fine to do in a general installation.

**Most importantly**, because Alpine has AMD CPUs and not Intel CPUs we need to tell the compiler to use a different instruction set. This is done by finding the line that reads
```bash
    VASP_TARGET_CPU ?= -xHOST
```
and changing it to read
```bash
    VASP_TARGET_CPU ?= -march=core-avx2
```

As of VASP 6.2, it is highly recommended to compile VASP with the flag `-DVASP_HDF5` in the `CPP_OPTIONS`, includes `INCS`, and linking `LLIBS` instructions. There is a section near the bottom of the `makefile.include` that you can simply uncomment for this. Sina found that to make this work it was required to `module load hdf5/1.12.1` and directly supply the path to the HDF_ROOT in the makefile. The appropriate line looks like
```bash
    HDF5_ROOT ?= /curc/sw/install/hdf5/1.12.1/impi/2021.5.0/intel/2022.1.2
```
**Alternatively** you can check your environment variables, after loading all the modules, using `$set` and then replace `HDF_ROOT` with the appropriate environment variable. Alex found that on Alpine the appropriate variable was `CURC_HDF5_ROOT`.

We are now good to install VASP. We want to run the command
```bash
    make DEPS=1 -j4 all
```
to install `all` versions of VASP with 4 parallel processes and `DEPS=1` ensures the installation doesn't crash because of dependency issues while installing in parallel. VASP can also be installed with standard-only (std), gamma-point only (gam), or non-collinear only (ncl).

The VASP wiki instructions end by adding the executables to your VASP with
```bash
export PATH=$PATH:/path/to/vasp.x.x.x/bin
```
but it is also sufficient to just define the variable
```bash
VASP_DIR=/path/to/vasp.x.x.x/bin/vasp_std
```
in your sbatch file (if you want to point to the standard version of VASP). 

Finish everything off by running the testsuite.
```bash
make test
```

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

### Uninstalling VASP

When you go to delete VASP, you might find that you don't have the correct permissions to delete the LDA/PBE files. The quick work around is to use `chmod -R 766` on the file(s) you wish to delete. For example, if you wish to only delete the files within the folder `LDA`, you would type `chmod -R 766 LDA` in the parent directory. The option `-R` makes chmod recursive and it will act on all the files in the folder `LDA`. The specific combination `766` for chmod provides read, write, and execute permissions for the user and read and write permissions for the group and others. See the [wikipedia](https://en.wikipedia.org/wiki/Chmod) page for more information.

Once you delete the LDA/PBE files you should be able to just normally delete the other files in your VASP install folder. That's all you need to do!