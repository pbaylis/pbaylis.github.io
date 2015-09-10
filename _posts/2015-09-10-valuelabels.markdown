---
layout: post
title:  "Value labels and stata"
date:   2015-09-10
categories: stata, value labels
---

I've looked these up at least ten times.

    sysuse auto
    label dir

`origin` is our value label. 

1. Dereference a string using its value label:

    br if foreign == "Foreign":origin

2. Retrieve the value label from a numeric:

    di `:label origin 0'

