---
layout: post
title:  "Speed test: pattern matching in R"
date:   2017-02-07
categories: r "speed tests" grep stringi stringr
---

What's the fastest way to match strings? This code compares `grep` to `stri_detect_*` (from the `stringi` package), considering both fixed and regex matching.
```
library(microbenchmark)
library(stringi)
library(ggplot2)

R <- 100000
g <- replicate(R, paste0(sample(c(letters[1:5]," "), 10, replace=TRUE),
                               collapse=""))

m <- microbenchmark(
  grep(" ", g ),
  stri_detect_regex(g, " "),
  grep(" ", g, perl=TRUE),
  grep(" ", g, fixed=TRUE),
  stri_detect_fixed(g, " ")
)
autoplot(m)
```

![png](/assets/img/pattern_matching_benchmark.png)

Results are similar for `gsub`. For a comparison of `stringi` to `stringr`, see [here](https://rud.is/b/2017/02/06/strung-out-on-string-ops-a-brief-comparison-of-stringi-and-stringr/).
