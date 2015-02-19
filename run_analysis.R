# File Type: R script
# Course name: Data Science Specialisation
# Date of file: Feb 2015
# Synopsis:
# This R script is written for Data Science Specialisation course at Feb 2015.
# The aim of this script is as follows.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 

# summon required packages.
if (!require("plyr")) {install.packages("plyr")}
library(plyr)

if (!require("dplyr")) {install.packages("dplyr")}
library(dplyr)

if (!require("stringr")) {install.packages("stringr")}
library(stringr)

if (!require("reshape2")) {install.packages("reshape2")}
library(reshape2)

# step A, loading data.
# load activity names from "activity_labels.txt" into "activity.table".
# load variables names from "features.txt" into "feature.table". 
# load x test variables from "x_test.txt" into "test.x" object.
# load y test variables from "y_test.txt" into "test.y" object.
# load x training variables from "x_train.txt" into "train.x" object.
# load y training variables from "y_train.txt" into "train.y" object.
activity.table <- read.table("./UCI HAR Dataset/activity_labels.txt")
feature.table <- read.table("./UCI HAR Dataset/features.txt")
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")


# step B, processing columns and column names.
# confer features as column names of datasets. 
# rename activities and subjects.
# subset mean and SD variables from "test.x" and "train.x" objects.
names(test.x) <- feature.table[,2]
names(test.y) <- "ActivityID"
names(test.subject) <- "subject"
names(train.x) <- feature.table[,2]
names(train.y) <- "ActivityID"
names(train.subject) <- "subject"
test.x <- test.x[, grepl("mean|std", names(test.x))]
train.x <- train.x[, grepl("mean|std", names(train.x))]

# create a descriptive activity data frame for test and training data.
descr.act.test  <- data.frame(activity.table[test.y[,1],2])
names(descr.act.test) <- "ActivityName"
descr.act.train <- data.frame(activity.table[train.y[,1],2])
names(descr.act.train) <- "ActivityName"

# step C, merge and melt data frames.
# merge data frames
test.data <- cbind(test.subject, descr.act.test, test.y, test.x)
train.data <- cbind(train.subject, descr.act.train, train.y, train.x)
samsung.data <- rbind (test.data, train.data)

# melt data frame
samsung.data.melted <- melt(samsung.data, id.vars = c("subject", "ActivityName", "ActivityID") )

# cast data frame to generate the "average of each variable for each activity and each subject".
samsung.data.tidy <- dcast(samsung.data.melted, subject + ActivityName ~ variable, mean)

# the cleaned up data is thus written to disc.
write.table(samsung.data.tidy, file = "./TidiedSamSungdataQuan.txt", row.name=FALSE)







