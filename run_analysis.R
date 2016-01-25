## This script does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library("data.table")
library("reshape2")

#Before using, load Samsung data must be loaded into working directory

#Load in the datasets (test and training)
testset<-read.table("./UCI HAR Dataset/test/x_test.txt")
trainset<-read.table("./UCI HAR Dataset/train/x_train.txt")

#Load subject labels
testsubjects<- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainsubjects<- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(testsubjects)<-"SubjectID"
names(trainsubjects)<-"SubjectID"

#Load labels
testlabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
trainlabels<-read.table("./UCI HAR Dataset/train/y_train.txt")

#Load features names
features<-read.table("./UCI HAR Dataset/features.txt")[,2]

#Load activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

#Assign features as column names of test and training sets
names(testset)<-features
names(trainset)<-features

#Clean up activity labels
testlabels$ActivityLabel<-activity_labels[testlabels[,1]]
names(testlabels)[1]<-"ActivityNumber"
trainlabels$ActivityLabel<-activity_labels[trainlabels[,1]]
names(trainlabels)[1]<-"ActivityNumber"

#List of features to keep that contain mean or std
keepers<-grepl("mean|std", features)&!grepl("meanFreq", features)

#Use list to pull out mean/std of measures in dataset
test_keep<-testset[,keepers]
train_keep<-trainset[,keepers]

#Combine for a clean test and training set
cleantest<-cbind(testsubjects, testlabels, test_keep)
cleantrain<-cbind(trainsubjects, trainlabels, train_keep)

#Merge test and train set
alldata<-rbind(cleantest, cleantrain)

#Clean up column names
names(alldata) = gsub("\\()", "", names(alldata))
names(alldata) = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",names(alldata))
names(alldata) = gsub("mean","Mean",names(alldata))
names(alldata) = gsub("std","StdDev",names(alldata))
names(alldata) = gsub("^(t)","Time",names(alldata))
names(alldata) = gsub("^(f)","Freq",names(alldata))


#From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

#Melt the data set to have one measurement per line
ids= names(alldata)[1:3]
variables= names(alldata)[-c(1,2,3)]
alldata_melted= melt(alldata, id =ids, measure.vars = variables)

#Calculate the mean value for each activity for each subject for each variable
finalset<-dcast(alldata_melted, SubjectID+ActivityLabel~variable, mean)
write.table(finalset, "./finalset.txt",row.name=FALSE)
