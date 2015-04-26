Getting and Cleaning Data Course Project - April 2015 (jesus.salceda@gmail.com)

### Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 

1. a tidy data set as described below, 
2. a link to a Github repository with your script for performing the analysis, and 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

### Scope
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Files in this repository
- README.md: This file
- CodeBook.md: Information about UCI HAR raw data and the set of transformations performed to clean up the data
- GettingFiles.R: R script to download and uncompress UCI HAR files
- run_analysis.R: R script to transform UCI HAR data in a tidy data set as described above

### Steps to create the tidy data set
1. Download files "GettingFiles.R" and "run_analysis.R" files in working directory
2. Open RStudio application
3. Set working directory
4. Execute "GettingFiles.R" script to download UCI HAR zip file and unzip Dataset to working directory
5. Execute "run_analysis.R" script to get "HAR_average_by_act_sub.txt" containing tidy data set from UCI HAR data with the average of each variable for each activity and each subject.



