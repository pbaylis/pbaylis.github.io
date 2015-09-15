---
layout: default
title: Patrick Baylis | code
---
<h1 align="right">code</h1>
***

<figure style="float:right; margin:0px 10px 0px 10px;">
<img src="images/makebins.png" width="120" title="Regression using makebins.ado" class="shadow" />
  <figcaption>Table using makebins.ado</figcaption>
</figure> 

[gen_heat_index.ado](https://gist.github.com/pbaylis/5cc38e5c8415d87b9b28): Stata program to get heat index for given dry bulb temperature and relative humidity. Follows the heat index [wiki](https://en.wikipedia.org/wiki/Heat_index).

[gen_relative_humidity.ado](https://gist.github.com/pbaylis/15cdc8fd59e1888705ae) Stata program to get relative humidity given temperature and dew point. 

[makebins.ado](https://gist.github.com/pbaylis/7c641b91fcea1e32d3d8): Stata program to generate dummy variable bins of a variable. Bottom and top bins run from edge to negative infinity and infinity, respectively. Also generates good-looking custom labels for regression tables. 

[PRISM_gN_lnglat.R](https://gist.github.com/pbaylis/54b47ba1edca02d05f52): R code to get latlng centroids from PRISM grid cell numbers, and to convert latlng to PRISM grid cell. Useful for matching to [http://prism.oregonstate.edu/](PRISM Climate Group) weather data. Also usable for other gridded datasets with some changes to parameters.

<figure style="float:left; margin:10px 10px 10px 10px;">
<img src="images/tmean_gridavg.png" width="400" title="PRISM temperature means" class="shadow" />
  <figcaption>PRISM temperature means</figcaption>
</figure> 