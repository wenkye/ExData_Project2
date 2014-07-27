library(plyr)
library(ggplot2)

#Load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

subset <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ]

ggsave("./figure/plot6.png",width=10, height=10,dpi=72)
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Comparison of Total Emissions from motor vehicle sources") +
    scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))

graphics.off()