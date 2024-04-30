---
layout: page-fullwidth
title:  "Questaal Installation"
categories:
    - programs
    - Questaal
tags:
    - Questaal
    - installation
header: no
breadcrumb: true
authors:
    - sinalewis
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

Although Questaal is free, you need to request access to the bitbucket repository where it is kept. You can simply follow the instructions linked [here](https://www.questaal.org/get/). It is recommended to create a new python environment for running Questaal, and you may need to revert to Python version 3.7 to use the function `time.clock()` used in the installation and program. Most bugs associated with M1 chips seem to have been worked out.
