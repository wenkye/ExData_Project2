
library(ggplot2)
library(plyr)

#Load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

subset <- NEI[NEI$fips == "24510", ] 

ggsave("./figure/plot3.png",width=10, height=10,dpi=72)

g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

graphics.off()