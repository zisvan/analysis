
# Let's get the test data first, it's smaller 
# The goal is to read three text files, and form one data frame
# with as many columns as the total number of columns.
# There are no headers, and no common columns.

# Read in test data files

subject.test <- read.table("../uci_har_dataset/test/subject_test.txt")
labels.test <- read.table("../uci_har_dataset/test/y_test.txt")
data.test <- read.table("../uci_har_dataset/test/X_test.txt")

# Read in training data files

subject.train <- read.table("../uci_har_dataset/train/subject_train.txt")
labels.train <- read.table("../uci_har_dataset/train/y_train.txt")
data.train <- read.table("../uci_har_dataset/train/X_train.txt")

# Bind data together
test.total <- cbind(subject.test, labels.test, data.test)
train.total <- cbind(subject.train, labels.train, data.train)

data.total <- rbind(test.total, train.total) 

# Make header names
features <- read.table("../uci_har_dataset/features.txt")
names <- c("subject", "activity", as.vector(features[,2]))

# features <- readLines("../uci_har_dataset/features.txt")
# names <- c("subject", "activity", features)

# Give data frame the header names
# These are not 'descriptive' yet, just the ones from features
colnames(data.total) <- c(names)

# Get indices of columns we want to keep
index <- grep("subject|activity|mean|std", names)

# Subset data
data.sub <- data.total[, index]

# Give activity names 
# Turn integers into characters
data.sub$activity <- as.character(data.sub$activity)

# Read in the activity file
activity <- read.table("../uci_har_dataset/activity_labels.txt")

# Overwrite each character with the name of activity
for (i in 1:length(activity$V1)){
    n = as.character(activity$V1[i])
    # print(n)
    name = tolower(as.character(activity$V2[i]))
    # print(name)
    data.sub$activity[data.sub$activity == n] <- name
}

# Group by subject and activity
# Summarize means of every other variable
library(dplyr)

df %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean)) %>%
    as.data.frame() %>%
    print

# Write out tidy data
write.table(df, file = "tidy_data.txt", row.names = FALSE)
