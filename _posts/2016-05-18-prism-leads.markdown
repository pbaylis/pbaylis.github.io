---
layout: post
title:  "PRISM uses leads DRAFT"
date:   2016-05-18
categories: PRISM, weather, climate
---

As readers of this blog know, one way that climate economists project the impacts of climate change is by observing the relationships between historical weather realizations and economic outcomes. Recently, fellow ARE PhD student [Kendon Bell](http://www.kendonbell.com/) noticed an idiosyncrasy in PRISM, one of the weather datasets we frequently use in our analyses. Since many of us rely on high-quality daily weather data to do our work, Kendon and I thought readers of the blog might benefit from what we learned.

The [PRISM AN81-d](http://www.prism.oregonstate.edu/documents/PRISM_datasets.pdf) dataset is comprised of daily minimum temperature, maximum temperatures, and precipitation for the continental United States from 1981 to present. It is created by the [PRISM Climate Group](http://www.prism.oregonstate.edu/) at Oregon State, and it is *really* nice. Why? It's a gridded data product: it is composed of hundreds of thousands of 4km by 4km grid cells, where the values for each cell are determined by a [complex interpolation method](http://www.prism.oregonstate.edu/documents/Daly2008_PhysiographicMapping_IntJnlClim.pdf) from weather station data that accounts for topological factors. Importantly, it's consistent: there are no discontinuous jumps in the data (see Figure below) and the values are never missing.

![PRISM 30 year normals](/images/PRISM_tmax_30yr_normal_4kmM2_annual.png)

These benefits are well-understood, and many scientists have begun to use the PRISM data for their statistical models (*e.g., [Baylis 2016](http://patrickbaylis.com/files/Baylis_JMP.pdf)). However, a colleague of mine recently discovered a particularity of these data that may be important for some researchers: for the most part, values in the PRISM dataset refer to the day *before* the date listed.

The PRISM [documentation](http://prism.nacse.org/documents/PRISM_datasets.pdf) defines a "PRISM day" is:

> Station data used in AN81d are screened for adherence to a “PRISM day” criterion.  A PRISM day is defined as 1200 UTC-1200 UTC (e.g., 7 AM-7AM EST), which is the same as the AHPS day definition.  Once-per day observation times must fall within +/- 4 hours of the PRISM day to be included in the AN81d tmax and tmin datasets.  Stations without reported observation times in the NCEI GHCN-D database are currently assumed to adhere to the PRISM day criterion.  The dataset uses a day-ending naming convention, e.g., a day ending at 1200 UTC on 1 January is labeled 1 January.

The last sentence is important: because a day runs from 4am-4am PST and because days are labeled using the endpoint of that time period, *most of the observations from which the daily measures were constructed for a given date were taken from the day prior*. A diagram may be helpful here:

![Diagram](/images/prism_dates_example.png)

The above is a plot of temperature over about two days, representing a possible set of high-frequency temperature data being summarized by the PRISM daily data. The top x-axis is the real date, while the bottom x axis shows which observations are used under the PRISM day definition. The red lines are midnights and the orange (blue) dots in the diagram are the observations used to determine the daily maximum (minimum) temperatures for each PRISM day. Because of the definition of a PRISM day, the actual observations for the hottest hours (tmax) are both actually from the day prior to the date that they'll be tagged with in the data, while one of the coldest hours (tmin) is for the day prior, while the other is from the same day. In this case, the latter means that the minimum temperatures recorded for two consecutive days actually come from observations only a few hours apart, but on either side of the 4am barrier.

This wasn't intuitive to Kendon, so he got in touch with some of the researchers at PRISM, who were kind enough to respond to our queries. They confirmed that this is the case. As a further confirmation, I compared PRISM data to hourly weather station data from [NOAA's Quality Controlled Local Climatological Data](https://www.ncdc.noaa.gov/data-access/land-based-station-data/land-based-datasets/quality-controlled-local-climatological-data-qclcd) (QCLCD), aggregated it to the daily level using a midnight-to-midnight definition. Then I matched the two together and compared PRISM daily observations from the grid cell nearest to a weather station to the data from QCLCD dataset. The table below shows the pairwise correlations between the PRISM day-of observations, leads (next day), and the QCLCD data for both maximum and minimum daily temperature.

| PRISM day-of        | PRISM lead |
--------------------|------------|------
Maximum temperature | 0.934      | 0.995
Minimum temperature | 0.970      | 0.980

As you can see, the the PRISM leads, *i.e.*, observations from the next day, correlated more strongly with my aggregated data. The difference was substantial (0.934 to 0.995) for tmax, and less so for tmin (0.970 to 0.980), which should be expected given the diagram above: most temperature maximums will be drawn from the day before, but only some temperature maximums.

So who should be concerned about this? Mostly, researchers with econometric models that use daily variation in temperature on the right-hand side. As is, using the PRISM daily data amounts to estimating a model that includes lagged rather than day-of temperature.

To be clear, we are not suggesting that the PRISM group is doing anything wrong. Their definition matches a widely used definition of how to appropriately code weather data. But we do think researchers using their data to look at daily relationships, or interpolating between daily minimums and maximums to reproduce a more natural cycle, should be careful. A quick fix, particularly for models that include only maximum temperature, is to use the leads, or the observed weather for the next day, since it will almost always reflect the maximum temperature for the day of interest. Models with average or minimum temperature should, at the very least, tested for robustness with the lead values.
