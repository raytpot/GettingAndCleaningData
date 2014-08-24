# Load the variable names for further filtering
# Load the activity labels
# Compute the logical vector of all mean and std variables
variables <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityCode","Activity"))
meanAndStd <- c(variables[grepl("mean\\(\\)", variables$V2),][["V1"]],variables[grepl("std\\(\\)", variables$V2),][["V1"]])

# Load the trading dataset with column names
# Filter the ones 
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=variables$V2)
filteredTrainingSet <- trainingSet[,meanAndStd]

trainingAct <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names=c("ActivityCode"))

trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
filteredTrainingSet <- cbind(filteredTrainingSet,trainingAct)
filteredTrainingSet <- cbind(filteredTrainingSet,trainingSubject)


testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=variables$V2)
filteredTestSet <- testSet[,meanAndStd]

testAct <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names=c("ActivityCode"))

testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
filteredTestSet <- cbind(filteredTestSet,testAct)
filteredTestSet <- cbind(filteredTestSet,testSubject)


meanAndStdSet <- rbind(filteredTrainingSet, filteredTestSet)
meanAndStdSet <- merge(meanAndStdSet, activities, by.X = "ACtivityCode", by.Y = "ActivityCOde")

head(fullSet)


final2 <- aggregate(fullSet[,2:68], fullSet[,c("Activity","Subject")], mean)
str(final2)
head(final2)
