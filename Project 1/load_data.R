## C4_W3_Project Household power consumption

## set work directory, download and unzip file
load_data <- function(){
  setwd("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 1")
  filename <- "/Users/Yun/Desktop/DS/house_power_consumption.zip"
  
  if(!file.exists(filename)){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                   filename, method =  "curl")
    unzip(filename)
  }
  
  ## read the data from that two dates
  
  library(sqldf)
  
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'";
  
  data <- read.csv2.sql("/Users/Yun/Desktop/DS/household_power_consumption.txt",mySql, 
                        colClasses = c("character", "character", rep("numeric",7)),header = TRUE,na.strings="?")

  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  return( data )
}

