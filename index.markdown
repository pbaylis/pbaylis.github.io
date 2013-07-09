---
layout: default
title: Patrick Baylis
---

<center>
<img src="images/bishoptent.jpg" alt="Bishop" width="60%" height="60%" class="shadow" />
</center>
<br>
***
<br>
<h1>Blog Posts</h1>
<ul class="posts">
  {% for post in site.posts %}
  <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
