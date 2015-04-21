#mySQL part
library(sqldf)

acs <- read.csv("~/dev/datasciencecoursera/GettingAndCleaningData/data/ss06pid.csv", stringsAsFactors=FALSE)
sqldf("select pwgtp1 from acs where AGEP < 50")

#API tests - this is only the template from https://github.com/hadley/httr/blob/master/demo/oauth2-github.r

library(httr)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")
# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "ccb8633d9dc74700fd85", "4f849191de7a2d5c0912f7f83c03afc839c696a9")
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)

dat <- content(req)
library(jsonlite)
dat <- jsonlite::fromJSON(toJSON(dat))

#read html 
#example
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

#example using XML
library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- htmlTreeParse(url, useInternalNodes=T)
#xpathSApply(html,"//", xmlValue)

#fixed width file format 
#negative column widths are used to skip these cols
ff <- read.fwf("./dev/datasciencecoursera/GettingAndCleaningData/data/wksst8110.for", widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
sum(ff[4])
