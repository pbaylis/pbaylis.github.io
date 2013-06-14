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

Fortunately, there is a [githubp] to help me out. Right now I'm going to try just uploading the whole thing - the second option. Unfortunately I am a github newbie, so I'm going to document the steps below. 

{% highlight bash %}
cd ~/git
git clone https://github.com/pbaylis.github.io
cd pbaylis.github.io
{% endhighlight %}
Next I made the required changes to the repository and uploaded them using:
{% highlight bash %}
git add .
git commit -m 'first upload'
git push origin master
{% endhighlight %}
N.B.: `origin` and `master` seem to be some kind of `git clone`-created aliases that I can use.  Now that I've created this already, I wonder what happens when I want to push the updates I've made here?  To test this, I'll load up a new terminal session and head back to the directory. I can use the same commands as above to upload. The hidden `.git` folder in the directory (created by `git clone`) seems to remember whatever I need. 

On `.gitignore`: Because github runs jekyll server side (and completely hidden from me), I don't need to upload the `_site` directory that my client side jekyll creates.  By adding that folder to the `.gitignore` file I prevent that. 

On `git add . -A`: the option `-A` or `-all` stages new and modified files *and* removes files no longer in the working tree. Makes cleaning out easy. 

[githubp]: https://help.github.com/articles/using-jekyll-with-pages "github page"
