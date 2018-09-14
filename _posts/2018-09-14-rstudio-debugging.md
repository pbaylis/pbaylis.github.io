---
layout: post
title:  "Debugging in R, RStudio"
date:   2018-09-11
categories: r
---

Debugging can be a challenge in RStudio. One of my main frustrations is that once you execute the Run command on a selection of code (i.e., running it in interactive mode), it will send all the commands you selected, _even if one or more of them raises an error_. This often results in me running a full script, even after an error occurs on one of the first few lines of code. In most cases, nothing remaining in the script can run successfully without whatever errored out earlier. For example, suppose I'm executing the following code:

```r
x <- y + 1
z <- x + 2
```

Because I forgot to define `y` before calling it, the first command fails with an error. But because I'm running this interactively, the second command fails as well. In this toy example, this is no big deal, but if the second command is actually something time consuming then I may end up waiting for a long time for it to execute and/or restarting R. Or, if the second command runs successfully and modifies an object I'll use later, but subsequent commands fail, I can no longer easily fix the problem by fixing the first command and rerunning the next commands and will have to manually pick and choose what lines to run. This is a total pain when working with large datasets.

Unfortunately, there's no way to solve this in interactive mode -- RStudio seems to be committed to [running everything you send](https://stackoverflow.com/questions/42256291/make-execution-stop-on-error-in-rstudio-interactive-r-session), no matter what. The best solution is to instead source the document (CTRL-S in RStudio), which runs the entire script from the beginning. This is fine if you don't have a bunch of data you need to load initially. But since I often do, I have to comment out everything I don't want re-run.

One alternative to this is encasing everything in a function, since functions do halt on errors. This makes debugging and development challenging (despite the `browser()` command), so I view this as a less-useful solution.

I'm still thinking this over, but here are a general set of principles for efficient debugging in a research context:
1. Minimize overall execution time whenever possible -- sample from datasets and save intermediary datasets that are time-consuming to compile.
2. If the above is not possible, run from source (commenting higher up portions as needed - this can be made easier with intermediary datasets) instead of interactively.
    1. Functionalize as much as possible.
