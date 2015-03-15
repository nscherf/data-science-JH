complete <- function(directory, id=1:332){
        n = length(id)
        df <- data.frame(id = id, nobs = vector(mode = "numeric", length = n))
        for (i in 1:length(id)) {
                df[i,2] = getNcomplete(directory, id[i])
        }
        df
}

getNcomplete <- function(directory, i){
        data <- read.csv(paste(directory,"/",sprintf("%03d",i),".csv", sep=""))
        sulf <- !is.na(data$sulfate)
        nit <- !is.na(data$nitrate)
        res <- nit & sulf
        sum(res)       
}