library(dplyr)
library(ggplot2)
rs = "activity.csv" %>%
  read.csv

weekends.or.weekdays = function(x){
  w = as.POSIXlt(as.Date(x, "%Y-%m-%d"))$wday
  if (w == 0 | w == 6) {
    "weekend"
  } else "weekday"
}
rs$day = vapply(rs$date,weekends.or.weekdays,character(1))
rs$day = as.factor(rs$day)

rs = rs %>%
  group_by(interval,day) %>%
    summarize(mean.steps=mean(steps,na.rm=T))

p = qplot(interval, mean.steps, data=rs, geom=c("line"), xlab="Interval", 
      ylab="Number of steps",facets=.~day)

print(p)