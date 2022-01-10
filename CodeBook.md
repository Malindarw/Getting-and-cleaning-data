Malinda WImalaratne
Peer-graded Assignment: Getting and Cleaning Data Course Project
Five steps inlcluded in run_analysis.R
A. Getting untidy data
Read the downloded dataset to R from unzipped folder UCI HAR Dataset

B. Assign data to data frames
features <- features.txt
actvities <- actvity_label.txt
subgect_test <- test/subject_test.txt
x_test <- test/X_test.txt
y_test <- test/y_test.txt
subject_train <- train/subject_train.txt
x_train <- train/X_train.txt
y_train <- train/y_train.txt

1. Merge training and test data
row bind training and test
rbind (x_train, x_test)
rbind (y_train, y_test)
rbind (subject_train, subject_test)
Column bind to create final Merged_data 
cbind(Subject_tr_te, Y_tr_te, X_tr_te)

2. Extracts only the measurements on the mean and standard deviation for each measurement
Extract subject, code and mean and standard deviation (sdt) for each record, and creaded MSData

3. Uses descriptive activity names to name the activities in the data set
Replace the code column in MSData with second column of the activities variable

4. Appropriately labels the data set with descriptive variable names.
change code column to activites as it's recors replaced in the previous steps
Replaced follwing short froms with real nams
Start with character t <- Time
Start with character f <- Frequency
tBody <- TimeBody
Acc <- Accelerometer
gravity <- Gravity
Gyro <- Gyroscope
BodyBody <- Body
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Group data by subject and activity
summarized grouped data taking means of each activity and each subject
Write data into independent data table

