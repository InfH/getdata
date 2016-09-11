#' Analysis of UCI HAR dataset
#' Date modified: 10 August 2016

# Downloading and extracting data files (run only once)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip") 
unzip("data.zip") 

# Explore directory structure
list.files()
list.dirs()
list.files("UCI HAR Dataset")
list.files("UCI HAR Dataset/test")
list.files("UCI HAR Dataset/train")

# Load data into R

# Get test data: measurements, activity labels, subject labels
test <- read.table("UCI HAR Dataset/test/X_test.txt") # measurements
testy <- read.table("UCI HAR Dataset/test/y_test.txt") # activity labels
testsub <- read.table("UCI HAR Dataset/test/subject_test.txt") # subject labels

# Get training data: measurements, activity labels, subject labels
train <- read.table("UCI HAR Dataset/train/X_train.txt") # measurements
trainy <- read.table("UCI HAR Dataset/train/y_train.txt") # activity labels
trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt") # subject

# Vertically concatenate the measurement data into a new data.frame and add measurement names to identify mean / std
alld <- rbind(test,train)
colnames(alld) <- make.names(unlist(read.table("UCI HAR Dataset/features.txt", row.names = 1)), unique = TRUE) # add column names from the feature key, make.names is to deal with some repeated names, though it does insert a lot of periods

# Select mean / std measurements into a new data frame, dat_ms
coltosel <- grep("mean|std",colnames(alld)) # get indices of columns of interest
dat_ms <- select(alld, coltosel) # get columns of interest into new df 
colnames(dat_ms) <- unlist(read.table("UCI HAR Dataset/features.txt", row.names = 1))[coltosel] # get more readable column names for columns of interest

# Add activity and subject labels to the front of the data frame
dat_ms <- cbind(activity=rbind(testy,trainy),subject=rbind(testsub,trainsub),dat_ms) 
colnames(dat_ms)[1:2] <- c("activity", "subject") # rename those columns

# Relabel activity according to activity labels file
act_key <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("activity", "activity_label")) # read in key, with own column names
dat_ms <- plyr::join(dat_ms,act_key,by='activity') # merge data frames using the activity column
dat_ms <- dat_ms[,c(ncol(dat_ms),3:ncol(dat_ms)-1)] # reorder columns, so the last column (activity) is in front, then rest of columns 

# Save the mean value for each measurement, by activity and subject in a new table
tidy_dat <- dat_ms %>% group_by(activity_label,subject) %>% summarize_each("mean")
write.table(tidy_dat, file="tidy_dat.txt", row.names = FALSE,col.names = TRUE,quote=FALSE, sep="\t")
