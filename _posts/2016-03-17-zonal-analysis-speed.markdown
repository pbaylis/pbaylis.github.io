---
layout: post
title:  "Fast Zonal Statistics"
date:   2016-03-17
categories: GIS, R, python, zonal statistics, optimization
---

Taking the average value of rasters by polygon is slow in R. Really slow. Using `extract` with a raster of more than 800k cells (PRISM weather data) and a shapefile of more than 3000 polygons (counties) takes a little over 500 seconds. Consider that I would like to do this for thousands of time periods (days), and it adds up. 

In this post, I document my search for a faster, Python-based solution. I plan to use the [`rasterstats`](http://pythonhosted.org/rasterstats/) package in Python. To do so, I'll need to load the raster using [`rasterio`](https://github.com/mapbox/rasterio) and the shapefile (of polygons) using [`fiona`](http://toblerity.org/fiona/). `rasterio` uses [`GDAL`](http://www.gdal.org/) under the hood, so I may need to [install](http://trac.osgeo.org/osgeo4w/wiki) that as well. 

    1. Install [Anaconda Python](pip install GDAL-1.11.2-cp27-none-win32.whl) (trying to upgrade `pip` broke it, so I just reinstalled Ananconda)
    2. Install gdal 1.11.4 (not 2.0), fiona, rasterio, shapely, and rasterstats
        - May need to install some from [binaries](http://www.lfd.uci.edu/~gohlke/pythonlibs/) if using Windows

Code:

    import csv
    from rasterstats import zonal_stats

    # GLOBALS
    RAST = 'E:/prism/data/zipped/PRISM_tmin_stable_4kmD1_20150531_bil.bil'
    POLY = 'E:/prism/data/census/gz_2010_us_050_00_20m/gz_2010_us_050_00_20m.shp'

    # Run zonal_stats
    stats = zonal_stats(POLY, RAST, stats=['count', 'mean', 'min', 'max'], all_touched=True, geojson_out=True)

    # Save to CSV
    keys = stats[0]['properties'].keys()
    with open('E:/prism/out.csv', 'wb') as output_file:
        dict_writer = csv.DictWriter(output_file, keys)
        dict_writer.writeheader()
        for row in stats:
            dict_writer.writerow(dict((k, v.encode('utf-8')) if isinstance(v, basestring) else (k,v) for k, v in row['properties'].iteritems()))
