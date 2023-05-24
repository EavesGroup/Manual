---
layout: page
show_meta: false
title: "Lab Life: Memes Edition"
header: no
permalink: "/memes/"
---

<style>
body {
  font-family: Verdana, sans-serif;
  margin: 0;
}

* {
  box-sizing: border-box;
}

.row > .column {
  padding: 0 8px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

.column {
  float: left;
  width: 25%;
}

/* The Modal (background) */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: black;
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  width: 90%;
  max-width: 1200px;
}

/* The Close Button */
.close {
  color: white;
  position: absolute;
  top: 10px;
  right: 25px;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #999;
  text-decoration: none;
  cursor: pointer;
}

.mySlides {
  display: none;
}

.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

img {
  margin-bottom: -4px;
}

.caption-container {
  text-align: center;
  background-color: black;
  padding: 2px 16px;
  color: white;
}

.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

img.hover-shadow {
  transition: 0.3s;
}

.hover-shadow:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>

<!-- increment num_imgs for each added file -->
{% assign num_imgs = 9 %}
<!-- add image filename and caption, one per line with the line ended by a colon -->
{% capture imgData %}
chatGPT_dealership.png, The Eaves Group Dealership as told by ChatGPT:
chatGPT_play.png, Day in the Life of the Eaves Group:
machine_learning_xkcd.png, Machine Learning as told by xkcd:
phd092421s.gif, PhD Comics:
IMG_20230524_113752.png, We end the article by ceasing to write. For how else could this article be over if we didn't first stop? -- Alex:
IMG_20230524_113823.png, xkcd on a physicist first encountering a new subject:
IMG_20230524_113828.png, Edit by Alex of xkcd comic:
IMG_20230524_113906.png, Is my method just Redfield?:
IMG_20230524_114044.png, The cycle of research:
IMG_20230524_114056.png, The evolution of programming; machine language > C > Julia.
{% endcapture %}

{% assign imgData = imgData | split: ":" %}

<div class="row">
{% for entry in imgData limit:3 reversed%}
{% capture total_img %}{% increment img_num %}{% endcapture %}
{% assign img = entry | split: ", " | first | strip %}
{% assign caption = entry | split: ", " | last %}
<div class="medium-4 columns"><img class="t60" style="width=100%" onclick="openModal();currentSlide({{ img_num }})" class="hover-shadow cursor" src="{{ site.urlimg }}memes/{{ img }}" caption="{{ caption }}"></div>
{% endfor %}
</div>

<!-- Copy this section for every additional image over a multiple of 3 -->
<div class="row">
{% for entry in imgData limit:3 offset: continue %}
{% capture total_img %}{% increment img_num %}{% endcapture %}
{% assign img = entry | split: ", " | first  | strip %}
{% assign caption = entry | split: ", " | last %}
<div class="medium-4 columns"><img class="t60" style="width=100%" onclick="openModal();currentSlide({{ img_num }})" class="hover-shadow cursor" src="{{ site.urlimg }}memes/{{ img }}" caption="{{ caption }}"></div>
{% endfor %}
</div>

<div class="row">
{% for entry in imgData limit:3 offset: continue %}
{% capture total_img %}{% increment img_num %}{% endcapture %}
{% assign img = entry | split: ", " | first  | strip %}
{% assign caption = entry | split: ", " | last %}
<div class="medium-4 columns"><img class="t60" style="width=100%" onclick="openModal();currentSlide({{ img_num }})" class="hover-shadow cursor" src="{{ site.urlimg }}memes/{{ img }}" caption="{{ caption }}"></div>
{% endfor %}
</div>


<div id="myModal" class="modal">
  <span class="close cursor" onclick="closeModal()">&times;</span>
  <div class="modal-content">
  {% for entry in imgData %}
{% capture total_img %}{% increment img_number %}{% endcapture %}
{% assign img = entry | split: ", " | first | strip %}
{% assign caption = entry | split: ", " | last %}
    <div class="mySlides">
      <div class="numbertext">{{ img_number }} / {{ num_imgs }}</div>
      <img src="{{ site.urlimg }}memes/{{ img }}" style="width:100%">
    </div>
{% endfor %}
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
    <div class="caption-container">
      <p id="caption"></p>
    </div>
    {% for entry in imgData %}
{% capture total_img %}{% increment img_number %}{% endcapture %}
{% assign img = entry | split: ", " | first | strip %}
{% assign caption = entry | split: ", " | last %}
    <div class="column">
      <img class="demo cursor" src="{{ site.urlimg }}memes/{{ img }}" style="width:100%" onclick="currentSlide({{ img_num }})" alt="{{ caption }}">
    </div>
    {% endfor %}
  </div>
</div>

<script>
function openModal() {
  document.getElementById("myModal").style.display = "block";
}

function closeModal() {
  document.getElementById("myModal").style.display = "none";
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
    