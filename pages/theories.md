---
layout: page
show_meta: false
title: "Useful Background Theory"
subheadline: "How to be a Theorist"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/theories/"
---
<ul>
    {% for post in site.categories.theory %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>