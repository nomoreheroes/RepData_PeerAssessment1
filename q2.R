library(dplyr)
rs = "activity.csv" %>%
  read.csv %>%
  group_by(interval) %>%
  summarize(mean.steps=mean(steps,na.rm=T))

plot(rs$interval,rs$mean.steps, type="l",xlab="Interval", ylab="Average number of steps", main="Average number of steps averaged over all days")
max.steps.interval = rs[which.max(rs$mean.steps),]
print(max.steps.interval)
