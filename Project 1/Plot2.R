## Plot2.png and save it. Including load_data
setwd("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 1")
Plot2 <- function(){
  source("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 1/load_data.R")
  df <- load_data()
  
  ## making plot
  png("Plot2.png", width = 480, height = 480, units = "px")
  plot(df$Time, df$Global_active_power, 
                type = 'l',
                xlab = "",
                ylab = "Global Active Power (kilowatts)")

  dev.off()
}