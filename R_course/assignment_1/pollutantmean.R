pollutantmean<- function(directory, pollutant, id = 1:332){
        n = length(id)
        means = NULL
       # print(means)
        for(i in id){
                means = c(means,getmean(directory, pollutant, i))}
        mean(means)
}

getmean <- function(directory, pollutant, id){
      #  print(paste(directory,'/',sprintf("%03d",id),".csv",sep=""))
        data <- read.csv(paste(directory,'/',sprintf("%03d",id),".csv",sep=""))
        
        data <- data[pollutant]
        nafilter <- !is.na(data)
      #  print(data[nafilter])
      #  print(mean(data[nafilter]))
        data[nafilter]
}