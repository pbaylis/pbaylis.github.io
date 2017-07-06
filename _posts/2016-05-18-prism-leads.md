---
layout: post
title:  "Yesterday's Maximum Temperature is... Today's Maximum Temperature?"
date:   2016-05-18
categories: PRISM, weather, climate
---

As readers of this blog know, one way that climate economists project the impacts of climate change is by observing the relationships between historical weather realizations and economic outcomes. Recently, fellow ARE PhD student [Kendon Bell](http://www.kendonbell.com/) noticed an idiosyncrasy in PRISM, one of the weather datasets we frequently use in our analyses. Since many of us rely on high-quality daily weather data to do our work, Kendon and I thought readers of the blog might benefit from what we learned.

The [PRISM AN81-d](http://www.prism.oregonstate.edu/documents/PRISM_datasets.pdf) dataset is comprised of daily minimum temperature, maximum temperatures, and precipitation for the continental United States from 1981 to present. It is created by the [PRISM Climate Group](http://www.prism.oregonstate.edu/) at Oregon State, and it is *really* nice. Why? It's a gridded data product: it is composed of hundreds of thousands of 4km by 4km grid cells, where the values for each cell are determined by a [complex interpolation method](http://www.prism.oregonstate.edu/documents/Daly2008_PhysiographicMapping_IntJnlClim.pdf) from weather station data ([GHCN-D](https://data.noaa.gov/dataset/global-historical-climatology-network-daily-ghcn-daily-version-3)) that accounts for topological factors. Importantly, it's consistent: there are no discontinuous jumps in the data (see Figure below) and it's a balanced panel: the observations are never missing.

![PRISM 30 year normals](/assets/img/PRISM_tmax_30yr_normal_4kmM2_annual.png)

These benefits are well-understood, and many researchers, myself included, have begun to use the PRISM data for their statistical models. However, Kendon recently discovered a particularity of these data that may be important for some researchers: most measurements of temperature maximum, and some measurements of temperature minimums, actually refer to the maximum or minimum temperature of the day *before* the date listed.

To understand this, you have to understand that daily climate observations are actually summaries of many within-day observations. The reported maximum and minimum temperature are just the maximum and minimum temperature observations within a given day. The tricky part is that stations define a "day" differently, and there is a lot of heterogeneity across the United States. Most U.S. stations record in the morning, usually around 7am. The others record in the afternoon or evening.

PRISM aggregates data from these daily summaries, but in order to ensure consistency tries to only incorporate morning observers. This leads to the definition of a "PRISM day". The PRISM [documentation](http://prism.nacse.org/documents/PRISM_datasets.pdf) defines a "PRISM day" as:

> Station data used in AN81d are screened for adherence to a “PRISM day” criterion.  A PRISM day is defined as 1200 UTC-1200 UTC (e.g., 7 AM-7AM EST), which is the same as the [the National Weather Service’s hydrologic day].  Once-per day observation times must fall within +/- 4 hours of the PRISM day to be included in the AN81d tmax and tmin datasets.  Stations without reported observation times in the NCEI GHCN-D database are currently assumed to adhere to the PRISM day criterion.  The dataset uses a day-ending naming convention, e.g., a day ending at 1200 UTC on 1 January is labeled 1 January.

This definition means that generally only morning observers should be included in the data. The last sentence is important: because a day runs from 4am-4am PST (or 7am-7am EST) and because days are labeled using the endpoint of that time period, *most of the observations from which the daily measures are constructed for a given date are taken from the day prior*. A diagram may be helpful here:

![Diagram](/assets/img/prism_dates_example.png)

The above is a plot of temperature over about two days, representing a possible set of within-day monitor data. Let's say that this station takes a morning reading at 7am PST (10am EST), meaning that this station would be included in the PRISM dataset. The top x-axis is the actual date, while the bottom x axis shows which observations are used under the PRISM day definition. The red lines are actual midnights, the dark green dotted line is the PRISM day definition cutoff and the orange (blue) dots in the diagram are the observations used to determine the daily maximum (minimum) temperatures for each PRISM day. Because of the definition of a PRISM day, the actual observations for the hottest hours (tmax) are both observations from the day prior, while one of the coldest hours (tmin) is for the given day and the other is for the day prior. In this case, the latter means that the minimum temperatures recorded for two consecutive days actually come from observations only a few hours apart, but on either side of the 7am barrier.

This wasn't intuitive to Kendon, so he got in touch with some of the researchers at PRISM, who were kind enough to respond to our queries. They confirmed that this is *almost* the case. [Chris Daly](http://cbee.oregonstate.edu/prism), the director of the PRISM climate group, responded to Kendon's question regarding the usual timing of tmin:

> Because we have a grace period of +/- 4 hours around our 1200 UTC day definition, most morning observers are included in the current day. Therefore, it is likely that most tmin data will represent the morning of the date in the data. The date is taken from the ending day of the 12-12UTC period.

In short, tmin in the PRISM data should be the minimum temperature from the day given, and tmax should usually be the maximum temperature in the afternoon of the previous calendar day.

To see this a little more clearly, I pulled the GHCN data and plotted a histogram of the average reporting time by station for the stations that report observation time (66% in the United States). The histogram below shows the average observation time by stations for all GHCN-D stations in the continental United States in UTC, colored by whether or not they would be included in PRISM according to the guidelines given above.

![Histogram of observation time](/assets/img/obs_time_hist.png)

So most stations that report observation time are morning observers, and the PRISM day definition does a good job capturing the bulk of that distribution. On average, stations fulfilling the PRISM criterion report at 7:25am or so. We can use this to see which extreme temperatures will be reported as occuring on the actual day they occurred. The next two figures show histograms of observed maximum and minimum temperatures.

![Histogram of observed maximum temperatures](/assets/img/max_temp_hist.png)

![Histogram of observed minimum temperatures](/assets/img/min_temp_hist.png)

I've colored the histogram so that all maximum and minimum temperatures after 7:25am are red, indicating that maximum and minimums after that time will be reported as occuring during the following day. As expected, the vast majority of maximum temperatures (>94%) occur after 7:25am. But suprisingly, a good portion (32%) of minimum temperatures do as well. If you're concerned about the large number of minimum temperature observations around midnight, remember that a midnight-to-midnight summary is likely to have this sort of "bump", since days with a warmer-than-usual morning and a colder-than-usual night will have their lowest temperature at the end of the calendar day.

As a more direct check, I compared PRISM data to hourly weather station data from [NOAA's Quality Controlled Local Climatological Data](https://www.ncdc.noaa.gov/data-access/land-based-station-data/land-based-datasets/quality-controlled-local-climatological-data-qclcd) (QCLCD), aggregated it to the daily level using a midnight-to-midnight definition. Then I matched the two together and compared PRISM daily observations to QCLCD weather station observations. The table below shows the pairwise correlations between the PRISM day-of observations, leads (next day), and the QCLCD data for both maximum and minimum daily temperature.

Measure | PRISM day-of        | PRISM lead |
--------------------|------------|------
Maximum temperature | 0.934      | 0.992
Minimum temperature | 0.962      | 0.978

As you can see, the the PRISM leads, i.e., observations from the next day, correlated more strongly with my aggregated data. The difference was substantial for tmax. The result for tmin is surprising: it also correlates more strongly with the PRISM tmin lead. I'm not quite sure what to make of this - it may be that the stations who fail to report their observation times and the occasions when the minimum temperature occurs after the station observation time are combining to make the lead of tmin correlate more closely with the local daily summaries I've computed.

So who should be concerned about this? Mostly, researchers with econometric models that use daily variation in temperature on the right-hand side, and fairly high frequency variables on the left-hand side. As is, using the PRISM daily tmax data amounts to estimating a model that includes lagged rather than day-of temperature. A quick fix, particularly for models that include only maximum temperature, is to simply use the leads, or the observed weather for the next day, since it will almost always reflect the maximum temperature for the day of interest. Models with average or minimum temperature should, at the very least, tested for robustness with the lead values. Another approach is to make use of the whole distribution using hourly data like QCLCD, but then you would lose the nice gridded quality of the PRISM data.

To be clear, the PRISM group isn't doing anything wrong. Their definition matches a widely used definition of how to appropriately code weather data, and presumably they've thought carefully about the consequences of including more data from stations who don't report their observation times. But we do think researchers using their data to look at daily relationships, or interpolating between daily minimums and maximums to reproduce a more natural cycle, should be careful.
