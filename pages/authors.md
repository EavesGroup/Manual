---
layout: page-fullwidth
permalink: /people/
title: "People"
header: no
---

{% for author in site.data.authors %}
{{ author.name[0]
{% endfor %}

<!-- 
{% assign authors = "" | split: "" %}
{% for a in site.data.authors %}
    {% assign lastFirst = a.name | split: " " | reverse %}
    {% assign authors = authors | push: lastFirst %}
{% endfor %}
{% assign sorted_authors = authors | sort_natural %}

{% for author in sorted_authors %}
    {% assign firstLast = author | split: " " | reverse %}
    {% assign matched_author = site.data.authors | where:"name",firstLast %}
    {% assign person = matched_author[0] %}
    
    <div>
    {% if person.email %}
    <h4><a href="mailto:{{ person.email }}">{{ person.name }}</a></h4>
    {% else %}
        <h4>{{ person.name }}</h4>
    {% endif %}
    </div>
{% endfor %} -->