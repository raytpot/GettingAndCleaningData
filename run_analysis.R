# Load the variable names for further filtering
# Load the activity labels
# Compute the logical vector of all mean and std variables
variables <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityCode","Activity"))
meanAndStd <- c(variables[grepl("mean\\(\\)", variables$V2),][["V1"]],variables[grepl("std\\(\\)", variables$V2),][["V1"]])

# Load the training dataset with column names (Requirement 4)
# Get the columns for mean and std (Requirement 2)
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=variables$V2)
filteredTrainingSet <- trainingSet[,meanAndStd]

# Load the training activity file with column names (Requirement 4)
# Load the training subject file wih column names (Requirement 4)
# Add training activity and training subject to the filteredTrainingSet
trainingAct <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names=c("ActivityCode"))
trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
filteredTrainingSet <- cbind(filteredTrainingSet,trainingAct)
filteredTrainingSet <- cbind(filteredTrainingSet,trainingSubject)

# Load the test dataset with column names (Requirement 4)
# Get the columns for mean and std (Requirement 2)
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=variables$V2)
filteredTestSet <- testSet[,meanAndStd]

# Load the test activity file with column names (Requirement 4)
# Load the test subject file with column names (Requirement 4)
# Add test activity and test subject to the filteredTestSet
testAct <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names=c("ActivityCode"))
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
filteredTestSet <- cbind(filteredTestSet,testAct)
filteredTestSet <- cbind(filteredTestSet,testSubject)

# Combine training and test dataset (Requirement 1)
meanAndStdSet <- rbind(filteredTrainingSet, filteredTestSet)

# Merge with activity labels to get descriptive activity name (Requirement 3)
meanAndStdSet <- merge(meanAndStdSet, activities, by.X = "ACtivityCode", by.Y = "ActivityCOde")

# Requirement 5: Repeat the above steps but for all the variables
# Then compute the measurement mean for each Activity and each Subject
trainingSet <- cbind(trainingSet,trainingAct)
trainingSet <- cbind(trainingSet,trainingSubject)
testSet <- cbind(testSet,testAct)
testSet <- cbind(testSet,testSubject)
fullSet <- rbind(trainingSet, testSet)
fullSet <- merge(fullSet, activities, by.X = "ACtivityCode", by.Y = "ActivityCOde")

final <- aggregate(fullSet[,2:562], fullSet[,c("Activity","Subject")], mean)
write.table(final, "./tidy_dataset.txt", row.names = FALSE)
