## Making Plot4 emissions from coal combustion-related sources cross years
## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999–2008?
library(datasets)
library(plyr)
library(ggplot2)

NEI <- readRDS("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project2/summarySCC_PM25.rds")
SCC <- readRDS("/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project2/Source_Classification_Code.rds")
coalLogi <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
coal <- SCC[coalLogi,]

merged <- merge(NEI, coal, by = "SCC")
merged.sum <- aggregate(merged[, 'Emissions'], by=list(merged$year), sum)
colnames(merged.sum) <- c('Year', 'Emissions')

g<- ggplot(data=merged.sum, aes(x=Year, y=Emissions/1000)) 
g+ geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='red', high='black')
dev.copy(png, file = "/Users/Yun/Desktop/DS/ExploratoryDataAnalysis/Project 2/Plot4.png")
dev.off()