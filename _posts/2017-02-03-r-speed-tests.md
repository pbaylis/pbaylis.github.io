---
layout: post
title:  "R speed tests"
date:   2017-02-03
categories: r speed
---

### R date conversion speed test (as.IDate vs fast_strptime)

```r
require(data.table)
require(lubridate)

n <- 10000000
x <- rep("2014-01-01", n)

system.time(r1 <- as.IDate(x, format="%Y%m%d"))
system.time(r2 <- as.IDate(parse_date_time(x, orders="%Y%m%d", exact=T)))
system.time(r3 <- as.IDate(fast_strptime(x, format="%Y%m%d")))
```

Winner: `fast_strptime` by a factor of two over the `IDate` parser (which is also the `Date` parser?).

### Pattern matching (grep vs str)

### Read CSV (fread vs read_csv)

### Write CSV (fwrite vs write_csv)
