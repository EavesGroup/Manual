---
layout: page
show_meta: false
title: "CURC, VASP, LAMMPs, and more!"
subheadline: "Tips and Tricks for Scientific Computing"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/programs/"
---
<div>
    {% for post in site.tags.programs sort_natural %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>