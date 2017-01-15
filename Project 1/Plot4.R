## Plot4.png and save it. Including load_data
setwd("/Users/Yun/Desktop/DS")
Plot4 <- function(){
  source("load_data.R")
  df <- load_data()
  png("Plot4.png", width = 480, height = 480, units = "px")
  
  par(mfrow = c(2,2))
  with(df,{
    plot(Time, Global_active_power, type = 'l')
    plot(Time, Voltage, type = 'l', xlab = "datetime")
    plot(df$Time, df$Sub_metering_1, 
         type = 'l',
         xlab = "",
         ylab = "Energy sub metering",
         col = "black")
    lines(df$Time, df$Sub_metering_2, col = "red")
    lines(df$Time, df$Sub_metering_3, col = "blue")
    legend("topright", col = c("black","red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = 1, box.lwd = 0)
    plot(Time, Global_reactive_power, type = 'l', xlab = "datetime")
  })
  dev.off()
  
  
}