#library("ggplot2")

unzip("Activity.zip")
data <- read.csv("activity.csv")

new.df <- NULL
it <- unique(data$interval)
for(i in 1:length(it))
{
  new.df <- rbind.data.frame(new.df, c(it[i], mean(data$steps[data$interval == it[i]], na.rm = TRUE)))
  
}
colnames(new.df) <- c("Interval", "Average") 
  



#sumvec <- rowsum(data$steps, data$date)
#new.df <- cbind.data.frame(rownames(sumvec), sumvec)
#colnames(new.df) <- c("day", "steps")

#png("plot.png")
#m <- ggplot(new.df, aes(x=day, y = steps)) + 
#      geom_histogram(stat = "identity") + theme(text = element_text(size=10),
#       axis.text.x = element_text(angle=90, vjust=1)) 
#print(m)
#dev.off()

#steps.mean <- mean(sumvec, na.rm = TRUE)
#steps.median <- median(sumvec, na.rm = TRUE)
