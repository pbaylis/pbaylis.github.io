---
layout: default
title: Patrick Baylis
---
<h2>Blogs</h2>
***
#Posts

<ul class="posts">
  {% for post in site.posts %}
  <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
