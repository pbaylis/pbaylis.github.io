---
layout: post
title:  "PRISM uses leads DRAFT"
date:   2016-05-18
categories: PRISM, weather, climate
---

The basic proposition of the empirical climate impacts literature is that we can learn something about future climate change by observing the relationships between historical weather realizations and the economic impacts of interest. Of course, to run this analysis, we need data on both.

Historical weather data is widely available from a variety of sources, but one convenient source for many researchers working on topics in the United States is the [PRISM AN81-d](http://www.prism.oregonstate.edu/documents/PRISM_datasets.pdf) dataset, which is comprised of daily minimum and maximum temperatures and precipitation for the continental United States from 1981 to present. The PRISM dataset, created by the [PRISM Climate Group](http://www.prism.oregonstate.edu/) at Oregon State, and it is *really* nice. Why? It's a gridded data product: it has 4km by 4km grid cells, where the values for each cell are determined by a [complex interpolation method](http://www.prism.oregonstate.edu/documents/Daly2008_PhysiographicMapping_IntJnlClim.pdf) from weather station data that accounts for topological factors. Importantly, it's consistent: there are no discontinuous jumps in the data (see Figure below) and the values are never missing.

INSERT PICTURE FROM PRISM

These benefits are well-understood, and many scientists have begun to use the PRISM data for their statistical models INSERT REFERENCES HERE. However, a colleague of mine recently discovered a particularity of these data that may be important for some researchers: for the most part, values in the PRISM dataset refer to the day prior.

The PRISM [documentation](http://prism.nacse.org/documents/PRISM_datasets.pdf) defines a "PRISM day" as follows:

> Station data used in AN81d are screened for adherence to a “PRISM day” criterion.  A PRISM day is defined as 1200 UTC-1200 UTC (e.g., 7 AM-7AM EST), which is the same as the AHPS day definition.  Once-per day observation times must fall within +/- 4 hours of the PRISM day to be included in the AN81d tmax and tmin datasets.  Stations without reported observation times in the NCEI GHCN-D database are currently assumed to adhere to the PRISM day criterion.  The dataset uses a day-ending naming convention, e.g., a day ending at 1200 UTC on 1 January is labeled 1 January.

The last sentence is important: because a day runs from 4am-4am PST and because days are labeled using the endpoint of that time period, *most of the observations from which the daily measures were constructed for a given date were taken from the day prior*. A diagram may be helpful here:

![Diagram](/images/prism_dates_example.png)

Date       | tmin | tmax | ppt
-----------|------|------|-----
2016-05-02 | 10   | 20   | 0   | <-- Refers to 2016-05-01

But this wasn't intuitive to us, so Kenny got in touch with some of the researchers at PRISM, who were kind enough to respond to our queries. They confirmed that this is the case. What does this mean? Well, suppose that a researcher is interested in using the PRISM data for an analysis on the East Coast
