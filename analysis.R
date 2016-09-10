download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip")
list.files()
list.dirs()
list.files("UCI HAR Dataset")
list.files("UCI HAR Dataset/test")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
testy <- read.table("UCI HAR Dataset/test/y_test.txt")
testsub <- read.table("UCI HAR Dataset/test/subject_test.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt")
alld <- rbind(test,train)
colnames(alld) <- make.names(unlist(read.table("UCI HAR Dataset/features.txt", row.names = 1)), unique = TRUE)

coltosel <- grep("mean|std",colnames(alld))
dat_ms <- select(alld, coltosel )
colnames(dat_ms) <- unlist(read.table("UCI HAR Dataset/features.txt", row.names = 1))[coltosel]
dat_ms <- cbind(activity=rbind(testy,trainy),subject=rbind(testsub,trainsub),dat_ms)
colnames(dat_ms)[1:2] <- c("activity", "subject")

act_key <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("activity", "activity_label"))

dat_ms <- plyr::join(dat_ms,act_key,by='activity')
dat_ms <- dat_ms[,c(ncol(dat_ms),3:ncol(dat_ms)-1)]

tidy_dat <- dat_ms %>% group_by(activity_label,subject) %>% summarize_each("mean")

write.table(tidy_dat, file="tidy_dat.txt", row.names = TRUE,col.names = TRUE,quote=FALSE, sep="\t")
