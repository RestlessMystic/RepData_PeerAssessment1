---
title: "Reproducible Research: Peer Assessment 1"
output: 
  html_document:
    keep_md: true
---


## Loading and preprocessing the data
>Including Libraries

```r
library("ggplot2")
```

```
## Warning: package 'ggplot2' was built under R version 3.0.3
```
>Reading Data

```r
unzip("Activity.zip")
data <- read.csv("activity.csv")
```
## What is mean total number of steps taken per day?
>Preparing Data

```r
sumvec <- rowsum(data$steps, data$date)
new.df <- cbind.data.frame(rownames(sumvec), sumvec)
colnames(new.df) <- c("day", "steps")
```
>Plotting Data

```r
m <- ggplot(new.df, aes(x=day, y = steps)) + 
      geom_histogram(stat = "identity") + theme(text = element_text(size=10),
       axis.text.x = element_text(angle=90, vjust=1)) 
print(m)
```

```
## Warning: Removed 8 rows containing missing values (position_stack).
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png) 
>Mean and Median

```r
steps.mean <- mean(sumvec, na.rm = TRUE)
steps.median <- median(sumvec, na.rm = TRUE)
print(paste("Mean is ", steps.mean, " and Median is ", steps.median))
```

```
## [1] "Mean is  10766.1886792453  and Median is  10765"
```
## What is the average daily activity pattern?
>Preparing Data

```r
new.df <- NULL
it <- unique(data$interval)
for(i in 1:length(it))
{
  new.df <- rbind.data.frame(new.df, c(it[i], mean(data$steps[data$interval == it[i]], na.rm = TRUE)))
  
}
colnames(new.df) <- c("Interval", "Average") 
```
>Plotting Data

```r
plot(new.df, type="l")
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png) 
>Maximum Activity

```r
print(paste("Maximum Activity happens at", new.df$Interval[new.df$Average == max(new.df$Average)], "with value ", max(new.df$Average)))
```

```
## [1] "Maximum Activity happens at 835 with value  206.169811320755"
```
## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
