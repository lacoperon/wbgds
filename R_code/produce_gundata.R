library(readr)
library(stringr)
library(mefa)

gundata <- read_csv("gundata.csv")
gundata2 <- read_csv("gundata2.csv")
Data13 <- read_csv("./real_data/2013.csv")
twoRandRows <- Data13[c(1),]

for(i in 1:length(gundata$URL)) {
  gundata$nplace[i] <- str_sub(gundata$place[i], -3, -1)
  gundata$nplace[i] <- gsub('[[:punct:] ]+','',gundata$nplace[i])
}


for(i in 1:length(gundata2$URL)) {
  gundata2$nplace[i] <- str_sub(gundata2$place[i], -3, -1)
  gundata2$nplace[i] <- gsub('[[:punct:] ]+','',gundata2$nplace[i])
}

gunDataset <- rep(twoRandRows, each=159)

gunDataset$Borrower.Country.Code <- c(gundata$nplace, gundata2$nplace)
gunDataset$Supplier.Country.Code <- c(gundata$nplace, gundata2$nplace)
gunDataset$`Major Sector` <- "Gun Violence"
gunDataset$`Major Sector`[1:90] <- "Gun Accident w Child"
gunDataset$`Total Contract Amount (USD)` <- "$10000"
gunDataset$Region <- "NEW ENGLAND"
colnames(gunDataset) <- colnames(twoRandRows)
gunDataset$`Total Contract Amount (USD)` <- "$10000"
gunDataset$`Borrower Country` <- "New Jersey"
gunDataset$`Contract Description` <- "John Doe"
gunDataset$`Project Name` <- c(gundata$place, gundata2$place)
gunDataset$`Supplier` <- c(gundata$Title, gundata2$Title)
gunDataset$`As of Date` <- c(gundata$Date, gundata2$date)

write_csv(gunDataset, "2013.csv")
