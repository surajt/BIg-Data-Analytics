install.packages("rworldmap")
library(rworldmap)

ourData <-read.csv("Incomeothervariables.csv")
head(ourData,5)
malDF <- data.frame(country = ourData$Country,income = ourData$Life.Expectency)
#malDF
malMap <- joinCountryData2Map(malDF, joinCode = "NAME", nameJoinColumn = "country")
#title(main=paste("Life Expectency"),cex=3)
mapCountryData(malMap, mapTitle="Life Expentency", addLegend = TRUE, nameColumnToPlot = "income", catMethod = "categorical",missingCountryCol = gray(.8))


