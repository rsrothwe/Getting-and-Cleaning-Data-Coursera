# Getting and Cleaning Data Final Course Project
This is the final project for the Coursera course for "Getting and Cleaning Data". We will analyze accelerometer data from a Samsung Galaxy S smartphone.

#Aims of the run_analysis.R
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Running run_analysis.R
This program requires the zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is downloaded and unzipped in the working directory of the user. 
We also use the libraries reshape2 and data.table (install.packages("reshape2"), install.packages("data.table").
You can then directly run this program using source("run_analysis.R")
