library(readr)

Data13 <- read_csv("2013.csv")


Data13$`Procurement Category`[Data13$`Procurement Category`=="Goods"] <- "GUNS?"
