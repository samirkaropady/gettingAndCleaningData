Codebook:

Data Source: The raw data for this analysis was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. It is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Attribute Information: For each record in the dataset it is provided: 
•	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
•	Triaxial Angular velocity from the gyroscope. 
•	A 561-feature vector with time and frequency domain variables. 
•	Its activity label. 
•	An identifier of the subject who carried out the experiment.

Overview of the code:
1. Download the raw data from the source
2. Read files relating to the test dataset and training  (X, Y and Subject files)
3. Read in additional files and adding additional activity details to the activity_labels
4. Add appropriate column names to make the dataset more readable
5. Append the training and test datasets (rbind)
6. Extract only measurements with “mean()” and “std()” in their names using grep function
7. Remove any unwanted characters from the column names
8. Group data at the required level (using functions from dplyr library)

Variable List
test_x and train_x <- corresponding to X_Test.txt  and X_Train.txt from raw data)
test_subject and train_subject <- corresponding to subject_test.txt and subject_train.txt from raw data)
test_y and train_y <- corresponding to Y_Test.txt  and Y_Train.txt from raw data)
features <- corresponding to features.txt from raw data
activity_labels <- corresponding to activity_labels.txt from raw data
test_x_clean and train_x_clean<- datasets appended with appropriate column names
train_test <- combined training and test dataset
train_test_trim <- combined dataset containing only variables of our interest
headers <- list of formatted headers
tidy_table <- final table aggregated at the required level


