---
layout: post
title:  "Speed test: fread (data.table) vs. read_csv (readr)"
date:   2017-02-07
categories: r "speed tests" fread data.table read_csv readr
---

I use `fread` (from the `data.table` package) for my day-to-day data munging in R, but occasionally `read_csv` (from the `readr` package) is more useful, for example when CSVs are formatted in a tricky way or when I'd prefer to have dates read in automatically. It's helpful to know what kind of performance tradeoff I'm making. Following code tests timings on reading both character and numeric vectors. Timings in comments in seconds.

```
library(data.table)
library(readr)
library(stringi)

# Create test dataframes
n <- 10000000
df1 <- data.frame(x=stri_rand_strings(n, 5, '[A-Z]'))
df1$x <-as.character(df1$x)
df2 <- data.frame(x=round(rnorm(n), 3))

dt1 <- data.table(df1)
dt2 <- data.table(df2)

system.time(write_csv(df1, "dt1_df.csv")) # 3.8
system.time(write_csv(df2, "dt2_df.csv")) # 3.1
system.time(fwrite(dt1, "dt1_dt.csv")) # 0.6
system.time(fwrite(dt2, "dt2_dt.csv")) # 1.3

system.time(in.df1 <- read_csv("dt1_df.csv")) # 4.9
system.time(in.df2 <- read_csv("dt2_df.csv")) # 2.2
system.time(in.dt1 <- fread("dt1_dt.csv")) # 2.7
system.time(in.dt2 <- fread("dt2_dt.csv")) # 1.0
```
So `data.table` is about three times as fast at writing and two times at fast at reading.
