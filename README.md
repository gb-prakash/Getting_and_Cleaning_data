# Getting_and_Cleaning_data
## Getting and Cleaning Data Course Project:
This read-me describes the data and overview of the transformations and actions that have been applied to the data set in the process of creating a tidy data set.

## Data Source:
Original Source:	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones               
Dataset Used for the Project:	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Dataset Information:
Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Attribute Information:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


## Actions carried out on the Dataset for making it Tidy Data.

There are 5 activities that are being undertaken:

* Merges the training and the test sets to create one data set
* Extract the measurements on the mean and standard deviation for each measurement
* Use descriptive activity names to name the activities in the data set
* Label the data set with descriptive variable names
* From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject


## Information about the run_analysis.R script and how it executes the above actions in creating a Tidy Dataset 

* Creating a Working Directory
* Loading the data.table and dplyr libraries into the script.
* Downloading the dataset and reading all the data into the variables for further use.
* Merging X and Y Train and Test Sets and renaming the columns using the metadata previously loaded.
*	Extracting the Mean and Standard deviation Variables from the dataset and preparing a Final DataSet.
*	Assigning Descriptive Activity names to the Activities. 
*	Observing the column names and Renaming the Variables with Appropriate Labels.
*	Preparing the Tidy Data Set with the Mean of the Variables calculated by Participant and Activity and creating a TextFile with Processed Data.

