---
layout: page
show_meta: false
title: "Useful Coding Languages"
subheadline: "Tips and Tricks for Coding in Julia and Mathematica"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/coding/"
---
<ul>
    {% for post in (site.categories.coding && site.tags.coding) %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>