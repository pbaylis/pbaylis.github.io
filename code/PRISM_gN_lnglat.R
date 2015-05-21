## Function to convert gridNum to row, col, lat, lng -----

setwd("E:/prism")
library(foreign)

nrow <- 621
ncol <- 1405
ul.lng <- -125
ul.lat <- 49.9166666666687
res <- 0.04166666666667

gridNum.to.lnglat <- function(gridNum) {
  row <- floor((gridNum - 1) / ncol) + 1
  col <- (gridNum - 1) %% ncol + 1
  cent.lat <- ul.lat - res * (row - 1)
  cent.lng <- ul.lng + res * (col - 1)
  df <- data.frame(gridNum, row, col, cent.lng, cent.lat)
}

allcells <- 1:(621*1405)
allcells.df <- gridNum.to.lnglat(allcells)

write.dta(allcells.df, "gridNum_to_lnglat.dta")

# Function to convert latlng to gridnum

lnglat.to.gridNum <- function(lng, lat) {
  row <- ceiling((ul.lat - lat + res/2) / res)
  col <- ceiling((lng - ul.lng + res/2) / res)
  gridNum <- (row - 1) * ncol + col
  df <- data.frame(lng, lat, gridNum, row, col)
}

# Just to check...
allcells2.df <- lnglat.to.gridNum(allcells.df$cent.lng, allcells.df$cent.lat)

# Find Max's LA gridNum
max.test <- lnglat.to.gridNum(-118.2917, 33.95848)