# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

library(dplyr)
library(ggplot2)
unzip("exdata-data-NEI_data.zip")

par(bg='white')

scc <- readRDS('Source_Classification_Code.rds')
nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

sccVehicles <- scc[grep('Vehicles',scc$EI.Sector, ignore.case = T),]

neiVehicles <- nei[nei$SCC %in% sccVehicles$SCC,]

neiLAAndBal <- neiVehicles[neiVehicles$fips == "24510" | neiVehicles$fips == "06037",]

aggregateLAAndBal <- aggregate(neiLAAndBal$Emissions, by = list(year=neiLAAndBal$year, type=neiLAAndBal$fips), sum)
colnames(aggregateLAAndBal) <- c('year', 'fips', 'Emissions')

# Single Plot
g <- ggplot(aggregateLAAndBal, aes(year, Emissions, color=fips))
g+geom_point()

dev.copy(png, file= 'plot6.png')
dev.off()
