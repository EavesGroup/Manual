---
layout: page
show_meta: false
title: "Computing in the Eaves Group"
subheadline: "Things to know about Software and Coding"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/computing/"
---


<small markdown="1">[Down to alphabetical list](#all)</small>
{: .text-right }

## [Software]({{ site.url }}{{ site.baseurl }}/programs/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Software<div id="dropdown-software" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 10px">〉</div></h2></summary>

{% assign titles = "" | split: "" %}
{% for post in site.tags.programs %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.programs | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
</details>

## [Coding]({{ site.url }}{{ site.baseurl }}/coding/)

<details>

<summary><h2 style="float:left; color:white; margin: -40px 0px 0px 0px">Coding<div id="dropdown-coding" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 10px">〉</div></h2></summary>

{% assign titles = "" | split: "" %}
{% for post in site.tags.coding %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.coding | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>

</details>

<script>
function changeDropdown(id) {
  var x = document.getElementById(id);
  var el = document.getElementById('exHeader');
  var style = window.getComputedStyle(el, null).getPropertyValue('font-size');
  var fontSize = parseFloat(style); 
  if (x.innerText === "〉") {
    x.innerText = "﹀";
    x.style.fontSize = (fontSize+7)+'px';
    x.style.margin = "0px 0px 0px 10px";
  } else {
  	x.innerHTML = "〉";
    x.style.fontSize = style;
    x.style.margin = "-2px 0px 0px 10px";
  }
}
</script>

## All 

{% assign titles = "" | split: "" %}
{% for post in site.tags.computing %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.computing | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>