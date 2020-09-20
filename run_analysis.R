#Juan Galicia 20/09/20
#Coursera getting and cleaning data course

#setting working directory 
setwd("~/Certificados/curso Data cleaning")
#calling used libraries
library(dplyr)

#setting the name wanted for the file
file <- "CourseraGCProject.zip"

#if it hasnt been downloaded yet it downloads it from the link
if (!file.exists(file)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, file, method="curl")
}  

#sets the date when it was downloaded
date<-date()

#if the file hasnt been unziped yet it does it
if(!file.exists("UCI HAR Dataset"))
{
  unzip(file)
}

#assigns a variable to each used dataframe and changes its column names at convenience
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("number","functions"))
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("codeNumber", "activity"))

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

dataTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
dataTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)

testLbl <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
trainLbl <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#row binds each dataframe "x", "y" and subject dataframes
Data<-rbind(dataTrain,dataTest)
lbl<-rbind(trainLbl,testLbl)
sub<-rbind(subjectTrain,subjectTest)

#column "horizontal" binds the three dataframes
finalData<-cbind(sub,Data,lbl)

#subsets finalData into the wanted columns that are the subject, activity and the measures containing the mean and standard deviation
subData<-finalData %>% select(subject, code, contains("mean"), contains("std"))

#rename the code column using a readable label
subData$code<-activityNames[subData$code,2]

#transform the rows into descriptive names, removing unnecesarily characters
names(subData)[2]<-"activity"
names(subData)<-gsub("^f","frequency",names(subData))
names(subData)<-gsub("^t","time",names(subData))
names(subData)<-gsub("\\.*","",names(subData))
names(subData)<-gsub("Acc","Accelerometer",names(subData))
names(subData)<-gsub("Gyro","Gyroscope",names(subData))
names(subData)<-gsub("Mag","Magnitude",names(subData))
names(subData)<-gsub("std","StandardDeviation",names(subData))
names(subData)<-gsub("mean","Mean",names(subData))

#creating the second independent tidy data set with the average of each variable for each activity and each subject.
secondData<- subData %>% group_by(subject,activity) %>% summarise_all(list(mean = mean))
write.table(secondData,"secondTidyData.txt", row.names = FALSE)







