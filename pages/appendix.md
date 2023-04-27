---
layout: page
show_meta: false
title: "Appendix"
subheadline: "Random Useful Stuff"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/appendix/"
---
<div>
    {% for post in site.categories.appendix %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>