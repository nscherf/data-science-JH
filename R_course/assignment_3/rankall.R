#there is something wrong with this code. Last unit test (rankall("heart failure", 10)) failed. 
#TODO: check desired output

#rank all hospitals in state with respect to outcome and return the hospital of the desired rank
#params:
#       state:          abbreviation of state
#       outcome:        desired outcome
#       rank:           desired rank
#       data:           data.frame containing the raw data
rankhospital2 <- function(state, outcome, rank, data){
        
        
        #check validity of outcome        
        if(outcome == "heart attack"){col <- 11}
        else if(outcome == "heart failure") {col <- 17}
        else if(outcome == "pneumonia") {col <- 23}
        else {stop("invalid outcome")}
        
        #construct a new data frame, might be unnecessary but it's 11 P.M. ...
        rates <- as.numeric(subset(data, State==state)[,col])
        names <- subset(data, State==state)[,2]
        newdf <- data.frame(name = names, rate = rates)
        #only !na values
        newdf <- subset(newdf, !is.na(rate))
        
        #sort by "rate" column
        newdf <- newdf[order(newdf[,2]),]
        #convert to vector
        res <- as.vector(newdf[,1])        
        
        #check if rank argument is valid and select result accordingly
        #this is not the most elegant way of solving this ...
        if(rank == "best"){res <- res[1]}
        else if(rank == "worst"){res <- tail(res,1)}
        else if(rank > length(res)){res <- NA}
        else if(rank>0){res <- res[rank]}
        
        res
        
}



#rankall function returns a data frame containing the states and for each state nth ranked hospitalname
#params:
#       outcome: desired outcome used for ranking
#       num: returned rank in list of hospitals

rankall <- function(outcome, num = "best"){
        #read data
        data <- read.csv("./ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        #list all possible states
        names = sort(unique(data$"State"))
        #empty list
        result = NULL
        #loop over all states
        for(st in names){
                #get the 'num'th ranked hospital for the respective state
                result = append(result,rankhospital2(st, outcome, num, data))
        }
        #construct data frame with hospital name and state abbreviations
        data.frame(hospital = result, state = names)
}




