---
layout: page-fullwidth
title:  "How to Add to this Manual"
categories:
    - appendix
tags:
    - appendix
header: no
breadcrumb: true
author: sinalewis
---

The best way to learn the layout and file structure of this manual is to explore it for yourself. However, this page can be a good starting point as it will attempt to highlight the most important features. The following information can be broken up into 3 primary categories: the structure of your basic page, more complicated category pages, and the overarching file structure. There are many files that don't fit neatly into any one category and I will mention the most important ones and their function at the end. A lot of the functionality can be found in the [documentation](https://phlow.github.io/feeling-responsive/documentation/) of the person (Phlow) who created the template (Feeling Responsive) that I (Sina) just pulled from.

## Your Basic Page
Every file starts with a short snippet of what is known as YAML (YAML Ain't Markup Language or Yet Another Markup Language. Yes, confusing I know). If you're familiar with JSON, just know that YAML is pretty similar. This section of YAML serves to set the look of the page and its relation to other content on the website. If you look through the files that make up the bulk of this webpage you will note 6 main keys appear on each one: layout, title, categories, tags, header, and breadcrumb.

### Layout
As the name suggests, this tag sets the layout of the page, which controls a lot of how the page looks. For example, if the page has an image or a title, this tag set where that is positioned within the browser window. The majority of pages in this manual have the layout "page-fullwidth". The main landing pages (i.e. for Julia or VASP) have the "page" layout.  
Many fullwidth pages look fairly narrow because they have the table of contents forcing space on the side. I have added [a copy of this page]({{ site.url }}{{ site.baseurl }}/archive/ex_page-fullwidth) with the "page" layout for a more direct comparison. Other layouts exist under the "_layouts" folder, the documentation mentioned above should have examples for these layouts. If you are feeling adventurous, you can also create your own layout. Just be sure to add it to the "_layout" folder and add it to these notes!

### Title
This tag is exactly what it says, a simple string that supplies the title that appears at the top of the page. The title does not need to match the name of the file, but I frequently make them similar.

### Categories
Categories are important for how the webpage is structured. 

