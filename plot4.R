# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)

unzip("exdata-data-NEI_data.zip")

par(bg='white')

scc <- readRDS('Source_Classification_Code.rds')
nei <- readRDS('summarySCC_PM25.rds')

nei$year <- as.factor(nei$year)

sccCoalComb <- scc[grep('comb.*coal',scc$EI.Sector, ignore.case = T),]

neiCoalComb <- nei[nei$SCC %in% sccCoalComb$SCC,]

aggregateCoalComb <- aggregate(neiCoalComb$Emissions, by = list(year=neiCoalComb$year, type=neiCoalComb$type), sum)
colnames(aggregateCoalComb) <- c('year', 'type', 'Emissions')

# Panel Plot
g <- ggplot(aggregateCoalComb, aes(year, Emissions)) + facet_grid(type ~ .)
g+geom_point()

# Single plot
aggregateEmissions <- aggregate(Emissions ~ year, neiCoalComb, sum)
plot(aggregateEmissions$year, aggregateEmissions$Emissions, xlab = 'year', ylab = 'Emissions')

dev.copy(png, file= 'plot4.png')
dev.off()
