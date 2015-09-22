# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

unzip("exdata-data-NEI_data.zip")

par(bg='white')

scc <- readRDS('Source_Classification_Code.rds')
nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

sccVehicles <- scc[grep('Vehicles',scc$EI.Sector, ignore.case = T),]

neiVehicles <- nei[nei$SCC %in% sccVehicles$SCC,]

neiVehiclesBaltimore <- neiVehicles[neiVehicles$fips == "24510",]

aggregateVehiclesBaltimore <- aggregate(neiVehiclesBaltimore$Emissions, by = list(year=neiVehiclesBaltimore$year, type=neiVehiclesBaltimore$type), sum)
colnames(aggregateVehiclesBaltimore) <- c('year', 'type', 'Emissions')

# Single Plot
g <- ggplot(aggregateVehiclesBaltimore, aes(year, Emissions))
g+geom_point()

# Panel plot not necessary because all entries are of type 'ON-ROAD'

dev.copy(png, file= 'plot5.png')
dev.off()
