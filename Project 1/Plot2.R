## Plot2.png and save it. Including load_data
setwd("/Users/Yun/Desktop/DS")
Plot2 <- function(){
  source("load_data.R")
  df <- load_data()
  
  ## making plot
  png("Plot2.png", width = 480, height = 480, units = "px")
  plot(df$Time, df$Global_active_power, 
                type = 'l',
                xlab = "",
                ylab = "Global Active Power (kilowatts)")

  dev.off()
}