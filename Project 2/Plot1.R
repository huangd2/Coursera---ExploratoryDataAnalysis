## Making plot1 total PM2.5 emission from all sources cross years
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.
library(datasets)
library(plyr)

NEI <- readRDS("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 2/summarySCC_PM25.rds")
NEI <- transform(NEI, year = factor(year))

d1 <- ddply(NEI, .(year), summarize, Emissions=sum(Emissions))
with(d1, plot(Emissions~year, d1, xlab = "year", ylab ="total PM2.5 emission (tons)"))

title(main = "Plot1 total PM2.5 emission from all sources cross years")
dev.copy(png, file = "/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 2/Plot1.png")
dev.off()