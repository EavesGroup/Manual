---
layout: page-fullwidth
title:  "Image Tags"
categories:
    - sop
tags:
    - sop
    - imagetags
header: no
breadcrumb: true
authors:
    - sinalewis
---

{% for i in (1...8) %}
<img class="t60" src="{{ site.urlimg }}/image-tags/teams_tag-files_example-0{{ i }}.png" caption="">
{% endfor %}