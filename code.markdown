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

[makebins.ado](code/makebins.ado) : Stata program to generate dummy variable bins of a variable. Bottom and top bins run from edge to negative infinity and infinity, respectively. Also generates good-looking custom labels for regression tables. 

[PRISM_gN_lnglat.R](code/PRISM_gN_lnglat.R): R code to get latlng centroids from PRISM grid cell numbers, and to convert latlng to PRISM grid cell. Useful for matching to [http://prism.oregonstate.edu/](PRISM Climate Group) weather data. Also usable for other gridded datasets with some changes to parameters.

<figure style="float:left; margin:10px 10px 10px 10px;">
<img src="images/tmean_gridavg.png" width="400" title="PRISM temperature means" class="shadow" />
  <figcaption>PRISM temperature means</figcaption>
</figure> 