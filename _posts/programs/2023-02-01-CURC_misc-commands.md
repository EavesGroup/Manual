---
layout: page-fullwidth
title:  "Random Useful Commands to Add as an Alias"
teaser: ""
categories:
    - programs
    - CURC
tags:
    - CURC
    - alias
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

## Storage Management

A user has about 250 GB of space on their project directory of CURC. If you are running large calculations, e.g. VASP calculations, you can use up this space very quickly. In order to perform targeted compression and clean up efforts, it is useful to see the exact size of each file and folder. The command `du`, i.e. disk usage, is not very useful by itself. The option `-h` makes the sizes human readable by appending gigabyte and megabyte suffixes. The `-s` option is equivalent to `-d 0`, which makes the output display an entry for all files and directories `0` levels deep. `du -sh *` and `du -hd 1` show the same information, except the second option also shows the total size of current directory. `du -sh` without the size only shows the total size of the file we are currently in.

```bash
alias dush = "du -sh *"
```

## Fairshare and Priority


### Level Fairshare
If you want to know your 'level fairshare', or your usage of the cluster compared to the average user on the allocation, you need to first load the module `slurmtools`. This gives you access to the command `levelfs` that, when paired with a given username, lists the allocations and fairshare usage of that allocation by the user. A value of 1 indicates that the user is using about the same computer time as the average user in that allocation. Anything less than 1 indicates that the user is using more than their fairshare. If the user has not run any jobs on that allocation their fair share is "infinite".

```bash
alias fs = "module load slurmtools; levelfs $USER"
```