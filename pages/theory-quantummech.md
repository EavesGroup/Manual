---
layout: page
show_meta: false
title:  "Quantum Mechanics"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/theory/qm/"
---

{% assign titles = "" | split: "" %}
{% for post in site.categories.QM %}
{% assign pageBool = false %}
{% for tag in post.tags %}
{% if tag == "page" %}
    {% assign pageBool = true %}
{% endif %} 
{% endfor %}
    {% unless pageBool %}
    {% assign titles = titles | push: post.title %}
    {% endunless %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.categories.QM | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>

