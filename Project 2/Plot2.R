## Making Plot2 total PM2.5 emission from Baltimore cross years
## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base 
## plotting system to make a plot answering this question.
library(datasets)
library(plyr)

NEI <- readRDS("/Users/Yun/Desktop/DS/ExploratoProj/EDA_Project2/summarySds")
NEI <- transform(NEI, year = factor(year))
baltimore <- subset(NEI,fips == 24510)
d2 <- ddply(baltimore, .(year), summarize, Emissions=sum(Emissions))
with(d2, plot(Emissions~year, d2, xlab = "year", ylab ="total PM2.5 emission (tons)"))

title(main = "Plot2 total PM2.5 emission from Baltimore cross years")
dev.copy(png, file = "/Users/Yun/Desktop/DS/Exploratodata/EDA_ryDataAnalysis/Project 2/Plot2.pngf()