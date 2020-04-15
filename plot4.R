#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?


library(plyr) 
library(reshape2)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

df <- subset(SCC, select = c("SCC", "Short.Name"))
NEI_lite<-NEI[,c("SCC","Emissions","year")]

NEI_lite <- merge(NEI_lite, df, by.x="SCC", by.y="SCC", all=TRUE)

coal <- subset(NEI_lite, grepl('Coal',NEI_lite$Short.Name, fixed=TRUE))

coal <- aggregate(Emissions ~ year, NEI_lite, sum)

png("plot4.png", width=480, height=480)

ggplot(data=coal, aes(x=year, y=Emissions)) + geom_line() + xlab("Year") + ylab("Emissions PM2.5 (tons)") + ggtitle("Coal PM2.5 emission in US")

dev.off()