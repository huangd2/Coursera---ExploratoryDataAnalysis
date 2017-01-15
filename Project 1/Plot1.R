## Plot1.png and save it. Including load_data
setwd("/Users/Yun/Desktop/DS")
Plot1 <- function(){
  source("load_data.R")
  df <- load_data()
  ## making plot
  png("Plot1.png", width = 480, height = 480, units = "px")
  hist(df$Global_active_power, main = "Global Active Power", 
       col = "red", xlab = "Global Active Power (kilowatts)")
  dev.off()
}
