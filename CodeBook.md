#### CODEBOOK

This file is the code book associated with the dataset produced by the run_Analysyis() script.

For full details of the UCI dataset see the "features_info.txt" file supplied with the dataset and the documentation at the web location 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#### PROCESSING DETAILS

The run_Analysis script first combines the two subsets of data (test and training) in UCI dataset.

The script selects the mean and standard deviation fields associated with each of the triaxial accelerometer and gyroscope measurements in the "X_*.txt"" files in the UCI dataset.  These fields are identified in the third field of table 1 below - as read from the file UCI dataset file "features.txt".  

The associated output field name is in the second field of the table 1.  The output names were modified from the originals to remove R special/reserved characters to help simplify the coding of any scripts using the output dataset.

The script then takes the average of each field in measurements partitioned by Subject and Activity using the R mean() function (with na.rm = TRUE).  The plyr package function ddplyr() is used to select the subsets of measurements to be averaged over.  The number of measurements used to generate the data for each Subject/Activity pair is contained in the "Counts" data field (Column 3).  

#### OUTPUT DATA FORMAT

There are 51 separate columns/fields in the output file.  

Column 1:  Subject ID - Integer - as retrieved from the "subject_*.txt" files in the  "test"/"train" UCI dataset directories

Column 2:  Activity - Factor - maps the value for each measurement in the "y_*.txt" files to an Activity as identified by the "activity_label.txt" UCI dataset file.  This takes the following values {LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS} 

Column 3: Counts - Integer - This is the number of measurements of the for the Activity as identified in column 2 for the Subject identified in column 1 

Columns 4-51:  

#####TABLE 1

Column:  4 Field:  tBodyAcc_mean_X UCI field:  tBodyAcc-mean()-X 

Column:  5 Field:  tBodyAcc_mean_Y UCI field:  tBodyAcc-mean()-Y 

Column:  6 Field:  tBodyAcc_mean_Z UCI field:  tBodyAcc-mean()-Z 

Column:  7 Field:  tBodyAcc_std_X UCI field:  tBodyAcc-std()-X 

Column:  8 Field:  tBodyAcc_std_Y UCI field:  tBodyAcc-std()-Y 

Column:  9 Field:  tBodyAcc_std_Z UCI field:  tBodyAcc-std()-Z 

Column:  10 Field:  tGravityAcc_mean_X UCI field:  tGravityAcc-mean()-X 

Column:  11 Field:  tGravityAcc_mean_Y UCI field:  tGravityAcc-mean()-Y 

Column:  12 Field:  tGravityAcc_mean_Z UCI field:  tGravityAcc-mean()-Z 

Column:  13 Field:  tGravityAcc_std_X UCI field:  tGravityAcc-std()-X 

Column:  14 Field:  tGravityAcc_std_Y UCI field:  tGravityAcc-std()-Y 

Column:  15 Field:  tGravityAcc_std_Z UCI field:  tGravityAcc-std()-Z 

Column:  16 Field:  tBodyAccJerk_mean_X UCI field:  tBodyAccJerk-mean()-X 

Column:  17 Field:  tBodyAccJerk_mean_Y UCI field:  tBodyAccJerk-mean()-Y 

Column:  18 Field:  tBodyAccJerk_mean_Z UCI field:  tBodyAccJerk-mean()-Z 

Column:  19 Field:  tBodyAccJerk_std_X UCI field:  tBodyAccJerk-std()-X 

Column:  20 Field:  tBodyAccJerk_std_Y UCI field:  tBodyAccJerk-std()-Y 

Column:  21 Field:  tBodyAccJerk_std_Z UCI field:  tBodyAccJerk-std()-Z 

Column:  22 Field:  tBodyGyro_mean_X UCI field:  tBodyGyro-mean()-X 

Column:  23 Field:  tBodyGyro_mean_Y UCI field:  tBodyGyro-mean()-Y 

Column:  24 Field:  tBodyGyro_mean_Z UCI field:  tBodyGyro-mean()-Z 

Column:  25 Field:  tBodyGyro_std_X UCI field:  tBodyGyro-std()-X 

Column:  26 Field:  tBodyGyro_std_Y UCI field:  tBodyGyro-std()-Y 

Column:  27 Field:  tBodyGyro_std_Z UCI field:  tBodyGyro-std()-Z 

Column:  28 Field:  tBodyGyroJerk_mean_X UCI field:  tBodyGyroJerk-mean()-X 

Column:  29 Field:  tBodyGyroJerk_mean_Y UCI field:  tBodyGyroJerk-mean()-Y 

Column:  30 Field:  tBodyGyroJerk_mean_Z UCI field:  tBodyGyroJerk-mean()-Z 

Column:  31 Field:  tBodyGyroJerk_std_X UCI field:  tBodyGyroJerk-std()-X 

Column:  32 Field:  tBodyGyroJerk_std_Y UCI field:  tBodyGyroJerk-std()-Y 

Column:  33 Field:  tBodyGyroJerk_std_Z UCI field:  tBodyGyroJerk-std()-Z 

Column:  34 Field:  fBodyAcc_mean_X UCI field:  fBodyAcc-mean()-X 

Column:  35 Field:  fBodyAcc_mean_Y UCI field:  fBodyAcc-mean()-Y 

Column:  36 Field:  fBodyAcc_mean_Z UCI field:  fBodyAcc-mean()-Z 

Column:  37 Field:  fBodyAcc_std_X UCI field:  fBodyAcc-std()-X 

Column:  38 Field:  fBodyAcc_std_Y UCI field:  fBodyAcc-std()-Y 

Column:  39 Field:  fBodyAcc_std_Z UCI field:  fBodyAcc-std()-Z 

Column:  40 Field:  fBodyAccJerk_mean_X UCI field:  fBodyAccJerk-mean()-X 

Column:  41 Field:  fBodyAccJerk_mean_Y UCI field:  fBodyAccJerk-mean()-Y 

Column:  42 Field:  fBodyAccJerk_mean_Z UCI field:  fBodyAccJerk-mean()-Z 

Column:  43 Field:  fBodyAccJerk_std_X UCI field:  fBodyAccJerk-std()-X 

Column:  44 Field:  fBodyAccJerk_std_Y UCI field:  fBodyAccJerk-std()-Y 

Column:  45 Field:  fBodyAccJerk_std_Z UCI field:  fBodyAccJerk-std()-Z 

Column:  46 Field:  fBodyGyro_mean_X UCI field:  fBodyGyro-mean()-X 

Column:  47 Field:  fBodyGyro_mean_Y UCI field:  fBodyGyro-mean()-Y 

Column:  48 Field:  fBodyGyro_mean_Z UCI field:  fBodyGyro-mean()-Z 

Column:  49 Field:  fBodyGyro_std_X UCI field:  fBodyGyro-std()-X 

Column:  50 Field:  fBodyGyro_std_Y UCI field:  fBodyGyro-std()-Y 

Column:  51 Field:  fBodyGyro_std_Z UCI field:  fBodyGyro-std()-Z 


####UNITS

Accelerometer measurements - indicated the "Acc" in the field name - are in units of metres/sec^2.  The gyroscope measurements  - indicated by "Gyro" in the field name - are in units of radians/sec.



