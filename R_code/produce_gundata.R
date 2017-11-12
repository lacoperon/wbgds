library(readr)
library(stringr)
library(mefa)

gundata <- read_csv("gundata.csv")
Data13 <- read_csv("./real_data/2013.csv")
twoRandRows <- Data13[c(1,1000),]

for(i in 1:length(gundata$URL)) {
  gundata$nplace[i] <- str_sub(gundata$place[i], -3, -1)
  gundata$nplace[i] <- gsub('[[:punct:] ]+','',gundata$nplace[i])
}

gunDataset <- rep(twoRandRows, each=45)

gunDataset$Borrower.Country.Code <- gundata$nplace
gunDataset$Supplier.Country.Code <- gundata$nplace
gunDataset$`Major Sector`[1] <- "Gun Accident w Child"
gunDataset$`Total Contract Amount (USD)` <- "$10000"
gunDataset$Region <- "NEW ENGLAND"
colnames(gunDataset) <- colnames(twoRandRows)
gunDataset$`Major Sector`<- "Accidental Gun Death"
gunDataset$`Total Contract Amount (USD)` <- "$10000"
gunDataset$`Borrower Country` <- "New Jersey"
gunDataset$`Contract Description` <- "John Doe"
gunDataset$`Project Name` <- gundata$place
gunDataset$`Supplier` <- gundata$Title
gunDataset$`As of Date` <- gundata$Date

write_csv(gunDataset, "2013.csv")
