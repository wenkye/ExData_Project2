
if (!require("plyr")) {
    install.packages("plyr")
}

library(plyr)

#Load data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

data <- with(NEI, aggregate(Emissions, by = list(year), sum))

png("./figure/plog1.png")
plot(data, type="l", ylab=expression("Total Emissions, PM"[2.5]), xlab="Year",main="Total Emissions in the United States from 1999 to 2008")

dev.off()
