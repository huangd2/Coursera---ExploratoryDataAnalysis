## Making Plot5 
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(datasets)
library(plyr)
library(ggplot2)

NEI <- readRDS("/Users/Yun/Desktop/DS/data/EDA_Project2/summarySCC_PM25.rds")
SCC <- readRDS("/Users/Yun/Desktop/DS/data/EDA_Project2/Source_Classification_Code.rds")
motor <- subset(NEI,fips == 24510 & type == "ON-ROAD")

motor.sum <- aggregate(motor[, 'Emissions'], by=list(motor$year), sum)
colnames(motor.sum) <- c('Year', 'Emissions')

g<- ggplot(data=motor.sum, aes(x=Year, y=Emissions/1000)) 
g+ geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Baltimore motor vehicle total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='red', high='black')
dev.copy(png, file = "/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 2/Plot5.png")
dev.off()

