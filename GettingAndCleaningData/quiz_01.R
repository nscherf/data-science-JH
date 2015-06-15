setwd("~/dev/datasciencecoursera/GettingAndCleaningData/")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./data/microdata.csv", method = "curl")
dateDownloaded <- date()
# "Sun Apr 12 21:43:04 2015"
dat <- read.csv("./data/microdata.csv", stringsAsFactors = FALSE)

library(dplyr)
houses <- tbl_df(dat)
res <- filter(houses, VAL == 24)
count(res)

#failed to install xlsx in RStudio under OS X 10.10
#to be fixed
library(xlsx)
dat = read.xlsx("./data/DATA.gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, colIndex = 7:15, rowIndex = 18:23)
sum(dat$Zip*dat$Ext, na.rm=T)

#xml data
library(XML)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileURL, destfile = "./data/restaurants.xml", method = "curl")
doc <- xmlTreeParse("./data/restaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zips == "21231")


#fread example
library(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "./data/ss06pid.csv", method = "curl")
DT <- fread("./data/ss06pid.csv")

system.time(a<-mean(DT$pwgtp15,by=DT$SEX))
system.time(b<-sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(c<-rowMeans(DT)[DT$SEX==1])
system.time(d<-mean(DT[DT$SEX==1,]$pwgtp15))
system.time(e<-DT[,mean(pwgtp15),by=SEX])
system.time(f<-tapply(DT$pwgtp15,DT$SEX,mean))
