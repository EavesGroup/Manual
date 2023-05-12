---
layout: page-fullwidth
permalink: /people/
title: "People"
header: no
---

{% assign authors = "" | split: "" %}
{% for a in site.data.authors %}
    {% assign lastFirst = a.name | split: " " | reverse %}
    {% assign authors = authors | push: lastFirst %}
{% endfor %}
{% assign sorted_authors = authors | sort_natural %}

{% for author in sorted_authors %}
    {% assign firstLast = author | split: " " | reverse %}
    {% assign matched_author = site.data.authors | where:"name",firstLast %}
    <!-- do something with the author -->
    <div>
    {% if matched_author.email %}
    <h4><a href="mailto:{{ matched_author.email }}">{{ matched_author.name }}</a></h4>
    {% else %}
        <h4>{{ matched_author.name }}</h4>
        {% endif %}
    </div>
{% endfor %}