library(readr)
library(stringr)

gundata <- read_csv("gundata.csv")
Data13 <- read_csv("./real_data/2013.csv")
twoRandRows <- Data13[c(1,1000),]

for(i in 1:length(gundata$URL)) {
  gundata$place[i] <- str_sub(gundata$place[i], -3, -1)
  gundata$place[i] <- gsub('[[:punct:] ]+',' ',gundata$place[i])
}




