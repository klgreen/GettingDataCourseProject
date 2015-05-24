# run_Analysis.R

# Preprocess data for the course project for "Getting and Cleaning Data"
# Note: This program can be run as long as the Samsung data is in the working directory.

# See README.txt for details and for acknowledgement

require(plyr)
require(dplyr)
  
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
#activities <- tmp1$activity
#names(train_activities) <- c("activities")


#combine the columns to create the training data set
train_data <- cbind(train_subjects, train_act, train_short)

train_data_m <- merge(train_data, activity_labels, by="activity_idx")


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
tmp2 <- merge(test_act, activity_labels, by="activity_idx")
#activities <- tmp2$activity
#names(test_activities) <- c("activities")

#combine columns to create the test data set
test_data <- cbind(test_subjects, test_act, test_short)

test_data_m <- merge(test_data, activity_labels, by="activity_idx")



#combine the test and training data sets
all_data <- rbind(test_data_m, train_data_m)

#sort the data, first by subject and then by activity_idx
all_sorted <- arrange(all_data, subject, activity_idx)

#remove the activity index column as it is redundant with the activity column
all_fixed <- select(all_sorted, -activity_idx)

# Get the final result
result <- plyr::ddply(all_fixed, .(subject, activity), colwise(mean))

# need to relabel the columns
labels <- colnames(result)
labels[1] = "Student"
labels[2] = "Activity"
for (i in 3:length(labels)) {
        labels[i] = paste("mean(", gsub("\\.\\.\\.", "", labels[i]), ")", sep="")
        labels[i] = gsub("\\.\\.", "", labels[i])
}

colnames(result) = labels

# the final result is in result

write.table(result, "PhoneData.txt", row.name=FALSE, sep=",")
