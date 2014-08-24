variables <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityCode","Activity"))
meanAndStd <- c(variables[grepl("mean\\(\\)", variables$V2),][["V1"]],variables[grepl("std\\(\\)", variables$V2),][["V1"]])

trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=variables$V2)
trainingSet <- trainingSet[,meanAndStd]

trainingAct <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names=c("ActivityCode"))

trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
trainingSet <- cbind(trainingSet,trainingAct)
trainingSet <- cbind(trainingSet,trainingSubject)


testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=variables$V2)
testSet <- testSet[,meanAndStd]

testAct <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names=c("ActivityCode"))

testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
testSet <- cbind(testSet,testAct)
testSet <- cbind(testSet,testSubject)


fullSet <- rbind(trainingSet, testSet)
fullSet <- merge(fullSet, activities, by.X = "ACtivityCode", by.Y = "ActivityCOde")

head(fullSet)

#result <- by(fullSet[,2:68], list(fullSet$Activity, as.factor(fullSet$Subject)), colMeans)
#final <- do.call("rbind", as.list(result))

final2 <- aggregate(fullSet[,2:68], fullSet[,c("Activity","Subject")], mean)
str(final2)
head(final2)
