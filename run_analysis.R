library("data.table")
library("reshape2")

# Download data set and unzip if it is not available in the current directory
if (! file.exists("")){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  file <- "UCI.zip"
  download.file(url, file, method = "curl")
  
  unzip(file)
}

# grab test data
x_testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
y_testdata <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_testdata <- read.table("UCI HAR Dataset/test/subject_test.txt")

# grab train data
x_traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
y_traindata <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_traindata <- read.table("UCI HAR Dataset/train/subject_train.txt")

# grab feature names and subset the x_data
feature_names <- read.table(pipe("egrep 'std|mean' UCI\\ HAR\\ Dataset/features.txt|awk '{print $2}'|sed -e 's/\\(^.*\\)-mean()/Mean(\\1)/' -e 's/\\(^.*\\)-meanFreq()/Mean(\\1Freq)/' -e 's/\\(^.*\\)-std()/Std(\\1)/' -e 's/BodyBody/Body/'"))[,1]
x_testdata = x_testdata[,feature_names]
x_traindata = x_traindata[,feature_names]

# grab activity_names and add to the y_data
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
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

# bind together all the training and testing data data
datarows <- rbind(cbind(as.data.table(subject_traindata), y_traindata, x_traindata),cbind(as.data.table(subject_testdata), y_testdata, x_testdata))

# use melt to group all the observations by subject and activity, all other fields will be treated as variables for the dcast
goo <- melt(datarows, id=c("Subject_ID","Activity_ID","Activity_Name"))

# dcast does the heavy lifting of getting the mean of the observations by each subject and activity
tidy_goo <- dcast(goo, Activity_Name + Subject_ID ~ variable, mean)

write.table(tidy_goo, file="my_tidydata.txt", sep="\t", row.names=FALSE)

data <- read.table("my_tidydata.txt")
View(data)




