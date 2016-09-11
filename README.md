# getdata

This repository contains files for analysis of the UCI HAR (Human Activity Recognition Using Smartphones) dataset. The dataset contains motion information from wearables collected while subjects perform a standardized set of activities.

- `CodeBook.md` contains information about the dataset, including the descriptions of variables.
- `run_analysis.R` is a script that performs preliminary tidying of the data. It contains comments that explain each group of activities in the tidying process.
 - First, it combines measurements from training and test datasets (the labels are not relevant to us,  as the data were originally randomly partitioned.
 - Next, it labels the features and extracts columns containing mean and standard deviation measurements.
 - Third, it add activity and subject labels to the measurements.
 - Fourth, it relabels and reorders variables.
 - Fifth, it calculates mean values for the extracted measurements, grouped by activity and subject, and saves them to `tidy_dat.txt`.

