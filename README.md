---
output: html_document
---
# GettingDataCourseProject

Create a Tidy Data Set for course project in JHU/Coursera Course "Getting and Cleaning Data" 

Use this <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">data</a> for the project.
   

This is an allegedly <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">full description</a> of the data.


Tidy Data is described in an <a href="http://vita.had.co.nz/papers/tidy-data.pdf">article </a> written by Hadley Wickham in the Journal of Statistical Software, titled "Tidy Data."

Use data from source [1], listed below.

This progject is an R script called, "run_Analysis.R"" that does the following:
<i>
<font ="-1">
<ol type="1">
<li> Merges the training and the test sets to create one data set,</li>
<li> Extracts only the measurements on the mean and standard deviation for each measurement, </li>
<li> Uses descriptive activity names to name the activities in the data set,</li>
<li> Appropriately labels the data set with descriptive variable names, </li>
<li> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>
</font>
</i>
** Note that these items 1:5 are exact quotes from the Coursera/JHU assignment page.

Method is described in the program.
<ol type="1">
<li>Read activities labels and feature labels</li>
<li> for each of the training and test sets</li>
<li> read in the data for the set and the subjects</li>
<li>Extract only the data with 'mean' or 'std' </li>
<li> combine (merge) the set, the subjects and the activities</li>
<li> combine the test and training sets</li>
<li> summarize the data</li>
<li> clean the labels</li>
<li> write the result table to text file </li>
</ol>


Note: Very simple how to upload files: <p>
invoke Git Bash window<p>
cd GettingDataCourseProject<p>
git add README.md <p>
git add run_Analysis.R<p>
git commit -m "<blurb about changes>" <p>
git push
<br />

The dataset used for this analysis is described in the publication: <p />
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

