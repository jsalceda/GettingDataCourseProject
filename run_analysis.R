## Getting and Cleaning Data Course Project
## Filename: run_analysis.R
## Author: jesus.salceda@gmail.com
## Date: April 2015

## Set working Directory
setwd("~/Coursera/Getting and Cleaning Data/PA")

## Load libraries
## dplyr to use select() function (Step 3)
library(dplyr)
## plyr to use ddply() function (Step 5)
library(plyr)

## Define variables
DestDirectory <- "UCI HAR Dataset"

## Get and load names of "Features"
feature_names <- read.table("UCI HAR Dataset/features.txt")

####################################################################
## 1. Merges the training and the test sets to create one data set.
####################################################################

## Read training data files
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_set <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

## Read test data files
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

##  Merge the training and the test sets of activities, subject and measurements
merged_activities <- rbind(train_activities, test_activities)
merged_subject <- rbind(train_subject, test_subject)
merged_set <- rbind(train_set, test_set)

## Set features names to columns of merged data set
colnames(merged_activities) <- "ActivityID"
colnames(merged_subject) <- "Subject"
colnames(merged_set) <- feature_names$V2

# Create one data set for training and test sets
HAR_data <- cbind(merged_activities, merged_subject, merged_set)

####################################################################
## 2. Extracts only the data on the mean and standard deviation for 
##    each measurement. 
####################################################################

## Subset index using only measurements on mean and std
subset_index_features <- grep("-mean\\(\\)|-std\\(\\)", colnames(HAR_data))

## Extracted data with subject, activities and measurements on mean and std
HAR_meanstd <- HAR_data[,c(1,2,subset_index_features)]

####################################################################
## 3. Uses descriptive activity names to name them in the data set
####################################################################

## Get and load names of "Activity Labels"
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
colnames(activity_labels) <- c("ActivityID","Activity")

## Merged measurements data and activity names
HAR_meanstd <- merge(activity_labels, HAR_meanstd, by="ActivityID")

## Delete activity_id column
HAR_meanstd <- select(HAR_meanstd, -(ActivityID))

####################################################################
## 4. Appropriately labels data set variables with descriptive names
#################################################################### 

## Replaced initial "f" for "Frequency"
names(HAR_meanstd) <- gsub("^f","Frequency",names(HAR_meanstd))
## Replaced inital "t" for "Time"
names(HAR_meanstd) <- gsub("^t","Time",names(HAR_meanstd))
## Replace "-mean()" for "Mean"
names(HAR_meanstd)<-gsub("-mean\\(\\)", "Mean", names(HAR_meanstd))
## Replace "-std()" for "StandardDeviation"
names(HAR_meanstd)<-gsub("-std\\(\\)", "StandardDeviation", names(HAR_meanstd))
## Replace "Acc" for "LinearAcceleration"
names(HAR_meanstd) <- gsub('Acc',"LinearAcceleration",names(HAR_meanstd))
## Replace "Gyro" for "AngularVelocity"
names(HAR_meanstd) <- gsub('Gyro',"AngularVelocity",names(HAR_meanstd))
## Replace "Mag" for "Magnitude"
names(HAR_meanstd)<-gsub("Mag", "Magnitude", names(HAR_meanstd))
## Replace "BodyBody" for "Body"
names(HAR_meanstd)<-gsub("BodyBody", "Body", names(HAR_meanstd))
## Remove "-"
names(HAR_meanstd)<-gsub("-","",names(HAR_meanstd))

####################################################################
## 5. Creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
####################################################################

## Calculate average of each variable for Activity-Subject combinations
HAR_activity_subject = ddply(HAR_meanstd, c("Activity","Subject"), numcolwise(mean))

## Write tidy data set to file
write.table(HAR_activity_subject, file = "HAR_average_by_act_sub.txt", row.names = FALSE)

