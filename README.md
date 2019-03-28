# Getting-and-cleaning-week-4

This repo is dedicated to the week 4 assignment of getting and cleaning data.
The code uses the Human Activity Recognition Using Smartphones Data Set, which can be downloaded via https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, the zip file should be extracted before this code is run.

### Dataset description
Two variables X and Y have been provided, variable X is sensor signals from the smartphone at the waist measured across 30 subjects.
Varibale Y is the type of work the candidate was performing during the measurement. 

### The code was written in order to create a tidy data set based on assignment instructions
The training and the test sets are merged to create one data set,
followed by command rbind to combine training and test set and extract only the measurements on the mean and standard deviation for each measurement. Then an independent tidy data set with the average of each variable for each work and each candidate is created.
