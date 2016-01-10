library(dplyr)
rs = "activity.csv" %>%
  read.csv

na.quantity = sum(!complete.cases(rs))

rs2 = rbind(data.frame(),rs)


for(row in 1:nrow(rs)) {
  if(is.na(rs[row,"steps"])) {
    c.date = rs[row,"date"]
    rs2[row,"steps"] = mean(rs["date"==c.date,"steps"],na.rm=T)
  }
}

rs = rs %>%
  group_by(date) %>%
  summarize(sum=sum(steps)) %>%
  .[["sum"]]

rs2 = rs2 %>%
  group_by(date) %>%
  summarize(sum=sum(steps)) %>%
  .[["sum"]]

hist(rs2, xlab="Number of steps, per day",col=1:5,main="Total number of steps per day")

mean.steps.original = mean(rs,na.rm=T)
median.steps.original = median(rs,na.rm=T)

mean.steps.imputed = mean(rs,na.rm=T)
median.steps.imputed = median(rs,na.rm=T)

answers = c(mean.steps.original,mean.steps.imputed,median.steps.original,median.steps.imputed)
names(answers) = c("mean of the original","mean of the imputed","median of the original","median of the imputed")

print(answers)
