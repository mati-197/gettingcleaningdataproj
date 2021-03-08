# This script,run_analysis.R, does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.


# First we define the location of the files we are going to use.

data_path <- "C:/Users/matia/OneDrive/Escritorio/DS/R/Getting and Cleaning Data/assign/UCIHARDataset"

train_data <- "train/X_train.txt"
test_data <- "test/X_test.txt"

train_label <- "train/y_train.txt"
test_label <- "test/y_test.txt"

features <- "features.txt"
featurestable <- read.table(file.path(data_path, features))

activity_label <- "activity_labels.txt"

train_subject <- "train/subject_train.txt"
test_subject <- "test/subject_test.txt"

# Then we read and merge the datasets we need.

#observations

traintable <- read.table(file.path(data_path, train_data))
testtable <- read.table(file.path(data_path, test_data))

total_data <- rbind(traintable, testtable)

#labels
trainlbltable <- read.table(file.path(data_path, train_label))
testlbltable <- read.table(file.path(data_path, test_label))

total_labels <- rbind(trainlbltable, testlbltable)

#subjects 
trainsubtable <- read.table(file.path(data_path, train_subject))
testsubtable <- read.table(file.path(data_path, test_subject))

total_subjects <- rbind(trainsubtable, testsubtable)

#activity text labels
activity_labels <- read.table(file.path(data_path, activity_label))

#Now we extract only the measurements on the mean and standard deviation for each measurement using grep.

col_nums = grep("mean|std",featurestable[,2])
col_names = grep("mean|std",featurestable[,2],value = TRUE)

total_data <- select(total_data, all_of(col_nums))

#now we change the activity number for its corresponding activity

total_labels <- activity_labels[match(total_labels[,1],activity_labels[,1]),2]

#adding the new labels to the data:

final_data <- cbind(total_data,total_labels,total_subjects)

#Finally we label the data set with descriptive variable names

names(final_data) <- c(col_names,"Activity","Subject")

# Aditional independent tidy data set with 
# the average of each variable for each activity and each subject.

averages <- final_data %>% group_by(Activity, Subject) %>% summarize_all(funs(mean))



