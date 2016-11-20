##################Preprocessing######################################:
#Setting the Working directory
if (!getwd() == "C:/Users/GBP/Documents/Coursera/getting-and-cleaning-project") {
  dir.create("C:/Users/GBP/Documents/Coursera/getting-and-cleaning-project",showWarnings = TRUE, recursive = FALSE, mode = "0777")
  setwd("C:/Users/GBP/Documents/Coursera/getting-and-cleaning-project")
}

#Loading the following libraries
library(plyr) #for effective datamanipulation and organization
library(dplyr) 
library(data.table) # for handling the data frame better

#Downloading the Dataset using the tempfile() and reading them into r
dataset <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dataset, mode ="wb")
unzip(dataset, list = TRUE)
YTest <- read.table(unzip(dataset, "UCI HAR Dataset/test/y_test.txt"))
XTest <- read.table(unzip(dataset, "UCI HAR Dataset/test/X_test.txt"))
SubjectTest <- read.table(unzip(dataset, "UCI HAR Dataset/test/subject_test.txt"))
YTrain <- read.table(unzip(dataset, "UCI HAR Dataset/train/y_train.txt"))
XTrain <- read.table(unzip(dataset, "UCI HAR Dataset/train/X_train.txt"))
SubjectTrain <- read.table(unzip(dataset, "UCI HAR Dataset/train/subject_train.txt"))
Features <- read.table(unzip(dataset, "UCI HAR Dataset/features.txt"))
unlink(dataset) # unlinking the tempfile()

#########Transformation 1: Merging the Training and Test sets into a Master Set########################

#Assigning the column names appendingand Merging the files assuming them to be in alignment
colnames(XTrain) <- t(Features[2])
colnames(XTest) <- t(Features[2])

#Merging the Traning and Test datasets and removing the duplicates
XTrain$activities <- YTrain[, 1]
XTrain$participants <- SubjectTrain[, 1]
XTest$activities <- YTest[, 1]
XTest$participants <- SubjectTest[, 1]
Masterdata <- rbind(XTrain, XTest)
duplicated(colnames(Masterdata))
Masterdata <- Masterdata[, !duplicated(colnames(Masterdata))]

######## Transformation 2: Preparing a subset of data with the required columns###################
Activities <- Masterdata$activities # Extracting the Activities from Master Data
Participants <- Masterdata$participants # Extracting the Participants from Master Data
Mean <- grep("mean", names(Masterdata), value = FALSE, fixed = TRUE) # Extractin the mean mean  measurements
Mean <- append(Mean, 471:477) # Appending the columns which are also the mean measurements
Meandata <- Masterdata[Mean]
STD <- grep("std()", names(Masterdata), value = FALSE) # Extracting the Standard deviation Measurements
STDdata <- Masterdata[STD]
Finaldata <- cbind(Participants,Activities,Meandata,STDdata) # Preparing the Final data set with the selected columns

###### Transformation 3: Assigning descriptive activity names to the activities
Finaldata$Activities <- as.character(Finaldata$Activities)
Finaldata$Activities[Finaldata$Activities == 1] <- "WALKING"
Finaldata$Activities[Finaldata$Activities == 2] <- "WALKING_UPSTAIRS"
Finaldata$Activities[Finaldata$Activities == 3] <- "WALKING_DOWNSTAIRS"
Finaldata$Activities[Finaldata$Activities == 4] <- "SITTING"
Finaldata$Activities[Finaldata$Activities == 5] <- "STANDING"
Finaldata$Activities[Finaldata$Activities == 6] <- "LAYING"
Finaldata$Activities <- as.factor(Finaldata$Activities)

####Transformation 4: Using appropriate lables for the variables#######
names(Finaldata) # Observe the dataset and cleanse the data
#Cleansing the data
names(Finaldata) <- gsub("Acc", "Accelerator", names(Finaldata))
names(Finaldata) <- gsub("Mag", "Magnitude", names(Finaldata))
names(Finaldata) <- gsub("Gyro", "Gyroscope", names(Finaldata))
names(Finaldata) <- gsub("^t", "Time", names(Finaldata))
names(Finaldata) <- gsub("^f", "Frequency", names(Finaldata))
names(Finaldata) <- gsub("Jerk", "JerkSignal", names(Finaldata))
names(Finaldata) <- gsub("BodyBody", "Body", names(Finaldata))

Finaldata$Participants <- as.character(Finaldata$Participants)
Finaldata$Participants[Finaldata$Participants == 1] <- "Participant 1"
Finaldata$Participants[Finaldata$Participants == 2] <- "Participant 2"
Finaldata$Participants[Finaldata$Participants == 3] <- "Participant 3"
Finaldata$Participants[Finaldata$Participants == 4] <- "Participant 4"
Finaldata$Participants[Finaldata$Participants == 5] <- "Participant 5"
Finaldata$Participants[Finaldata$Participants == 6] <- "Participant 6"
Finaldata$Participants[Finaldata$Participants == 7] <- "Participant 7"
Finaldata$Participants[Finaldata$Participants == 8] <- "Participant 8"
Finaldata$Participants[Finaldata$Participants == 9] <- "Participant 9"
Finaldata$Participants[Finaldata$Participants == 10] <- "Participant 10"
Finaldata$Participants[Finaldata$Participants == 11] <- "Participant 11"
Finaldata$Participants[Finaldata$Participants == 12] <- "Participant 12"
Finaldata$Participants[Finaldata$Participants == 13] <- "Participant 13"
Finaldata$Participants[Finaldata$Participants == 14] <- "Participant 14"
Finaldata$Participants[Finaldata$Participants == 15] <- "Participant 15"
Finaldata$Participants[Finaldata$Participants == 16] <- "Participant 16"
Finaldata$Participants[Finaldata$Participants == 17] <- "Participant 17"
Finaldata$Participants[Finaldata$Participants == 18] <- "Participant 18"
Finaldata$Participants[Finaldata$Participants == 19] <- "Participant 19"
Finaldata$Participants[Finaldata$Participants == 20] <- "Participant 20"
Finaldata$Participants[Finaldata$Participants == 21] <- "Participant 21"
Finaldata$Participants[Finaldata$Participants == 22] <- "Participant 22"
Finaldata$Participants[Finaldata$Participants == 23] <- "Participant 23"
Finaldata$Participants[Finaldata$Participants == 24] <- "Participant 24"
Finaldata$Participants[Finaldata$Participants == 25] <- "Participant 25"
Finaldata$Participants[Finaldata$Participants == 26] <- "Participant 26"
Finaldata$Participants[Finaldata$Participants == 27] <- "Participant 27"
Finaldata$Participants[Finaldata$Participants == 28] <- "Participant 28"
Finaldata$Participants[Finaldata$Participants == 29] <- "Participant 29"
Finaldata$Participants[Finaldata$Participants == 30] <- "Participant 30"
Finaldata$Participants <- as.factor(Finaldata$Participants)

####Transformation 5: Creating the Resultant Tidy Dataset with the Mean of Each Variable 
#####       broken down by Participant and Activity
Finaldata.dt <- data.table(Finaldata)
TidyData <- Finaldata.dt[, lapply(.SD, mean), by = 'Participants,Activities']
#### Writing the Resultant Tidy Data into a File
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
