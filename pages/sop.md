---
layout: page
show_meta: false
title: "Standard Operating Procedures"
subheadline: ""
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/sop/"
---


Congratulations on joining the Eaves research group! The purpose of this section of the manual is best summarized by Adam Savage

> ...the only difference between screwing around and science is writing it down.

In that spirit, we have come up with a series of standard operating procedures to best make sure our science is, at minimum, internally "written" down and, when published, clear and consistent.

---

<h4><a href="{{ site.url }}{{ site.baseurl }}/sop/new-students/">New Students Start Here</a></h4>

---

{% assign titles = "" | split: "" %}
{% for post in site.tags.sop %}
    {% unless post.title == "New Students Start Here" %}
        {% assign titles = titles | push: post.title %}
    {% endunless %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.sop | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>