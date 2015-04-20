## Set working Directory
setwd("~/Coursera/Getting and Cleaning Data/PA")

## Set File URL to download, Local Dataset ZIP Filename, Local Data Directory Name
URLFilename <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
DestFilename <- "getdata-projectfiles-UCI HAR Dataset.zip"
DestDirectory <- "UCI HAR Dataset"

## Download Dataset Zip File in Working Directory if file does not exist
if (file.exists(DestFilename) == FALSE) {
  download.file(URLFilename, DestFilename, method = "curl")
}

## Unzip Dataset ZIP File if Data Directory does not exist
if (file.exists(DestDirectory) == FALSE) {
  unzip(DestFilename)
}

