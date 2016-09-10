# CodeBook for cleaned UCI HAR data

This is a code book pertaining to preliminary processing of the Human Activity Recognition Using Smartphones Data Set from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data are available [in this zip file, downloads upon click.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The main script in this repository, `analysis.R`:

1. Downloads and unzips the data.
2. Merges the measurements from the training and test datasets (which were originally randomly partitioned).
3. Selects only the mean and standard deviation measurements (for each axis, also includes meanFrequency measurements).
4. Adds corresponding subject and activity labels to each entry.
5. Creates a new data frame, `dat_ms` where only the mean of these measurements, after grouping by subject and activity, is recorded.
6. Writes this data frame to a tab-delimited text file called `tidy_dat.txt`. `tidy_dat.txt` can be read into R as follows: `tidy_dat <- read.table("tidy_dat.txt", header=TRUE, sep="\t", row.names=TRUE)`.

The variables of `dat_ms`, and of the data in `tidy_dat.txt` are described as follows:


