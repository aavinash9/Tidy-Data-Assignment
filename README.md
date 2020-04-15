# Tidy-Data-Assignment
Applied following steps to complete the assignment

1. Download the file from the URL provided  

2. Read all the files data from above file into data frames 

3. Read column names from features file and update the column names of the test and train data frames  

4.Updated the column names of subject and activity data frames for better description

5. Merge all the data frames in to a single data frame

6. Select from above data frame all columns with column name containing 'std' or 'mean' and store this in a new data frame 'selectdb'. THis solved the requirement for '2. Extracts only the measurements on the mean and standard deviation for each measurement.'

7. Using activity_labels created above to update to replace the levels of activity in the data frame selectdb by the text description of the activity. This solved the third requirement '3. Using activity descriptive names to name the activities in the data set'

8. Clean the labels of variables, removing the parentheses and replacing hyphens and commas by dots. This solved the fourth requirment '4. Appropriately labeling the data set with descriptive variable names'

9. Using aggregate, got the average for each person and activity solving the fifth requirment. 

