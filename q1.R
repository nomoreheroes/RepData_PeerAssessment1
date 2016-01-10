library(dplyr)
rs = "activity.csv" %>%
  read.csv %>%
    group_by(date) %>%
      summarize(sum=sum(steps)) %>%
        .[["sum"]]
hist(rs, xlab="Number of steps, per day",col=1:5,main="Total number of steps per day")
mean.steps = mean(rs,na.rm=T)
median.steps = median(rs,na.rm=T)
print(mean.steps)
print(median.steps)
