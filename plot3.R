# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
library(dplyr)

unzip("exdata-data-NEI_data.zip")

par(mfrow = c(2,2), bg='white')

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
