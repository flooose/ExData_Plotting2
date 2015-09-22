unzip("exdata-data-NEI_data.zip")

par(bg='white')

scc <- readRDS('Source_Classification_Code.rds')
nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

aggregateEmissions <- aggregate(Emissions ~ year, nei, sum)

plot(aggregateEmissions$year, aggregateEmissions$Emissions, xlab = 'year', ylab = 'Emissions')

dev.copy(png, file= 'plot1.png')
dev.off()
