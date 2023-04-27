---
layout: page
show_meta: false
title: "Useful Background Theory"
subheadline: "How to be a Theorist"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/theory/"
---
<div>
    {% for post in site.tags.theory %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>