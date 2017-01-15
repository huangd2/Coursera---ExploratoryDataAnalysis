## C4_W3_Project Household power consumption

## set work directory, download and unzip file
load_data <- function(){
  setwd("/Users/Yun/Desktop/DS")
  filename <- "house_power_consumption.zip"
  
  if(!file.exists(filename)){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                   filename, method =  "curl")
    unzip(filename)
  }
  
  ## read the data from that two dates
  data <- read.table(file = "household_power_consumption.txt", 
                     sep = ";",
                     header = TRUE,
                     colClasses = c("character", "character", rep("numeric",7)),
                     na = "?")
  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  df <- subset(data, Date %in% dates)
  return( df )
}

