---
layout: post
title:  "My Jekyll Notes"
date:   2013-06-14
categories: jekyll 
---

# What I've learned today:
- Making lists is pretty easy in `markdown`.

	- It's best to use `-` to mark off a list instead of `*`, since sub-lists don't seem to work with `*`
	- Also need double line breaks between list and sublist for sublists to work properly. This doesn't seem to be entirely consistent, though...

- Marking off `<code>` is also easy!

- `jekyll serve -w` is a neat trick to avoid building and then serving every time

	- It also updates the site automatically whenever I save it, as long as it's serving. Not sure if this is a function of the `-w` or just how the `serve` function works.
- It's important to *remember* that I **need** to use backticks, i.e. \` \` to mark off code though. Otherwise Maruku (the markdown interpreter) _flips out_.
- I can modify lots of configuring settings (including the directories created for the posts) in `_config.yml`

## Let's try some R code

Code shameless swiped from [rexamples].  Note that syntax highlighting actually from Liquid, I believe... 

{% highlight r %}
# To make vectors "x" "y" "year" and "names"
x <- c(2,3,7,9)
y <- c(9,7,3,2)
year <- 1990:1993
names <- c("payal", "shraddha", "kritika", "itida")
{% endhighlight %}

Note that to get space after the end of a code block we just can just use a normal HTML tag, like `<br>`.<br>

Quotation!
=========
> Blockquotes don't do much, possibly because CSS isn't set up to deal with them?
> > Even blockquotes on blockquotes are pretty boring. 

[rexamples]: http://www.mayin.org/ajayshah/KB/R/html/b1.html "R Examples"
