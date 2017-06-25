---
layout: post
title:  "Bins and fixed effects"
date:   2017-02-07
categories: r econometrics bins "fixed effects"
---

```R
3*4*200
```


2400



```R
library(ggplot2)

# create factors with value labels
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
  	labels=c("3gears","4gears","5gears"))

qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5),
   main="Distribution of Gas Milage", xlab="Miles Per Gallon",
   ylab="Density")
```

![png](/assets/img/output_1_1.png)
