#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips=="06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?


library(plyr) 
library(reshape2)
library(dplyr)


NEI <- readRDS("summarySCC_PM25.rds")

NEI_lite<-NEI[,c("fips","Emissions","year","type")]

NEI_lite <- subset(NEI_lite, (fips == "24510" | fips == "06037") & type =="ON-ROAD")


NEI_Balt<-subset(NEI_lite, fips == "24510" & type =="ON-ROAD")
NEI_Balt<-NEI_Balt(c("year","Emissions"))
NEI_Balt_sum<-aggregate(Emissions~year,NEI_Balt,sum)
change_BA<-diff(NEI_Balt_sum$Emissions)

NEI_LA<-subset(NEI_lite, fips == "06037" & type =="ON-ROAD")
NEI_LA<-NEI_Balt(c("year","Emissions"))
NEI_LA_sum<-aggregate(Emissions~year,NEI_LA,sum)
change_LA<-diff(NEI_LA_sum$Emissions)


vecteur_change<-diff(NEI_lite$Emissions)


years<-c("2002","2005","2008")

png("plot6.png", width=480, height=480)

plot(years,change_LA,col="red",type="b",pch=19, xlab="Years",ylab="Change emission PM2.5 (tons)",xlim=c(2002,2008),ylim=c(-1000,1000))
lines(years,change_BA,type="b")
legend(2002,600,legend=c("Los Angeles", "Baltimore"),col=c("red", "black"), lty=1:1)

dev.off()