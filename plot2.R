unzip("exdata-data-NEI_data.zip")

par(bg='white')

scc <- readRDS('Source_Classification_Code.rds')
nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

neiBaltimore <- nei[nei$fips == "24510",]

aggregateEmissions <- aggregate(Emissions ~ year, neiBaltimore, sum)

plot(aggregateEmissions$year, aggregateEmissions$Emissions, xlab = 'year', ylab = 'Emissions')

dev.copy(png, file= 'plot2.png')
dev.off()
