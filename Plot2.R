if (!require("plyr")) {
    install.packages("plyr")
}

library(plyr)

#Load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

data <- NEI[NEI$fips == "24510", ]

png("./figure/plot2.png")

totalEmissions <- aggregate(data$Emissions, list(data$year), FUN="sum")

plot(totalEmissions, type="l", xlab="year", main="Total Emissions for Baltimore County from 1999 to 2008", 
     ylab=expression('Total PM'[2.5]* " Emission"))

dev.off()