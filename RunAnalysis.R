#Download file from URL 

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./sourcedata.zip")
unzip("sourcedata.zip")

#Merges the training and the test sets to create one data set.

#Read file data into data frames
testdata = read.table("./UCI HAR Dataset/test/X_test.txt")
traindata = read.table("./UCI HAR Dataset/train/X_train.txt")

subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")

activity_test = read.table("./UCI HAR Dataset/test/y_test.txt")
activity_train = read.table("./UCI HAR Dataset/train/y_train.txt")

activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

#Read Column Names
colnames = read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

#Assign Column names
names(testdata) <- colnames[,2]
names(traindata) <- colnames[,2] 
names(subject_test) <- "subject"
names(subject_train) <- "subject"
names(activity_test) <- "activity"
names(activity_train) <- "activity"

#Merge data 
test_db = cbind(subject_test, activity_test, testdata)
train_db = cbind(subject_train, activity_train, traindata) 

finaldb = totaldb = rbind(test_db, train_db) 

#2.Extracts only the measurements on the mean and standard deviation for each measurement.  

sum(grepl("\\<mean\\>", names(finaldb)))
sum(grepl("\\<std\\>", names(finaldb)))

selectdb <- finaldb[, c("subject", "activity", names(finaldb)[grepl("\\<mean\\>|\\<std\\>",names(finaldb))])] 

#3. Uses descriptive activity names to name the activities in the data set

selectdb$activity[selectdb[,2] == activity_labels[1,1]] <- activity_labels[1,2]
selectdb$activity[selectdb[,2] == activity_labels[2,1]] <- activity_labels[2,2]
selectdb$activity[selectdb[,2] == activity_labels[3,1]] <- activity_labels[3,2]
selectdb$activity[selectdb[,2] == activity_labels[4,1]] <- activity_labels[4,2]
selectdb$activity[selectdb[,2] == activity_labels[5,1]] <- activity_labels[5,2]
selectdb$activity[selectdb[,2] == activity_labels[6,1]] <- activity_labels[6,2]

# 4. Appropriately labeling the data set with descriptive variable names. 
names(selectdb) <- gsub( "\\(|\\)" , "" , names(selectdb))
names(selectdb) <- gsub( "\\-|\\," , "." , names(selectdb))

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

table(selectdb$activity, selectdb$subject)

tidydb <- aggregate(.~subject + activity, selectdb, mean)

names(tidydb)[3:68] <- paste(names(tidydb)[3:68], ".Avg", sep = "")

write.table(tidydb, "tidydb.txt", row.names=FALSE)





