## Plot3.png and save it. Including load_data
setwd("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 1")
Plot3 <- function(){
  source("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 1/load_data.R")
  df <- load_data()
  png("Plot3.png", width = 480, height = 480, units = "px")
  plot(df$Time, df$Sub_metering_1, 
       type = 'l',
       xlab = "",
       ylab = "Energy sub metering",
       col = "black")
  lines(df$Time, df$Sub_metering_2, col = "red")
  lines(df$Time, df$Sub_metering_3, col = "blue")
  legend("topright", col = c("black","red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = 1)  

  ## or use ggplot
  # library(ggplot2)
  # ggplot(df, aes(df$Time))+
  # geom_line(aes( y = df$Sub_metering_1))+
  # geom_line(aes( y = df$Sub_metering_2))+
  # geom_line(aes( y = df$Sub_metering_3))
  
  
  dev.off()
}