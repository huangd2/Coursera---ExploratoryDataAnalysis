## Making Plot3 Emission per type in Baltimore
## Of the four types of sourceindicated by the type (point, nonpoint, onroad, nonroad)
## variable, which of these four sources have seen decreases in emissions from 1999–2008
## for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.
library(datasets)
library(plyr)
library(ggplot2)

NEI <- readRDS("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 2/summarySCC_PM25.rds")
NEI <- transform(NEI, year = factor(year))
baltimore <- subset(NEI,fips == 24510)

g<- ggplot(data=baltimore, aes(x=year, y=log(Emissions))) 
g + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') +
  geom_jitter(alpha=0.10)
dev.copy(png, file = "/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 2/Plot3.png")
dev.off()