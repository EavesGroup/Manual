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

## [Classical Mechanics]({{ site.url }}{{ site.baseurl }}/theory/cm/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Classical Mechanics<div id="dropdown-classmech" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign cats = "" | split: "" %}

{% for category in site.categories %}

{% assign c = category[0] %}
{% assign subcategory = c | split: "_" %}

{% if subcategory[0] == "CM" and subcategory[1] %}
 {% assign cats = cats | push: c %}
{% endif %}
{% endfor %}


{% for c in cats %}
{% assign cat-name = c | split: "_" | slice: 1,20 | join: " " %}

{% assign name = c | downcase %}
<h4><a href="{{ site.url }}{{ site.baseurl }}/theory/mm/{{ name }}">{{ cat-name }}</a></h4>
<hr>
{% assign titles = "" | split: "" %}
{% for post in site.categories[c] %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div class="row t30">
<div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 1 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
    <div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 0 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
</div>

{% endfor %}


</details>

## [Math Methods]({{ site.url }}{{ site.baseurl }}/theory/mm/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Math Methods<div id="dropdown-mathmethods" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign cats = "" | split: "" %}

{% for category in site.categories %}

{% assign c = category[0] %}
{% assign subcategory = c | split: "_" %}

{% if subcategory[0] == "MM" and subcategory[1] %}
 {% assign cats = cats | push: c %}
{% endif %}
{% endfor %}


{% for c in cats %}
{% assign cat-name = c | split: "_" | slice: 1,20 | join: " " %}

{% assign name = c | downcase %}
<h4><a href="{{ site.url }}{{ site.baseurl }}/theory/mm/{{ name }}">{{ cat-name }}</a></h4>
<hr>
{% assign titles = "" | split: "" %}
{% for post in site.categories[c] %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div class="row t30">
<div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 1 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
    <div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 0 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
</div>

{% endfor %}


</details>

## [Quantum Mechanics]({{ site.url }}{{ site.baseurl }}/theory/qm/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Quantum Mechanics<div id="dropdown-quantummech" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign cats = "" | split: "" %}

{% for category in site.categories %}

{% assign c = category[0] %}
{% assign subcategory = c | split: "_" %}

{% if subcategory[0] == "QM" and subcategory[1] %}
 {% assign cats = cats | push: c %}
{% endif %}
{% endfor %}


{% for c in cats %}
{% assign cat-name = c | split: "_" | slice: 1,20 | join: " " %}

{% assign name = c | downcase %}
<h4><a href="{{ site.url }}{{ site.baseurl }}/theory/mm/{{ name }}">{{ cat-name }}</a></h4>
<hr>
{% assign titles = "" | split: "" %}
{% for post in site.categories[c] %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div class="row t30">
<div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 1 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
    <div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 0 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
</div>

{% endfor %}


</details>

## [Statistical Mechanics]({{ site.url }}{{ site.baseurl }}/theory/sm/)

<details>

<summary><h2 id="exHeader" style="float:left; color:white; margin: -40px 0px 0px 0px">Statistical Mechanics<div id="dropdown-statmech" onClick="changeDropdown(this.id)" style="color:gray; float:right; margin: -2px 0px 0px 30px">〉</div></h2></summary>

{% assign cats = "" | split: "" %}

{% for category in site.categories %}

{% assign c = category[0] %}
{% assign subcategory = c | split: "_" %}

{% if subcategory[0] == "SM" and subcategory[1] %}
 {% assign cats = cats | push: c %}
{% endif %}
{% endfor %}


{% for c in cats %}
{% assign cat-name = c | split: "_" | slice: 1,20 | join: " " %}

{% assign name = c | downcase %}
<h4><a href="{{ site.url }}{{ site.baseurl }}/theory/mm/{{ name }}">{{ cat-name }}</a></h4>
<hr>
{% assign titles = "" | split: "" %}
{% for post in site.categories[c] %}
    {% assign titles = titles | push: post.title %}
{% endfor %}
{% assign sorted_titles = titles | sort_natural %}

<div class="row t30">
<div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 1 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
    <div class="small-6 columns">
    {% for p in sorted_titles %}
    {% assign loopindex = forloop.index | modulo: 2 %}
    {% if loopindex == 0 %}
    {% assign matched_post = site.categories[c] | where:"title",p %}
    {% assign post = matched_post[0] %}
    <a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    {% endif %}
    {% endfor %}
    </div>
</div>

{% endfor %}


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