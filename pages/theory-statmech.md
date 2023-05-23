---
layout: page
show_meta: false
title:  "Statistical Mechanics"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/statmech/"
---

{% assign titles = "" | split: "" %}
{% for post in site.tags.EQ-SM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% for post in site.tags.NEQ-SM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.EQ-SM | where:"title",p %}
    {% unless matched_post %}
        {% assign matched_post = site.tags.NEQ-SM | where: "title",p %}
    {% endunless %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>

