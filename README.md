---
output: html_document
---
# GettingDataCourseProject

Create a Tidy Data Set for course project in JHU/Coursera Course "Getting and Cleaning Data" 

Use this <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">data</a> for the project.
   

This is a full description of the data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Tidy Data is described in an article written by Hadley Wickham in the Journal of Statistical Software, titled "Tidy Data" located (at the time of this writing) at: http://vita.had.co.nz/papers/tidy-data.pdf

Write an R script called, "run_Analysis.R"" that does the following:
0.    Use data from source [1], listed below.
1.    Merges the training and the test sets to create one data set.
2.    Extracts only the measurements on the mean and standard deviation for each measurement. 
3.    Uses descriptive activity names to name the activities in the data set
4.    Appropriately labels the data set with descriptive variable names. 
5.    From the data set in step 4, creates a second, independent tidy data
        set with the average of each variable for each activity and each subject.

** Note that these items 1:5 are exact quotes from the Coursera/JHU assignment page.

Note: Very simple how to upload files:
invoke Git Bash window
cd GettingDataCourseProject
git add README.md 
git add run_Analysis.R
git commit -m "I changed ...." 
git push

The dataset used for this analysis is described in the publication:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

