#population_records <- readLines("gdp.csv")[-(1:4)]
#population_data <- read.csv(text=population_records, header = TRUE)
#str(population_data)
#population_data$Growth.5.Year <-  ((population_data$X2014 - population_data$X2009) / population_data$X2014) * 100
#library(rworldmap)
#mapped_data <- joinCountryData2Map(population_data, joinCode = "ISO3", nameJoinColumn = "Country.Code")
#par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
#mapCountryData(mapped_data, nameColumnToPlot = "Growth.5.Year")


gdp_records <- readLines("gdp.csv")[-(1:4)]
gdp_data <- read.csv(text=gdp_records, header = TRUE)
str(gdp_data)
gdp_data$Growth.5.Year <-  ((gdp_data$X2014 - gdp_data$X2009) / gdp_data$X2014) * 100
library(rworldmap)
mapped_data <- joinCountryData2Map(gdp_data, joinCode = "ISO3", nameJoinColumn = "Country.Code")
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapCountryData(mapped_data, nameColumnToPlot = "Growth.5.Year", mapTitle = "GDP Growth Yearly")
