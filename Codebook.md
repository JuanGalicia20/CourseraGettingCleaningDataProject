# Codebook
The data was taken from [UCI HAR DATASET](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) dataset.
This is a set of datasets that presents an experiment realized in 30 volunteers, performing different activities and using a smartphone to measure certain functions.
From this data, we know that its formed from three main parts. That are the subject, the data (features) and the activities that are measured. All of them divided in train and test data. 
This dataset contains the features names and activity names separated from the real data measured.
So, the subject dataframes refers to each observation done to an individual.
The "x" dataframes refers to the features, or data measured and colected directly from the device.
And finally the "y" dataframes refers to the set of codes refering to certain activities that were measured from the person wearing the device.

## Transformations 
* First the data was read into variables and merged together into a big dataset, first merging the "x", "y" and subject datasets together in train-test order.
* Then selecting the right columns that were the ones including the mean and standard deviation, and subsetting the main dataframe into this and subject, code columns.
* Changing and modifying column names to make it more readable
* Modifying and substituing certain characters from the variables to make a tidyDataset. 
* Using descriptive names for the activities and measurements.
* Finally, creating the second independent tidy Data set that contains the average of each variable for each activity and subject. Using the group by function and summarizing all the variables using the mean, remebering that the interesting paramenters were the subject and activity ones.

## Code variables
* features = dataframe containing the features.txt data. That is the labels of all the features, data that was measured, from the subjects.
* activityNames = dataframe containing the activity_labels.txt. Labels of the activities done by the subjects.
* subjectTest / subjectTrain = dataframes containing subject_test.txt / subject_train.txt. Data containing the subject data.
* dataTest / dataTrain = X_test.txt / X_train.txt. Data measured from the subjects.
* testLbl / trainLbl = y_test.txt  / y_train.txt. Data, codes, from the activities done by the subjects.
* finalData = data merged from "x", "y", and subject variables.
* secondData = independient tidy data set.
