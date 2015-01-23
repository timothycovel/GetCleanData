##Data Source##
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Files Used###
* UCI HAR Dataset
** UCI HAR Dataset/activity_labels.txt
** UCI HAR Dataset/features.txt
** UCI HAR Dataset/test/x_test.txt
** UCI HAR Dataset/test/y_test.txt
** UCI HAR Dataset/test/subject_test.txt
** UCI HAR Dataset/train/x_train.txt
** UCI HAR Dataset/train/y_train.txt
** UCI HAR Dataset/train/subject_train.txt

##Program Values##
* features_names - feature names taken from UCI HAR Dataset/features.txt
* activity_names - activity names taken from UCI HAR Dataset/activity_labels.txt

##Program Data##
* x_testdata - table data from UCI HAR Dataset/test/x_test.txt 
* x_traindata - table data from UCI HAR Dataset/train/x_train.txt
* y_testdata - table data from UCI HAR Dataset/test/y_test.txt
* y_traindata - table data from UCI HAR Dataset/train/y_train.txt
* subject_testdata - table data from UCI HAR Dataset/test/subject_test.txt
* subject_traindata - table data from UCI HAR Dataset/train/subject_train.txt
* trainingcols - merged data with names from [y_traindata,x_traindata,subject_traindata]
* testingcols - merged data with names from [y_testdata,x_testdata,subject_testdata]
* datarows - merged data from [trainingcols,testingcols]
* goo - transformed data after melt() to arrange data by "Subject_ID", "Activity_ID", "Activity_Name"
* tidy_goo - data aggregated using dcast() to get the mean for each observed activity
* data - result table of the tidy data set

##Program Output##
* Output Contains observations for 30 subjects participating in 6 activities, grouped first by Activity Name, then by Subject ID
* Each additional collumn contains the observed metric displayed as either Mean() or Std() and tagged as x, y, or z as appropriate. 

###Activity Names###
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

###Observation Data Names###
* Mean(tBodyAcc)-X
* Mean(tBodyAcc)-Y
* Mean(tBodyAcc)-Z
* Std(tBodyAcc)-X
* Std(tBodyAcc)-Y
* Std(tBodyAcc)-Z
* Mean(tGravityAcc)-X
* Mean(tGravityAcc)-Y
* Mean(tGravityAcc)-Z
* Std(tGravityAcc)-X
* Std(tGravityAcc)-Y
* Std(tGravityAcc)-Z
* Mean(tBodyAccJerk)-X
* Mean(tBodyAccJerk)-Y
* Mean(tBodyAccJerk)-Z
* Std(tBodyAccJerk)-X
* Std(tBodyAccJerk)-Y
* Std(tBodyAccJerk)-Z
* Mean(tBodyGyro)-X
* Mean(tBodyGyro)-Y
* Mean(tBodyGyro)-Z
* Std(tBodyGyro)-X
* Std(tBodyGyro)-Y
* Std(tBodyGyro)-Z
* Mean(tBodyGyroJerk)-X
* Mean(tBodyGyroJerk)-Y
* Mean(tBodyGyroJerk)-Z
* Std(tBodyGyroJerk)-X
* Std(tBodyGyroJerk)-Y
* Std(tBodyGyroJerk)-Z
* Mean(tBodyAccMag)
* Std(tBodyAccMag)
* Mean(tGravityAccMag)
* Std(tGravityAccMag)
* Mean(tBodyAccJerkMag)
* Std(tBodyAccJerkMag)
* Mean(tBodyGyroMag)
* Std(tBodyGyroMag)
* Mean(tBodyGyroJerkMag)
* Std(tBodyGyroJerkMag)
* Mean(fBodyAcc)-X
* Mean(fBodyAcc)-Y
* Mean(fBodyAcc)-Z
* Std(fBodyAcc)-X
* Std(fBodyAcc)-Y
* Std(fBodyAcc)-Z
* Mean(fBodyAccFreq)-X
* Mean(fBodyAccFreq)-Y
* Mean(fBodyAccFreq)-Z
* Mean(fBodyAccJerk)-X
* Mean(fBodyAccJerk)-Y
* Mean(fBodyAccJerk)-Z
* Std(fBodyAccJerk)-X
* Std(fBodyAccJerk)-Y
* Std(fBodyAccJerk)-Z
* Mean(fBodyAccJerkFreq)-X
* Mean(fBodyAccJerkFreq)-Y
* Mean(fBodyAccJerkFreq)-Z
* Mean(fBodyGyro)-X
* Mean(fBodyGyro)-Y
* Mean(fBodyGyro)-Z
* Std(fBodyGyro)-X
* Std(fBodyGyro)-Y
* Std(fBodyGyro)-Z
* Mean(fBodyGyroFreq)-X
* Mean(fBodyGyroFreq)-Y
* Mean(fBodyGyroFreq)-Z
* Mean(fBodyAccMag)
* Std(fBodyAccMag)
* Mean(fBodyAccMagFreq)
* Mean(fBodyAccJerkMag)
* Std(fBodyAccJerkMag)
* Mean(fBodyAccJerkMagFreq)
* Mean(fBodyGyroMag)
* Std(fBodyGyroMag)
* Mean(fBodyGyroMagFreq)
* Mean(fBodyGyroJerkMag)
* Std(fBodyGyroJerkMag)
* Mean(fBodyGyroJerkMagFreq)
