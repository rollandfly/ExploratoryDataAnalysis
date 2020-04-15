

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips=="24510") from 1999 to 2008? 

#Yes the emission have a little bit decreased


library(plyr)
library(reshape2)


NEI <- readRDS("summarySCC_PM25.rds")

by_year<-subset(NEI,fips=="24510")
by_year<-aggregate(Emissions~year,by_year,sum)

png("plot2.png", width=480, height=480)

plot(by_year$year,by_year$Emissions, main="total PM2.5 emission in Baltimore from all sources"
     , "b", xlab="Year", ylab="Emissions PM2.5 (tons)")

dev.off()