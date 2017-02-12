# downloading the file
setwd("C:/Users/sk10613/Documents/Documents/Coursera/Module 2")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"samsung.zip")


# reading in the required data sets
## all required datasets have been pasted in a sibgle folder to make reading them easy 
setwd("C:/Users/sk10613/Documents/Documents/Coursera/Module 2/UCI HAR Dataset/Final")

#reading test dataset related files
test_X <- read.table("X_test.txt",header = FALSE)
test_subject <- read.table("subject_test.txt",header = FALSE)
test_y <- read.table("y_test.txt",header = FALSE)

#reading in training dataset related files
train_x <- read.table("X_train.txt",header = FALSE)
train_subject <- read.table("subject_train.txt",header = FALSE)
train_y <- read.table("y_train.txt",header = FALSE)


#reading in additional files and adding additional activity details to the activity_labels
features <- as.character(read.table("features.txt",header = FALSE)[,2])
activity_labels <- read.table("activity_labels.txt",header = FALSE)
activity_labels_final <- c("subject_id","activity_id",features)

#formatting raw data
test_x_clean <- cbind(test_subject,test_y,test_X)
names(test_x_clean) <- activity_labels_final

train_x_clean <- cbind(train_subject,train_y,train_x)
names(train_x_clean) <- activity_labels_final


############### 1. Merge the training and the test sets to create one data set
train_test <- rbind(train_x_clean, test_x_clean)


############### 2. Extract only the measurements on the mean and standard deviation for each measurement.
train_test_trim <- train_test[,grep("subject_id|activity_id|mean()|std()",activity_labels_final)]


############### 3. Use descriptive activity names to name the activities in the data set
train_test_activity <- merge(train_test_trim,activity_labels,by.x = "activity_id", by.y = "V1", all = TRUE)
colnames(train_test_activity)[82] <- "activity_name"


############### 4. Appropriately labels the data set with descriptive variable names
headers <- names(train_test_activity)
headers <- gsub("-"," ",headers)
headers <- gsub("^t","Time ",headers)
headers <- gsub("^f","Frequency ",headers)
headers <- gsub("BodyBody","Body",headers)
names(train_test_activity) <- headers



############### 5. From the data set in step 4, 
###############    create a second, independent tidy data set with the average of 
###############    each variable for each activity and each subject.

library(dplyr)
byActivity <- group_by(train_test_activity,activity_name,subject_id)
tidy_table <- summarise_each(byActivity,funs(mean))
write.table(tidy_table,file = "tidy.txt")
