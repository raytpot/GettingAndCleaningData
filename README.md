GettingAndCleaningData
======================

## Files
* run_analysis.R - Extract and clean up the data script
* tidy_dataset.txt - Tidy dataset for requirement 5
* features.txt - List of all variables (modification of the original features.txt)
* features_info.txt - Information about the variables used on the features (modification of the original features_info.txt

## Load and Clean up steps
* Load the supporting information data: activity labels, variable names
* Load the training and test dataset separately with the descriptive variable names
* Combine the dataset with the activity vector and subject vector (for both training and test)
* Combine training and test dataset to a complete dataset
* Merge with the activity labels to get descriptive activity names
* Compute the mean of each variable for each activity and each subject
