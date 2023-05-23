---
layout: page-fullwidth
show_meta: false
title: "Useful Background Theory"
subheadline: "How to be a Theorist"
header:
   image_fullwidth: "header_unsplash_5.jpg"
permalink: "/theory/"
---

<small markdown="1">[Down to alphabetical list](#all)</small>
{: .text-right }

{% assign categories = site.categories %}

## [Classical Mechanics]({{ site.url }}{{ site.baseurl }}/CM/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Classical Mechanics<div id="dropdown-classmech" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% for category in categories %}
{% assign subcategory = category | split: "_" %}

{% if category[0] == "CM" %}
{% assign cat-name = category | shift | join: " " %}

{% assign titles = "" | split: "" %}
{% for post in site.categories[category] %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<h3><a href="{{ site.url }}{{ site.baseurl }}/CM/{{ category }}">{{ cat-name }}</a></h3>
<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.categories[category] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>


{% endif %}
{% endfor %}

## [Math Methods]({{ site.url }}{{ site.baseurl }}/mathmethods/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Math Methods<div id="dropdown-mathmethods" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign titles = "" | split: "" %}
{% for post in site.tags.MM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.MM | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
</details>

## [Quantum Mechanics]({{ site.url }}{{ site.baseurl }}/quantummech/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Quantum Mechanics<div id="dropdown-quantummech" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

<div class="row">
<div class="small-6 columns">
<h3>Statics</h3>
    {% assign titles = "" | split: "" %}
{% for post in site.tags.static-QM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.static-QM | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
    <div class="small-6 columns">
<h3>Dynamics</h3>
     {% assign titles = "" | split: "" %}
{% for post in site.tags.dynamic-QM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.dynamic-QM | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
</div>
</div>
</details>

## [Statistical Mechanics]({{ site.url }}{{ site.baseurl }}/statmech/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Statistical Mechanics<div id="dropdown-statmech" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

<div class="row">
<div class="small-6 columns">
<h3>Equilibrium</h3>
    {% assign titles = "" | split: "" %}
{% for post in site.tags.EQ-SM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.EQ-SM | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
    <div class="small-6 columns">
<h3>Non-Equilibrium</h3>
     {% assign titles = "" | split: "" %}
{% for post in site.tags.NEQ-SM %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.NEQ-SM | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
</div>
</div>
</details>

## All

---

{% assign titles = "" | split: "" %}
{% for post in site.tags.theory %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}


<div class="row">
<div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 1 %}
    {% assign matched_post = site.tags.theory | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endif %}
    {% endfor %}
    </div>
    <div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 0 %}
    {% assign matched_post = site.tags.theory | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endif %}
    {% endfor %}
    </div>
</div>


<script>
function changeDropdown(id) {
  var x = document.getElementById(id);
  var el = document.getElementById('exHeader');
  var style = window.getComputedStyle(el, null).getPropertyValue('font-size');
  var fontSize = parseFloat(style); 
  if (x.innerText === "〉") {
    x.innerText = "﹀";
    x.style.fontSize = (fontSize+7)+'px';
    x.style.margin = "0px 0px 0px 30px";
  } else {
  	x.innerHTML = "〉";
    x.style.fontSize = style;
    x.style.margin = "-2px 0px 0px 30px";
  }
}
</script>