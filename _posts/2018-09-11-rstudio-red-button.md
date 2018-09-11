---
layout: post
title:  "Things I forget: RStudio Server red button"
date:   2018-06-01
categories: r
---

How to blow up Rstudio and restart everything (if you have sudo privileges):

```bash
rm -rf ~/.rstudio
rstudio-server kill-all
```

Related note: It's a good idea to turn off workspace saving and reloading of `.RData` when using RStudio server.
