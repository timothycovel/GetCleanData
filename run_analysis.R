require("data.table")
require("reshape2")

# feature name preprocessing pipe(), must have 'egrep', 'awk', and 'sed' available in $PATH
# This gives us nice clean names to use
feature_names <- read.table(pipe("egrep 'std|mean' UCI\\ HAR\\ Dataset/features.txt|awk '{print $2}'|sed -e 's/\\(^.*\\)-mean()/Mean(\\1)/' -e 's/\\(^.*\\)-meanFreq()/Mean(\\1Freq)/' -e 's/\\(^.*\\)-std()/Std(\\1)/' -e 's/BodyBody/Body/'"))[,1]

# grab activity_names data
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]

# grab x_test data and subset it by the feature names
x_testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
x_testdata = x_testdata[,feature_names]

# grab y_test data
y_testdata <- read.table("UCI HAR Dataset/test/y_test.txt")

# grab subject_test data
subject_testdata <- read.table("UCI HAR Dataset/test/subject_test.txt")

# grab x_train data and subset it by the feature names
x_traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
x_traindata = x_traindata[,feature_names]

# grab y_train data
y_traindata <- read.table("UCI HAR Dataset/train/y_train.txt")

# grab subject_train data
subject_traindata <- read.table("UCI HAR Dataset/train/subject_train.txt")

# set up the 'y' test and train data using the activity names provided
y_testdata[,2] = activity_names[y_testdata[,1]]
y_traindata[,2] = activity_names[y_traindata[,1]]


# NAME ALL THE THINGS!
# x data is labled from feature_names, y data is labled with the activity ID and Name, subjects data gets the subject ID
names(x_testdata) = feature_names
names(x_traindata) = feature_names
names(y_testdata) = c("Activity_ID", "Activity_Name")
names(y_traindata) = c("Activity_ID", "Activity_Name")
names(subject_testdata) = "Subject_ID"
names(subject_traindata) = "Subject_ID"

# bind together all the training data
trainingcols <- cbind(as.data.table(subject_traindata), y_traindata, x_traindata)

# bind together all the testing data
testingcols <- cbind(as.data.table(subject_testdata), y_testdata, x_testdata)

# clip the testing and the training columns into matching rows
datarows <- rbind(trainingcols,testingcols)

# use melt to group all the observations by subject and activity
goo <- melt(datarows, id=c("Subject_ID","Activity_ID","Activity_Name"))

# dcast does the heavy lifting of getting the mean of the observations by each subject and activity
tidy_goo <- dcast(goo, Subject_ID + Activity_Name ~ variable, mean)

write.table(tidy_goo, file="my_wide_tidydata.txt", sep="\t", row.names=FALSE)

data <- read.table("my_wide_tidydata.txt")
View(data)




