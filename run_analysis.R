library(dplyr)
# downloading data frames
# if (!file.exists("Course_Pro.zip")){
#   fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#   download.file(fileURL)
# } 
# if (!file.exists("UCI HAR Dataset")) { 
#   unzip("Course_Pro.zip") 
# }

# loading all data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Merges the training and the test sets to create one data set.
X_tr_te <- rbind(x_train, x_test)
Y_tr_te <- rbind(y_train, y_test)
Subject_tr_te <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject_tr_te, Y_tr_te, X_tr_te)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
MSData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#Uses descriptive activity names to name the activities in the data set
MSData$code <- activities[MSData$code, 2]

#Appropriately labels the data set with descriptive variable names.
names(MSData)[2] = "activity"
names(MSData)<-gsub("^t", "Time", names(MSData))
names(MSData)<-gsub("^f", "Frequency", names(MSData))
names(MSData)<-gsub("tBody", "TimeBody", names(MSData))
names(MSData)<-gsub("Acc", "Accelerometer", names(MSData))
names(MSData)<-gsub("gravity", "Gravity", names(MSData))
names(MSData)<-gsub("Gyro", "Gyroscope", names(MSData))
names(MSData)<-gsub("BodyBody", "Body", names(MSData))
names(MSData)<-gsub("Mag", "Magnitude", names(MSData))
names(MSData)<-gsub("angle", "Angle", names(MSData))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
GroupData <- group_by(MSData, subject, activity)
IndData <- summarise_all(GroupData, funs(mean))
write.table(IndData, "IndData.txt", row.names = FALSE)