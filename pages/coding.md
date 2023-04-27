---
layout: page
show_meta: false
title: "Useful Coding Languages"
subheadline: "Tips and Tricks for Coding in Julia and Mathematica"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/coding/"
---
<div>
    {% for post in site.categories.coding %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>