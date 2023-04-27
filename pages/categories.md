---
layout: page-fullwidth
permalink: /categories/
title: "Categories and Tags"
header: no
---

<div class="row">
<div class="medium-4 medium-push-8 columns" markdown="1">
<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc}
*  TOC
{:toc}
</div>
</div><!-- /.medium-4.columns -->

<div class="medium-8 medium-pull-4 columns" markdown="1">

{::options auto_ids="true" /}

## Categories

<div>
{% for category in site.categories %}
    {% capture category_name %}{{ category | first }}{% endcapture %}
    <h2 style="font-size:rem-calc(29);">{{ category_name }}</h2>
    <ul>
    {% for post in site.categories[category_name] %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    </ul>
{% endfor %}
</div>

## Tags

<div>
{% for tag in site.tags %}
    {% capture tag_name %}{{ tag | first }}{% endcapture %}
    <h2 style="font-size:rem-calc(29);">{{ tag_name }}</h2>
    <ul>
    {% for post in site.tags[tag_name] %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    </ul>
{% endfor %}
</div>