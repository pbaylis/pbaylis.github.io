---
layout: post
title:  "More on git"
date:   2013-06-14
categories: jekyll git
---

Here's how to clean out the github folder.  First, to remove the `_site` folder (which is no longer being updated since I put it in `.gitignore`) and the `.gitignore~` backup file:

{% highlight bash %}
git rm -r _site
git rm --cached .gitignore~
git add . -A
git commit -m "removing unnecessary files"
git push origin master
{% endhighlight %}

Note that the `-r` flag does recursive removal (just like bash!) and the `--cached` flag deletes the file on the server but not on my machine.
