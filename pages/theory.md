---
layout: page
show_meta: false
title: "Useful Background Theory"
subheadline: "How to be a Theorist"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/theory/"
---

<small markdown="1">[Down to alphabetical list](#all)</small>
{: .text-right }

## [Electronic Structure Theory]({{ site.url }}{{ site.baseurl }}/theory/est/)

## [Equilibrium Statistical Mechanics]({{ site.url }}{{ site.baseurl }}/theory/esm/)

## [Non-Equilibrium Statistical Mechanics]({{ site.url }}{{ site.baseurl }}/theory/nesm/)

## [Quantum Dynamics]({{ site.url }}{{ site.baseurl }}/theory/quantumDynamics/)


## All

{% assign titles = "" | split: "" %}
{% for post in site.tags.theory %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}


<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.theory | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>