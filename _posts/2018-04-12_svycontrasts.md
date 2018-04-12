---
layout: post
title:  "Linear combinations of coeffients in R"
date:   2018-04-12
categories: r econometrics lincom svycontrast
---

One of the few features I miss from Stata is the very-intuitive `lincom` command. I haven't found an easy equivalent in R, but most of the time I recreate that functionality with `survey::svycontrast`. But, I always forget the syntax.

```R
library(survey)
library(data.table)

N <- 100
dt <- data.table(x1 = rnorm(N), x2 = rnorm(N))
dt[, y := 1 + 3 * x1 - 2 * x2 + rnorm(N, 0, 0.5)]

fit <- lm(y ~ x1 + x2, data = dt)
svycontrast(fit, c("x1" = 1, "x2" = 1))
```
