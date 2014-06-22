# 1. Merges the training and the test sets to create one data set.

XTotal <- rbind(read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE), read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE))
YTotal <- rbind(read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE), read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE))
STotal <- rbind(read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE), read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE))

ActivityLabel <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

Feat <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
names(XTotal) <- Feat$V2

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Total <-  XTotal[, grep("-mean\\(\\)|-std\\(\\)", Feat[, 2])]


# 3. Uses descriptive activity names to name the activities in the data set

library(plyr)
Total <- cbind(join(YTotal,ActivityLabel)$V2, Total)

# 4. Appropriately labels the data set with descriptive variable names. 

colnames(Total)[1] <- "ActivityName"
names(STotal) <- "SubjectNumber"
Total <- cbind(STotal, Total)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

TD <-  aggregate(Total, by=list(ActivityGroup = Total$ActivityName, Subject=Total$SubjectNumber), mean)
TD["ActivityName"] <- NULL
TD["SubjectNumber"] <- NULL

write.table(TD, "Tidy_Dataset.txt")
