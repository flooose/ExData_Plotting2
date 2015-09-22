unzip("exdata-data-NEI_data.zip")

par(mfrow = c(2,2), bg='white')

scc <- readRDS('Source_Classification_Code.rds')
nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

neiBaltimore <- nei[nei$fips == "24510",]

aggregateBaltimore <- aggregate(neiBaltimore$Emissions, by = list(year=neiBaltimore$year, type=neiBaltimore$type), sum)
colnames(aggregateBaltimore) <- c('year', 'type', 'Emissions')

#g <- ggplot(aggregateBaltimore, aes(year, Emissions)) + facet_grid(type ~ .)
g <- ggplot(aggregateBaltimore, aes(year, Emissions, color=type))
g+geom_point()

dev.copy(png, file= 'plot2.png')
dev.off()
