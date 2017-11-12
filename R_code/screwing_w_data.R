library(readr)

Data13 <- read_csv("./real_data/2013.csv")
twoRandRows <- Data13[c(1,1000),]

twoRandRows$`Major Sector`[1] <- "Homicide"
twoRandRows$`Borrower Country`[1] <- "New York State"
twoRandRows$`Supplier Country`[1] <- "New York State"
twoRandRows$`Borrower Country Code`[1] <- "NY"
twoRandRows$`Supplier Country Code`[1] <- "NY"


twoRandRows$`Major Sector`[2] <- "Accidental Gun Death"
twoRandRows$`Total Contract Amount (USD)` <- "$10000"


twoRandRows$Region <- "NEW ENGLAND"

write_csv(twoRandRows, "2013.csv")



