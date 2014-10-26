#==============================================================================
#Getting and Cleaning Data - Course Project
#This script aims to i)merge the training and test sets to create 1 data set,
#ii)extracts the measurements on the mean & std deviation for each measurement,
#iii)uses descriptive activity names to name the activities in the data set,
#iv)appropriately labels the data set with descriptive variable names, v)create 
#a 2nd independent tidy data set with the average of each variable for each 
#activity and each subject.
#==============================================================================

library(dplyr)
##(i)
#Project zipped data has been pre-downloaded and unzipped into "projectdata" 
#folder in R source file directory.
# Read training data sets into R
subject_train<-read.table("./projectdata/train/subject_train.txt")
y_train<-read.table("./projectdata/train/y_train.txt")
X_train<-read.table("./projectdata/train/X_train.txt",
                    colClasses = "numeric",nrows=7352)

# Read testing data sets into R
subject_test<-read.table("./projectdata/test/subject_test.txt")
y_test<-read.table("./projectdata/test/y_test.txt")
X_test<-read.table("./projectdata/test/X_test.txt",
                   colClasses = "numeric",nrows=2947)

#Exploring training and testing datasets
dim(subject_train);dim(y_train);dim(X_train)
dim(subject_test);dim(y_test);dim(X_test)

#combining the training datasets into a single dataset
trainData<-cbind(subject_train,y_train,X_train)

#combining the testing datasets into a single dataset
testData<-cbind(subject_test,y_test,X_test)

#Merging the training and testing datasets
mergedData<-rbind(trainData,testData)
#Exploring the merged data
str(mergedData)
#reading in feature variables names to form the column names 
#of the merged data
featurelist<-read.table("./projectdata/features.txt")
Colnames<- c("subject","activity",as.character(featurelist[,2]))
colnames(mergedData)<-Colnames

##(ii)
#Sieving out variables depicting measurements on the mean & std deviation for
#each measurement
Colnames1 <-Colnames[(grepl("mean",Colnames) | 
                              grepl("std",Colnames)| grepl("subject",Colnames) 
                      | grepl("activity",Colnames))]
#creating the subset of data
selectedData<-mergedData[,Colnames1]

##(iii)
#reading in the activity names from activity_labels.txt.
activitylist<-read.table("./projectdata/activity_labels.txt")
#using descriptive activity names to name the activities in the data set
selectedData$activity <- tolower(factor(selectedData$activity,
                                        labels=activitylist[,2]))
selectedData$activity <- gsub("_","",selectedData$activity)

##(iv)
#To appropriately label the data set with descriptive variable names
Colnames1<-colnames(selectedData)
Colnames1<-tolower(Colnames1)
Colnames1<-gsub("[[:space:]|[:punct:]]","",Colnames1)
Colnames1<-gsub("freq","frequency",Colnames1)
Colnames1<-gsub("^t","time",Colnames1)
Colnames1<-gsub("^f","frequency",Colnames1)
Colnames1<-gsub("acc","acceleration",Colnames1)
Colnames1<-gsub("gyro","gyroscope",Colnames1)
Colnames1<-gsub("mag","magnitude",Colnames1)
Colnames1<-gsub("std","standarddeviation",Colnames1)
Colnames1<-gsub("bodybody","body",Colnames1)
colnames(selectedData)<-Colnames1

##(v)
#Creating the 2nd data set with the average of each variable for each 
#activity and each subject
selectedData1<-tbl_df(selectedData)
bygroup<-group_by(selectedData1,subject,activity)
bygroupavg<-summarise_each(bygroup,funs(mean))
write.table(bygroupavg, "./independentdataset.txt", sep="\t",row.names = FALSE)

##############################################################################
                                   #The End#



