# CodeBook for cleaned UCI HAR data

This is a code book pertaining to preliminary processing of the Human Activity Recognition Using Smartphones Data Set from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data are available [in this zip file, downloads upon click.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) This dataset contains motion information from wearables collected while subjects perform a standardized set of activities.

The main script in this repository, `run_analysis.R`:

1. Downloads and unzips the data.
2. Merges the measurements from the training and test datasets (which were originally randomly partitioned).
3. Selects only the mean and standard deviation measurements (for each axis, also includes meanFrequency measurements).
4. Adds corresponding subject and activity labels to each entry. All of these measurements are stored in a data frame called `dat_ms`.
5. Creates a new data frame, `tidy_dat` where only the mean of these measurements, after grouping by subject and activity, is recorded.
6. Writes this data frame to a tab-delimited text file called `tidy_dat.txt`. `tidy_dat.txt` can be read into R as follows: `tidy_dat <- read.table("tidy_dat.txt", header=TRUE, sep="\t", row.names=TRUE)`.

The variables of `dat_ms` (10299 measurements for 81 features), and of the data in `tidy_dat.txt` (180 mean measurements for 81 features) are described as follows (some descriptions come from the original code book, stored in `UCI HAR Dataset/features_info.txt`):
- activity_label: one of six discrete activities performed by the subject as measurements were taken. Categorical, values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- subject: unique numerical ID for each subject. Discrete integer, values: 1-30
All of the remaining variables assume continuous numerical values from -1 to 1 (scaled).
- Accelerometer data (variable name contains `Acc`) in XYZ dimensions: filtered accelerometer measurements in the XYZ dimensions. Collected at a rate of 60 Hz, filtered using median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz. Separation of `tBodyAcc-XYZ` and `tGravityAcc-XYZ` via a low pass Butterworth filter with a corner frequency of 0.3 Hz.
 - `tBodyAcc-mean()-[X|Y|Z]`: mean body acceleration in X|Y|Z dimension during activity.
 - `tBodyAcc-std()-[X|Y|Z]`: standard deviation of body acceleration in X|Y|Z dimension during activity.
 - `tGravityAcc-mean()-[X|Y|Z]`: mean gravity component of acceleration in X|Y|Z dimension during activity.
 - `tGravityAcc-std()-[X|Y|Z]`: standard deviation of gravity component of acceleration in X|Y|Z dimension during activity.
 - `tBodyAccJerk-mean()-[X|Y|Z]`: mean of jerk signals representing body linear acceleration in  X|Y|Z dimension during activity.
 - `tBodyAccJerk-std()-[X|Y|Z]`: mean of jerk signals representing body linear acceleration in  X|Y|Z dimension during activity.
- Gyroscope data (variable name contains `Gyro`) in XYZ dimensions: As with accelerometer data, collected at a rate of 60 Hz, filtered using median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz.
 - `tBodyGyro-mean()-[X|Y|Z]`: mean gyroscope measurement in X|Y|Z dimension during activity.
 - `tBodyGyro-std()-[X|Y|Z]`: standard deviation of gyroscope measurement in X|Y|Z dimension during activity.
 - `tBodyGyroJerk-mean()-[X|Y|Z]`: mean of jerk signals representing angular velocity in  X|Y|Z dimension during activity.
 - `tBodyGyroJerk-std()-[X|Y|Z]`: mean of jerk signals representing angular velocity in  X|Y|Z dimension during activity.
- Magnitude measurements extracted from XYZ signals, using Euclidean norm: mean and standard deviation for each of `tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`. 
- Fast Fourier Transformed data:
 - mean, standard deviation, and mean frequency (weighted average of the frequency components) in XYZ dimensions of `fBodyAcc` (FFT of `tBodyAcc`), `fBodyAccJerk` (FFT of `tBodyAccJerk`), `fBodyGyro` (FFT of `tBodyGyro`), `fBodyAccMag` (FFT of `tBodyAccMag`), `fBodyAccJerkMag` (FFT of `tBodyAccJerkMag`), `fBodyGyroMag` (FFT of `tBodyGyroMag`), and `fBodyGyroJerkMag` (FFT of `tBodyGyroJerkMag`).
