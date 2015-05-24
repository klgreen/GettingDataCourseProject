# run_Analysis.R

# Process data for the course project for "Getting and Cleaning Data"
# Note: This program can be run as long as the Samsung data is in the working directory.

# First read in the activity labels, extract just the labels and 
names(activity_labels) <- c("activity_idx", "activity_name")

feature_labels <- read.table("UCI_HAR_Dataset/features.txt")
names(feature_labels) <- c("feature_idx", "feature_name")
