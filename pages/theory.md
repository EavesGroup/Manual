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

## [Electronic Structure Theory]({{ site.url }}{{ site.baseurl }}/est/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Electronic Structure Theory<div id="dropdown-EST" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign titles = "" | split: "" %}
{% for post in site.tags.EST %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.EST | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
</details>

## [Equilibrium Statistical Mechanics]({{ site.url }}{{ site.baseurl }}/esm/)

<details>

<summary><h2 style="float:left; color:white; margin: -40px 0px 0px 0px">Equilibrium Statistical Mechanics<div id="dropdown-EQSM" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign titles = "" | split: "" %}
{% for post in site.tags.EQStatMech %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.EQStatMech | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
</details>

## [Non-Equilibrium Statistical Mechanics]({{ site.url }}{{ site.baseurl }}/nesm/)

<details>

<summary><h2 style="float:left; color:white; margin: -40px 0px 0px 0px">Non-Equilibrium Statistical Mechanics<div id="dropdown-NEQSM" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign titles = "" | split: "" %}
{% for post in site.tags.NEQStatMech %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.NEQStatMech | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
</div>
</details>

## [Quantum Dynamics]({{ site.url }}{{ site.baseurl }}/quantumDynamics/)

<details>

<summary><h2 style="float:left; color:white; margin: -40px 0px 0px 0px">Quantum Dynamics<div id="dropdown-quantumDynamics" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign titles = "" | split: "" %}
{% for post in site.tags.quantum-dynamics %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div>
<br>
    {% for p in sorted_titles %}
    {% assign matched_post = site.tags.quantum-dynamics | where:"title",p %}
    {% assign post = matched_post[0] %}
    <h4><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    {% endfor %}
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