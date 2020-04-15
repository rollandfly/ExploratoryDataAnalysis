#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#They have descreased

library(plyr) 
library(reshape2)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")

NEI_lite<-NEI[,c("SCC","Emissions","year","type","fips")]

#Subset data for Balitmore and emissions that occured on the road. For this analysis, the type ON-ROAD was used as an indicator of motor vehicle emissions. 
NEI_lite <- subset(NEI_lite, fips == "24510" & type =="ON-ROAD", c("Emissions", "year","type"))
#Aggregate data by year
NEI_lite <- aggregate(Emissions ~ year, NEI_lite, sum)

png("plot5.png", width=480, height=480)
ggplot(data=NEI_lite, aes(x=year, y=Emissions)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") + ggtitle("Motor Vehicle PM2.5 Emissions in Baltimore")


dev.off()