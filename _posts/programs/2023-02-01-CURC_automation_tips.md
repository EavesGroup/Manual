---
layout: page-fullwidth
subheadline:  ""
title:  "Automation Tips"
teaser: ""
categories:
    - CURC
tags:
    - CURC
    - awk
    - batch-job
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

## Awk
Awk is best used when dealing with files of data that is arranged into columns and rows. For example, if you want to just grab the first column of a file you would type `awk '{print $1}' filename`. If you want to convert the data from a column vetor to a row vector for copy/paste purposes you can use `echo $(awk '{print $1}' filename)`.


## Batch Jobs
There are occasions where running a bunch of similar jobs with small changes can be useful. An example is when you are trying to converge the number of k-points or the energy cutoff. One way of doing these batch jobs is to execute the following commands on the command line.
```bash
    for i in $(seq start step stop); do
    cp -r files/ $i
    cd $i
    sed -i "s/encut/$i/g" INCAR
    sed -i "s/encut/$i/g" vasp*run*
    sbatch vasp*run*
    cd ..
    sleep .1
    done 
```
These commands create a new folder named `i` and look for the phrase `encut` within the INCAR file---to set the ENCUT parameter---and the sbatch file---to name the calculation---and replace it with the value `i`. It then submits the job. This is done for `i` starting at `start` with a step size of `step` until `stop` is reached. Be careful to use double quotes and not single quotes in the lines starting with `sed`. Usually it does not matter, but because we are using the variable `i` we need to use double quotes.

