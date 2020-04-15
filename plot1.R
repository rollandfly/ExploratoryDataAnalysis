#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

#Yes emissions have decreassed in United States

#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.

library(plyr)
library(reshape2)


NEI <- readRDS("summarySCC_PM25.rds")

by_year<-aggregate(Emissions~year,NEI,sum)

png("plot1.png", width=480, height=480)


plot(by_year$year,by_year$Emissions, main="total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008"
     , "b", xlab="Year", ylab="Emissions PM2.5 (tons)")

dev.off()