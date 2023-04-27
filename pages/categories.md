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
{: #toc }
*  TOC
{:toc}
</div>
</div><!-- /.medium-4.columns -->

<div class="medium-8 medium-pull-4 columns" markdown="1">

## Categories

<div>
{% for category in site.categories %}
<div>
    {% capture category_name %}{{ category | first }}{% endcapture %}
    <h3>{{ category_name }}</h3>
    <ul>
    {% for post in site.categories[category_name] %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    </ul>
    </div>
{% endfor %}
</div>

## Tags

<div>
{% for tag in site.tags %}
<div>
    {% capture tag_name %}{{ tag | first }}{% endcapture %}
    <h3>{{ tag_name }}</h3>
    <ul>
    {% for post in site.tags[tag_name] %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    </ul>
    </div>
{% endfor %}
</div>