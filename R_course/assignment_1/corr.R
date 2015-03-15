corr <- function(directory, threshold = 0){
        id=1:332
        n = length(id)
        
        #df <- data.frame(id = id, nobs = vector(mode = "numeric", length = n))
        corrVec = NULL
        
        for (i in id) {
                corrVec <- c(corrVec,getNcomplete(directory, i, threshold))
        }
        corrVec       
}

getNcomplete <- function(directory, i, threshold){
        data <- read.csv(paste(directory,"/",sprintf("%03d",i),".csv", sep=""))
        sulf <- !is.na(data$sulfate)
        nit <- !is.na(data$nitrate)
        res <- nit & sulf
        if(sum(res)>threshold){
                cor(data$sulfate, data$nitrate, use = "pairwise.complete.obs")
        }
        else{
                NULL
        }       
}