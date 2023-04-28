---
layout: page
show_meta: false
title: "Useful Coding Languages"
subheadline: "Tips and Tricks for Coding in Julia and Mathematica"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/coding/"
---

{% assign titles = "" | split: "" %}
{% for p in site.tags.coding %}
    {% assign titles = titles | push: p[0] %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for post in site.posts[sorted_title] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>