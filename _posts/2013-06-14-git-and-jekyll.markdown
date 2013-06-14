---
layout: post
title:  "Using git and jekyll"
date:   2013-06-14
categories: jekyll git
---

Just like Hyde, `git` was destined to be with `jekyll`...

I want to move the jekyll site on my computer to github pages.  I have a few options:
- I can just upload the output created by jekyll itself, but then I'll have no way to edit the pages (unless I leave the source in Dropbox)
- I can just upload the source files and let the server-side jekyll take care of it. 

Fortunately, there is a [githubp] to help me out. Right now I'm going to try just uploading the whole thing. Unfortunately I am a github newbie, so I'm going to document the steps below. 

{% highlight bash %}
cd ~/git
git clone https://github.com/pbaylis.github.io
cd pbaylis.github.io
{% endhighlight %}
Next I made the required changes to the repository and uploaded them using:
{% highlight bash %}
git add .
git commit
git push origin master
{% endhighlight %}
N.B.: `origin` and `master` seem to be some kind of `git clone`-created aliases that I can use.  Now that I've created this already, I wonder what happens when I want to push the updates I've made here?


[githubp]: https://help.github.com/articles/using-jekyll-with-pages "github page"
