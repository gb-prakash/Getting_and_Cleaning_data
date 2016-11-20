#Introduction

###Information about the run_analysis.R script and how it executes the above actions in creating a Tidy Dataset 
------------------------------------------------------------------------------------------------------------

Step 1: Creating a Working Directory

Step 2: Loading the data.table and dplyr libraries

Step 3:	Downloading the dataset and reading the required data into Recognition

Step 4: Data from Both the datasets are being Merged and the column names are assigned using the Features.txt file. 

Step 5:	Extracting the Mean and Standard deviation Variables from the dataset and preparing a Final DataSet

Step 6:	As Activity Data is addressed using 1:6. We take the activity Labels from activity_labels.txt and substitute them in the dataset.

Step 7:	Observing the column names and Renaming the Variables with Appropriate Labels.

Step 8:	Preparing the Tidy Data Set with the Mean of the Variables calculated by Participant and Activity and creating a TextFile with Processed Data.

##Variables
* x_train/X_train.txt: Traning Data Set
* y_train/Y_train.txt: Training Lables
* x_test/X_test.txt: Test Data Set
* y_test/Y_test.txt: Test Labels
* SubjectTest/Subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* Activity_labels: Links the class labels with their activity name.
* Features/features.txt: List of all Features or Variable/Column Names

Each Variable or Column Name contains data about
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.
