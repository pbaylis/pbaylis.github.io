---
layout: default
title: Patrick Baylis
---

<center>
<img src="images/dvkilns.jpg" alt="Death Valley Kilns" width="60%" height="60%" class="shadow" />
</center>
***
#Posts

<ul class="posts">
  {% for post in site.posts %}
  <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
