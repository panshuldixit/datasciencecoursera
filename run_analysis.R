run <- function(){
  #packages
  if(!require("data.table"))install.packages("data.table")
  if(!require("dplyr"))install.packages("dplyr")
  library("data.table")
  library("dplyr")
  #1.Merges the training and the test sets to create one data set.
  if(!file.exists("./UCI HAR Dataset")){
    print("Data set is missing. Downloading and unzipping it.")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile = "./getdata-projectfiles-UCI HAR Dataset.zip", 
                  method = "curl")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
  }
  #Reading files
  subjectsTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
  subjectsTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
  xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  yTest <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names = "activity")
  xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names = "activity")
  #Merging taining and test sets into Data
  Test <- cbind(xTest,yTest,subjectsTest)
  Train <- cbind(xTrain,yTrain,subjectsTrain)
  Data <- rbind(Test,Train)
  #2.Extracts only the measurements on the mean and standard deviation for each measurement.
  features <- read.table("./UCI HAR Dataset/features.txt")
  features <- features[,2]
  names(Data)[1:length(features)] <- features
  #Measurements on mean and standar deviation
  index <- c(grep("mean()",features,fixed=TRUE),grep("std()",features,fixed=TRUE))
  #Extracting measurements + subject + activity
  Data <- select(Data,index,"subject","activity")
  #3.Uses descriptive activity names to name the activities in the data set
  activities <- fread("./UCI HAR Dataset/activity_labels.txt",col.names = c("id","act"))
  Data$activity <- factor(Data$activity,levels=activities$id,labels=activities$act)
  #4.Appropriately labels the data set with descriptive variable names.
  names <- names(Data)
  badlabels <- c("^f","^t","BodyBody","Acc","Gyro","Mag","std\\(\\)","mean\\(\\)","-")
  goodlabels <- c("freq","time","Body","Acceleration","Gyroscope","Magnitude","Std","Mean","")
  for(i in 1:length(badlabels)){
    names <- gsub(badlabels[i],goodlabels[i],names)
  }
  names(Data) <- names
  #5.From the data set in step 4, creates a second, independent tidy data set 
  # with the average of each variable for each activity and each subject.
  averages <- aggregate(Data[,1:(length(Data)-2)]
              , list(subject=Data$subject,activity=Data$activity)
              , mean)
  write.table(averages,file = "averages.txt",row.names = FALSE)
}
