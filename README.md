GettingAndCleaningData
======================

**Files**
run_analysis.R - Extract and clean up the data script
tidy_dataset.txt - Tidy dataset for requirement 5
features.txt - List of all variables (modification of the original features.txt)
features_info.txt - Information about the variables used on the features (modification of the original features_info.txt

**Load and Clean up steps**
1. Load the supporting information data: activity labels, variable names
2. Load the training and test dataset separately with the descriptive variable names
3. Combine the dataset with the activity vector and subject vector (for both training and test)
4. Combine training and test dataset to a complete dataset
5. Merge with the activity labels to get descriptive activity names
6. Compute the mean of each variable for each activity and each subject
