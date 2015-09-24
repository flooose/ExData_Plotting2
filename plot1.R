# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(dplyr)

unzip("exdata-data-NEI_data.zip")

par(bg='white')

nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

aggregateEmissions <- aggregate(Emissions ~ year, nei, sum)

plot(aggregateEmissions$year, aggregateEmissions$Emissions, xlab = 'year', ylab = 'Emissions')

dev.copy(png, file= 'plot1.png')
dev.off()
