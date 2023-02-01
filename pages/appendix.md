---
layout: page
show_meta: false
title: "Appendix"
subheadline: "Random Useful Stuff"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/appendix/"
---
<ul>
    {% for post in site.categories.appendix %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>