---
layout: page
show_meta: false
title:  "Classical Mechanics"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/theory/cm/"
---

{% assign titles = "" | split: "" %}
{% for post in site.categories.CM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.categories.CM | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>

