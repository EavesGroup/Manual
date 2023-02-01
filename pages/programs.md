---
layout: page
show_meta: false
title: "VASP and LAMMPs and more, oh my!"
subheadline: "Tips and Tricks for Scientific Programs"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/programs/"
---
<ul>
    {% for post in site.categories.programs %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>