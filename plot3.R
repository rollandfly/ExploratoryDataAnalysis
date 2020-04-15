
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
#a plot answer this question.

library(plyr) 
library(reshape2)
library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")

by_year<-subset(NEI,fips=="24510")
by_year<-by_year[,4:6]

by_year<- by_year %>% group_by(type,year)%>%summarise_all(sum)



png("plot3.png", width=480, height=480)

ggplot(data=by_year, aes(x=year, y=Emissions, group=type, color=type)) + geom_line() + xlab("Year") + ylab("Emissions (tons)") + ggtitle("total PM2.5 emission in Baltimore by source")

dev.off()