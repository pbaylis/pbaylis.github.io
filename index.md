---
layout: default
title: Patrick Baylis
---

<img src="images/bishoptent.jpg" alt="Bishop" width="25%" height="25%">

<h1>Blog Posts</h1>
<ul class="posts">
  {% for post in site.posts %}
  <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
