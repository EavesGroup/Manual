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

{% assign cats = "" | split:"" %}
{% for c in site.categories %}
    {% assign cats = cats | push: c[0] %}
{% endfor %}
{% assign sorted_cats = cats | sort_natural %}

{% for category in sorted_cats %}
### {{ category }}
<details>

<summary><p id="dropdown-{{ category }}" onClick="changeDropdown(this.id)" style="color:grey">&#9002;</p></summary>
<div class="row">
<div class="small-1 column"></div>
<div class="small-11 column">
<ul>
{% for post in site.categories[category] %}
<li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
</div>
</div>
</details>
{% endfor %}

<small markdown="1">[Up to table of contents](#toc)</small>
{: .text-right }

## Tags

{% assign tags = "" | split:"" %}
{% for t in site.tags %}
    {% assign tags = tags | push: t[0] %}
{% endfor %}
{% assign sorted_tags = tags | sort_natural %}

{% for tag in sorted_tags %}
### {{ tag }}
<ul>
{% for post in site.tags[tag] %}
<li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% endfor %}

<small markdown="1">[Up to table of contents](#toc)</small>
{: .text-right }


<script>
function changeDropdown(id) {
  var x = document.getElementById(id);
  if (x === "&#9002;"){
    x.textContent = "&#65088;";
  } else {
    x.textContent = "&#9002;";
  }
}</script>
