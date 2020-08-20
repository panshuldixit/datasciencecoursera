# datasciencecoursera
Getting and Cleaning Data Course Project
Purpose
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Data set / input
The data set is collected from the accelerometers from the Samsung Galaxy S smartphone. You can download it in the following link but it’s unnecesary because the script will do it for you.
Zip to download the data set
Full description

Files of the data set
The dataset includes the following files:
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.
The following files are available for the train and test data. Their descriptions are equivalent.
* train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* train/Inertial Signals/ : This directory is irrelevant to our project.

Analysis
I followed the next steps:

Merged the training and the test sets to create one data set.
Extracted only the measurements on the mean and standard deviation for each measurement.
Changed the names of the activities in the data set.
Changed the labels with descriptive variable names.
Generated a data set with the average of each variable for each activity and each subject.
Output
The new data set is in averages.txt with the averages of the mean and the standard deviation of each subject and activity. The details of each variable are in the CodeBook.md file.

Other files in this repository
