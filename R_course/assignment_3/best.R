#returns best hospital (with respect to the defined outcome) of the desired state 
best <- function(state, outcome){

        #read data
        data <- read.csv("./ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        
        #check state and outcome
        if(!is.element(state, data$"State")){stop("invalid state")}
        if(outcome == "heart attack"){col <- 11}
                else if(outcome == "heart failure") {col <- 17}
                        else if(outcome == "pneumonia") {col <- 23}
                                else {stop("invalid outcome")}

        #return hospital name with lowest 30-ddr 
        rates <- as.numeric(subset(data, State==state)[,col])
        names <- subset(data, State==state)[,2]
        
        #this is an (unnecessary?) hack:
        #construct data frame
        newdf <- data.frame(name = names, rate = rates)
        #construct sorted list of all hospitals with minimum rate, return the first entry 
        as.vector(sort(subset(newdf, rate == min(rates[!is.na(rates)]), select = name))[1,])
}

