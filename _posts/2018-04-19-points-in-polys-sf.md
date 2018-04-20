---
layout: post
title:  "Points in polys with sf"
date:   2018-04-10
categories: r sf
---

Suppose we want to know what which points (points.shp, here) lie within _any_ of a set of polygons (polys.shp, here) using `sf`.

```R
points.shp <- points.shp[apply(st_intersects(points.shp, polys), 1, any),]
```

This isn't an MWE but you get the idea. Also they will of course need to be
