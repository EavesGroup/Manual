---
layout: page-fullwidth
subheadline:  ""
title:  "Commenting in Mathematica"
teaser: "Have you ever wanted your Mathematica notebooks to look nicely organized and polished? Look here for tips that will help you get there."
categories:
    - Mathematica
tags:
    - Mathematica
    - commenting
header: no
breadcrumb: true
author: sinalewis
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

### Cell Format

Mathematica uses input and output cells to organize the contents of a notebook. As of version 13, there is a dropdown to select the format of the current cell. In older versions these formats were available by going to the `Format > Style` tab in the menu bar. Some useful format options are: `input`, `code`, `item`, `title`, `section`, and `program`. `Input` is the default cell format for expression evaluation. `Code` is a formatted version of `input` that has a grey background. `Item` is my default for adding comments in between code cells. This cell format is prefaced by a red square and can be quickly formatted by starting the cell with an asterisk. `Title`, `section`, and their sub-options each have different colors (typically in black, grey, red, or orange for the default stylesheet) and different font sizes. `Section` additionally has a horizontal line at the beginning of the cell to further separate it from the preceding content. `Program` cells have horizontal lines both before and after the content of the cell and the text is in a monospace font. Text cells (primarily cells that are NOT `input` or `code`) cannot be evaluated and will be ignored if you evaluate them or the entire notebook.

### Inline Commenting

I recommend only using the inline commenting, i.e. `(* comment *)` to add brief notes after variables. For example:
```
x = "purple"; (* my favorite colour *)
```
Of course, this doesn't negate the need to use sensible variable names whenever possible!

### Deleting a Cell

Pressing backspace on an empty cell does not remove it! Instead, note the brackets on the far right of the window. Each cell has a corresponding bracket that deletes the cell when you select the bracket and press backspace/delete. Mathematica automatically groups together input cells with their corresponding output cells, so you will most commonly see two brackets wrapped in one larger one. If you use chapter, section, subsection, etc. cell formats, the following cells will be wrapped in a bracket with the text cell at the top. You can then hide a group of cells by right-clicking on the bracket of the level that you want to close and selecting `Open/Close Group`. This adds a handy little dropdown graphic to the text cell that when clicked re-opens/closes the group easily. 