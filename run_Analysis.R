# run_Analysis.R

# Process data for the course project for "Getting and Cleaning Data"
# Note: This program can be run as long as the Samsung data is in the working directory.

# First read in the activity labels, extract just the labels and 
activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt")
names(activity_labels) <- c("activity_idx", "activity")

fl <- read.table("UCI_HAR_Dataset/features.txt")
names(fl) <- c("feature_idx", "feature_name")
feature_labels <- fl$feature_name
rm(fl)

### Read the training set
# first the variable data
train_set <- read.table("UCI_HAR_Dataset/train/X_train.txt", header=FALSE, sep="",
                        col.names=feature_labels )

# Extract those columns that contain any references to mean or standard deviation values
train_short <- train_set[, grep("mean|std", colnames(train_set))]


# now read the associated subjects
train_subjects <- read.table("UCI_HAR_Dataset/train/subject_train.txt", header=FALSE, sep="", 
                        col.names=c("subject"))

# now read the activity
train_act <- read.table("UCI_HAR_Dataset/train/y_train.txt", header=FALSE, sep="",
                        col.names=c("activity_idx"))

# turn the activity codes (indices) into descriptive labels
tmp1 <- merge(train_act, activity_labels, by="activity_idx")
activities <- tmp1$activity
#names(train_activities) <- c("activities")


#combine the data
train_data <- cbind(train_subjects, activities, train_short)



### Read the test set
# first the variable data
test_set <- read.table("UCI_HAR_Dataset/test/X_test.txt", header=FALSE, sep="",
                        col.names=feature_labels )

# Extract those columns that contain any references to mean or standard deviation values
test_short <- test_set[, grep("mean|std", colnames(test_set))]


# now read the associated subjects
test_subjects <- read.table("UCI_HAR_Dataset/test/subject_test.txt", header=FALSE, sep="", 
                             col.names=c("subject"))

# now read the activity
test_act <- read.table("UCI_HAR_Dataset/test/y_test.txt", header=FALSE, sep="",
                        col.names=c("activity_idx"))

# turn the activity codes (indices) into descriptive labels
tmp <- merge(test_act, activity_labels, by="activity_idx")
activities <- tmp$activity
#names(test_activities) <- c("activities")

#combine the data
test_data <- cbind(test_subjects, activities, test_short)

all_data <- rbind(test_data, train_data)
