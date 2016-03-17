---
layout: post
title:  "Fast Zonal Statistics"
date:   2016-03-17
categories: GIS, R, python, zonal statistics, optimization
---

Taking the average value of rasters by polygon is slow in R. Really slow. Using `extract` with a raster of more than 800k cells (PRISM weather data) and a shapefile of more than 3000 polygons (counties) takes a little over 500 seconds. Consider that I would like to do this for thousands of time periods (days), and it adds up. 

In this post, I document my search for a faster, Python-based solution. I plan to use the [`rasterstats`](http://pythonhosted.org/rasterstats/) package in Python. To do so, I'll need to load the raster using [`rasterio`](https://github.com/mapbox/rasterio) and the shapefile (of polygons) using [`fiona`](http://toblerity.org/fiona/). `rasterio` uses GDAL under the hood, so I may need to install that as well. 