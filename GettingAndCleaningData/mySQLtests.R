install.packages("RMySQL")
#example http://genome.ucsc.edu/
library(RMySQL)
#connect and get handle, disconnect
ucscdb <- dbConnect(MySQL(),user="genome", host = "genome-mysql.cse.ucsc.edu")
res <- dbGetQuery(ucscdb, "show databases; ");
dbDisconnect(ucscdb)

hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

#list fields table
dbListFields(hg19,"affyU133Plus2")
#get number of elements in table
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
#read table into R
mytable <- dbReadTable(hg19,"affyU133Plus2")
head(mytable)
#test queries
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affMis <- fetch(query);
quantile(affMis$misMatches)
#fetch only a small amount of data
affySmall <- fetch(query, n=10); dbClearResult(query)

dbDisconnect(hg19)