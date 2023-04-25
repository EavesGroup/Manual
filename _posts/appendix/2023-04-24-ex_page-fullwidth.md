---
layout: page
title: "Temporary Example"
categories:
    - appendix
header: no
breadcrumb: true
---

The best way to learn the layout and file structure of this manual is to explore it for yourself. However, this page can be a good starting point as it will attempt to highlight the most important features. The following information can be broken up into 3 primary categories: the structure of your basic page, more complicated category pages, and the overarching file structure. There are many files that don't fit neatly into any one category and I will mention the most important ones and their function at the end.

## Your Basic Page
Every file starts with a short snippet of what is known as YAML (YAML Ain't Markup Language or Yet Another Markup Language. Yes, confusing I know). If you're familiar with JSON, just know that YAML is pretty similar. This section of YAML serves to set the look of the page and its relation to other content on the website. If you look through the files that make up the bulk of this webpage you will note 6 main keys appear on each one: layout, title, categories, tags, header, and breadcrumb.

### Layout
As the name suggests, this tag sets the layout of the page, which controls a lot of how the page looks. The majority of pages have the layout "page-fullwidth". The main landing pages (i.e. for Julia or VASP) have the "page" layout. I have also added [a copy of this page]({{ site.url }}/appendix/ex_page-fullwidth) with the "page" layout for a more direct comparison. 


