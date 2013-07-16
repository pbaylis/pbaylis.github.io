---
layout: post
title:  "Using nested lists in markdown"
date:   2013-07-14
categories: markdown
---

When using the markdown interpreter `maruku` I found some odd behavior with nested lists. For example, I had to put extra spaces to get lists to indent correctly if the nested ones had only one item, there was automatically extra spaces inserted after list creation, and some other issues. After pulling my hair out for a while, I finally went and found a [maruku help document][marukuex]. Turns out they were using similar workarounds. I switched over to `RDiscount`, a different markdown interpreter already implemented in `jekyll` that seems to be more reasonable.

Works great when using `RDiscount`. I can't show how it looks in `maruku` since it's a global setting. But it doesn't.

* A nested list with only one subitem
  * works great!

Code for the above:

     * A nested list with only one subitem
       * works great!

Multiple nesting with numbers is also useful:

1. Note that numbered
   2. lists
   99. basically
   3. ignore
3. whatever hare-brained numbering scheme
   33. you choose

Code for the above:

    1. Note that numbered
       2. lists
       99. basically
       3. ignore
    3. whatever hare-brained numbering scheme
       33. you choose

One final note: code blocks in `emacs` can also be tricky.  Easiest way is to type code as usual. Then, to indent, use emacs command `C-u 4 C-x <TAB>`. This is probably not the best way, but it works.  

[marukuex]: http://maruku.rubyforge.org/maruku.md