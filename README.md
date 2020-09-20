# CourseraGettingCleaningDataProject
Coursera week 4 Getting and Cleaning Data course project.

## Explanation of run_analysis.R
First it sets the working directory used for this project.

Then, download the file if it hasnt been downloaded yet. And unzip it to extract the following files.
* features.txt
* activity_labels.txt
* subject_test.txt
* subject_train.txt
* x_test.txt
* x_train.txt
* y_test.txt
* y_train.txt

assigning a variable to each of them, then we rbind them each "x", "y" and subject dataframe in train-test order.
Then, we merge them together into a big dataframe. Selecting the interesting columns that are the mentioned, the ones including mean or standard deviation. And subsetting it from the big dataframe.

Finally transform it into a tidy data set, modifying the columns into a more readable ones and gsubstituing values for appropriate labels with descriptive names. And creating a second independent tidy data set with the average of each variable for each activity and each subject.

### Files
* Codebook.md its a code book describing the data used, its variables, purpose and what was used for cleaning up the data.
* run_analysis.R its the R code used for performing the getting and cleaning of the data.
* secondTidyData.txt its the final exported tidy set that was the result of the R code described previously.
