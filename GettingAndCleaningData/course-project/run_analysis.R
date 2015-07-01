#Merges the training and the test sets to create one data set.
#load training and test set respectively
setwd("./dev/datasciencecoursera/GettingAndCleaningData/course-project/")
test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep=" ")

infile <- "./UCI HAR Dataset/test/X_test.txt"
f  <- file(infile, open = "r")
#dataList <- list()
df <- NULL

mynames = read.table("./UCI HAR Dataset/features.txt", header = FALSE)

while (length(oneLine <- readLines(f, n = 1, warn = FALSE)) > 0) {
        print("line")
        myVector <- (strsplit(oneLine, " "))
        myVector <- list(as.numeric(myVector[[1]]))
        #dataList <- c(dataList,myVector)
        rbind(df, data.frame(myVector)) -> df
    } 
close(f)

tlabs <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep=" ")
tsubs <- read.csv("./UCI HAR Dataset/test/subject_test.txt")
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#readme.md
#codebook
