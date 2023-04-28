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

<!-- {% assign sorted_cats = site.categories | sort_natural %} -->
{% for category in site.categories | sort_natural %}
{% capture category_name %}{{ category | first }}{% endcapture %}
### {{ category_name }}
<ul>
{% for post in site.categories[category_name] %}
<li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% endfor %}

<small markdown="1">[Up to table of contents](#toc)</small>
{: .text-right }

## Tags

{% assign sorted_tags = site.tags | sort_natural %}
{% for tag in sorted_tags %}
{% capture tag_name %}{{ tag | first }}{% endcapture %}
### {{ tag_name }}
<ul>
{% for post in site.tags[tag_name] %}
<li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% endfor %}