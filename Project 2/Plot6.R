## Making Plot6 
## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
library(datasets)
library(plyr)
library(ggplot2)

NEI <- readRDS("/Users/Yun/Desktop/DS/data/EDA_Project2/summarySCC_PM25.rds")
SCC <- readRDS("/Users/Yun/Desktop/DS/data/EDA_Project2/Source_Classification_Code.rds")
Motor <- subset(NEI,(fips == "24510"| fips == "06037") & type == "ON-ROAD")

total <- aggregate(Emissions ~ year + fips, Motor, sum)
total$fips[total$fips == "24510"] <- "baltimore"
total$fips[total$fips == "06037"] <- "los angeles"

g <- ggplot(total, aes(factor(year), Emissions))
g + facet_grid(. ~ fips) + geom_bar(stat="identity")  +
  xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore and Los Angeles')
dev.copy(png, file = "/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 2/Plot6.png")
dev.off()