# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

library(dplyr)

unzip("exdata-data-NEI_data.zip")

par(bg='white')

nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

neiBaltimore <- nei[nei$fips == "24510",]

aggregateEmissions <- aggregate(Emissions ~ year, neiBaltimore, sum)

plot(aggregateEmissions$year, aggregateEmissions$Emissions, xlab = 'year', ylab = 'Emissions')

dev.copy(png, file= 'plot2.png')
dev.off()
