---
layout: page-fullwidth
title:  "How to Add to this Manual"
categories:
    - appendix
tags:
    - appendix
header: no
breadcrumb: true
authors: 
    - sinalewis
---
<div class="row">
<div class="medium-4 medium-push-8 columns" markdown="1">
<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>
</div><!-- /.medium-4.columns -->

<div class="medium-8 medium-pull-4 columns" markdown="1">

The best way to learn the layout and file structure of this manual is to explore it for yourself. However, this page is a good starting point as it will attempt to highlight the most important features. The following information can be broken up into 3 primary categories: the structure of your basic page, more complicated category pages, and the overarching file structure. There are many files that don't fit neatly into any one category and I will mention the most important ones and their function at the end. A lot of the functionality can be found in the [documentation](https://phlow.github.io/feeling-responsive/documentation/) of the person (Phlow) who created the template (Feeling Responsive) that I (Sina) just pulled from.



## Your Basic Page
Every file starts with a short snippet of what is known as YAML (YAML Ain't Markup Language or Yet Another Markup Language. Yes, confusing I know). If you're familiar with JSON, YAML is pretty similar. If you aren't, just know that YAML consists of a series of key-value pairs. This section of YAML serves to set the look of the page and its relation to other content on the website. If you look through the files that make up the bulk of this webpage you will note 6 main keys appear on each one: layout, title, categories, tags, header, and breadcrumb. The following sections will describe some of the values that go with these pairs and their purpose.

### Layout
As the name suggests, the layout tag sets the layout of the page, which controls a lot of how the page looks. For example, if the page has an image or a title, this tag sets where that is positioned within the browser window. The majority of pages in this manual have the layout "page-fullwidth". The main landing pages (i.e. for Julia or VASP) have the "page" layout.  
Many fullwidth pages look fairly narrow because they have the table of contents forcing space on the side. I have added [a copy of this page]({{ site.url }}{{ site.baseurl }}/archive/ex_page-fullwidth) with the "page" layout for a more direct comparison. Other layouts exist under the "_layouts" folder, the documentation mentioned above should have [examples](https://phlow.github.io/feeling-responsive/documentation/#formats) for these layouts. If you are feeling adventurous, you can also create your own layout. Just be sure to add it to the "_layout" folder and add it to these notes!

### Title
This tag is exactly what it says, a simple string (text enclosed in quotes) that supplies the title that appears at the top of the page. The title does not need to match the name of the file, but I frequently make them similar.

NOTE: the variable 'page.title' returns the name of the FILE. For example, the file that generates this page is names "2023-04-24-how-to-manual.md" and page.title will return "how-to-manual".

### Categories and Tags
Categories and tags are important for how the webpage is structured. As discussed in the [below section](#category-pages), pages are automatically included on certain landing pages based on their tag keys (i.e. coding, theory, Julia, LAMMPS...) and as mentioned in [the breadcrumb section](#breadcrumb) the listed categories and their order define what appears in the breadcrumb list. As discussed in the overarching [file structure](#file-location), I tend to sort files also based on their top level category; for example, all VASP related files are in the 'programs' category. Listed categories and tags also end up at the bottom of the page. 

### Header
The header is a banner that stretches across the top of the page. Most pages use "header: no", so that the first thing on the page is the title and then the content. Landing category pages, such as VASP or coding, have a specified title and image for the header. The creator of the template has example of [most type of headers](https://phlow.github.io/feeling-responsive/design/no-header/) that you would want to create.

### Breadcrumb(s)
Breadcrumbs are a way to help the user navigate the site. Setting the tag "breadcrumb: true" creates the grey banner at the top of the page that, on the [setting up Julia]({{ site.url }}{{ site.baseurl }}/coding/julia/julia_setup) page for example, reads "START / CODING / JULIA / SETTING UP JULIA". This then allows the user to start from a page and work their way back up the hierarchy of files. Breadcrumbs rely on the categories listed on the page, and their order. If the order is incorrect to how the files are structured, the links will be broken. In the 'setting up Julia' page example, the coding category comes first followed by Julia. If you swap the order of these categories, the links will not be setup correctly.
IMPORTANT: make sure that the key is breadcrumb not breadcrumbs.

### Authors
If you create a webpage and want to take ownership for the content, or just allow for someone to contact you if they have questions, you can add the "authors" tag to the YAML. Note that it is plural even if there is only one author, and there can be multiple authors. This tag requires you to create a short profile in the file "_author/authors.yml". Your name is required, but email, siterole, and other options are optional. When creating your author profile, pick reference tag that is used internally to refer to all information you supply on the following lines. This doesn't have to have the form 'firstnamelastname', but it is easy to remember. This reference tag is what you will add to a post underneath the "authors" tag in the YAML, but your name is what will be displayed. When the page renders, your name will be hyperlinked to your section of the 'people' page that will list any other information you supply (email, bio, ...).


## Category Pages

Category pages form the basis of the webpage's organization by allowing us to separate information onto different pages, but still keeping similar information together. For example, VASP is software program with lots of things you can say about it. You can talk about how it's installed on different systems, how to run it to achieve different results, and how things can go wrong when using it. To avoid cluttering up one long page with all of these topics, they've been given their own pages that then show up on the VASP category page. The [below section](#underlying-file-structure) will deal with how the files that create these pages are structured among the other files. The subsections in this section will talk about how they work. 


### Top-level Categories

Top-level categories include basically all the pages that can be accessed via the top navigation bar. These categories serve to organize all sub-categories and pages into hopefully useful, but sufficiently broad, groups. This organization is achieved entirely through *categories and tags*, which makes them very important!

If you open any top-level category file, you will see that the majority of the text is Liquid, a templating language. The documentation for Liquid and Kramdown (the markdown renderer for Jekyll) are linked [below](#templating). However, they aren't the most useful. I will go through the common chunk of code found on these top-level category pages

```
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
```

The first section of code exists to allow us to sort the posts alphabetically. The first line creates an empty array 'titles' that we can fill with post titles. The for loop syntax is similar to coding languages like Python or Julia. We iterate over the collection 'site.tags.coding' and 'post' is the variable for the current element in the collection.

Jekyll makes it easy to access many collections of posts with this '.' notation. "site.xxx" accesses elements that are available to the whole site. We can replace 'xxx' with tags as in this example, or categories as can be found on other pages. 'site.data' allows us to access information within the '_data' folder, such as with 'site.data.authors' in the author layout. So we see that 'site.tags.coding' retrieves the collection of all posts on the site with the tag 'coding'. 

The vertical bar (pipe) allows us to chain commands together and they should be read left to right. In conjunction with an 'assign' statement they can be a little weird. Line 3 can be read "add the title associated with the current post to the array titles and overwrite titles with this new array". Similarily, line 5 is can be read "sort the elements of titles (ignoring upper/lowercase) and then assign the result to the variable 'sorted_titles'".

We now have an alphabetical array of posts that have the 'coding' tag and we want to print them to the page. We temporarily switch back to HTML syntax on line 7 to create a div for the posts and then start to loop through our sorted page titles. Because we need the URL associated with the post, we need to find the post object that has the same title. We do this by using the pipe syntax again to pick out the elements in the collection 'site.tags.coding' where the title matches. Due to weirdness with how the collections work, we need to grab the 0th index of this element (line 10). We can then switch back to our HTML to make a 4th level header style link. We obtain the URL using site elements (site.url and site.baseurl defined in the _config.yml) and post elements. We use the double curly brackets to access Liquid variables within the HTML.

By replacing 'coding' with other tags, we generate most of the top-level category pages. Sometimes there is surrounding supplemental HTML that changes the look a little bit, but this chunk of code forms the basis.

### Sub-categories

Like the top-level category pages, sub-category pages strongly depend on tags to generate their content. However, they use a short bit of Kramdown and an include statement instead of Liquid. The Kramdown "{: .t60}" creates a space of about 60 pixels between the title and the following posts. The "include" line basically inserts the contents of the file "_includes/list-posts" with the optional tag.

## Underlying File Structure



### File Names

### File Location

## Markdown and Templating Language Info

### Templating

#### Kramdown {:}
[Example](https://kramdown.gettalong.org/converter/html.html#toc)

#### Liquid {% raw %}{{}} {% endraw %}
[Example](https://jekyllrb.com/docs/liquid/)