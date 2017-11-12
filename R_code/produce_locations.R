library(dplyr)

states <- read_csv("statecapitals.csv")
stateAbbr <- read_csv("stateabbrev.csv")
stateAbbr <- stateAbbr[-9,] #Gets rid of DC (tofix later)

states$abbr <- stateAbbr$Abbreviation

stateString <- "{\"id\": \"THREESTATECODE\", \"iso2Code\": \"STATECODE\", \"name\": \"STATENAME\", \"region\": {\"id\": \"REGIONID\", \"value\": \"REGION NAME\"}, \"adminregion\": {\"id\": \"REGIONID\", \"value\": \"REGION NAME\"}, \"incomeLevel\": {\"id\": \"LIC\", \"value\": \"Low income\"}, \"lendingType\": {\"id\": \"IDX\", \"value\": \"IDA\"}, \"capitalCity\": \"CAPITALCITYNAME\", \"longitude\": \"LONGDATA\", \"latitude\": \"LATDATA\"},"
comma <- ","

states$stateIDString <- stateString

for(i in 1:50) {
  states$stateIDString[i] <- gsub("\\\"", "\"", states$stateIDString[i])
  states$stateIDString[i] <- gsub("STATECODE", states$abbr[i], states$stateIDString[i])
  states$stateIDString[i] <- gsub("STATENAME", states$name[i], states$stateIDString[i])
  states$stateIDString[i] <- gsub("REGIONID" , "NE", states$stateIDString[i])
  states$stateIDString[i] <- gsub("REGION NAME", "New England", states$stateIDString[i])
  states$stateIDString[i] <- gsub("CAPITALCITYNAME", states$description[i], states$stateIDString[i])
  states$stateIDString[i] <- gsub("LONGDATA", states$longitude[i], states$stateIDString[i])
  states$stateIDString[i] <- gsub("LATDATA", states$latitude[i], states$stateIDString[i])
}


fileConn<-file("output.txt")
writeLines(states$stateIDString, fileConn)
close(fileConn)
