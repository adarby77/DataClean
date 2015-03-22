#### CODEBOOK

This file is the code book associated with the dataset produced by the run_Analysyis() script.

For full details of the UCI dataset see the "features_info.txt" file supplied with the dataset and the documentation at the web location 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#### PROCESSING DETAILS

The run_Analysis script first combines the two subsets of data (test and training) in UCI dataset.

The script selects the mean and standard deviation fields associated with each of the triaxial accelerometer and gyroscope measurements in the "X_*.txt"" files in the UCI dataset.  These fields are identified in the third column of table 1 below - as read from the file UCI dataset file "features.txt".  

The associated output field name is in the second column of the table 1.  The output names were modified from the originals to remove R special/reserved characters to help simplify the coding of any scripts using the output dataset.

The script then takes the average of each field in measurements partitioned by Subject and Activity using the R mean() function (with na.rm = TRUE).  The plyr package function ddplyr() is used to select the subsets of measurements to be averaged over.  The number of measurements used to generate the data for each Subject/Activity pair is contained in the "Counts" data field (Column 3).  

#### OUTPUT DATA FORMAT

There are 51 separate columns/fields in the output file.  

Column 1:  Subject ID - Integer - as retrieved from the "subject_*.txt" files in the  "test"/"train" UCI dataset directories

Column 2:  Activity - Factor - maps the value for each measurement in the "y_*.txt" files to an Activity as identified by the "activity_label.txt" UCI dataset file.  This takes the following values {LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS} 

Column 3: Counts - Integer - This is the number of measurements of the for the Activity as identified in column 2 for the Subject identified in column 1 

Columns 4-51:  

#####TABLE 1

| COLUMN  |   run_Analysis() OUT FIELD  |  UCI INPUT FIELD |
|========  | ======================== | ===================== |
|3     |     tBodyAcc_mean_X |          tBodyAcc-mean()-X    |    
|4     |     tBodyAcc_mean_Y  |         tBodyAcc-mean()-Y      |  
|5     |      tBodyAcc_mean_Z |          tBodyAcc-mean()-Z    |    
6          tBodyAcc_std_X            tBodyAcc-std()-X         
7          tBodyAcc_std_Y            tBodyAcc-std()-Y         
8          tBodyAcc_std_Z            tBodyAcc-std()-Z         
9          tGravityAcc_mean_X        tGravityAcc-mean()-X     
10         tGravityAcc_mean_Y        tGravityAcc-mean()-Y     
11         tGravityAcc_mean_Z        tGravityAcc-mean()-Z     
12         tGravityAcc_std_X         tGravityAcc-std()-X      
13         tGravityAcc_std_Y         tGravityAcc-std()-Y      
14         tGravityAcc_std_Z         tGravityAcc-std()-Z      
15         tBodyAccJerk_mean_X       tBodyAccJerk-mean()-X    
16         tBodyAccJerk_mean_Y       tBodyAccJerk-mean()-Y    
17         tBodyAccJerk_mean_Z       tBodyAccJerk-mean()-Z    
18         tBodyAccJerk_std_X        tBodyAccJerk-std()-X     
19         tBodyAccJerk_std_Y        tBodyAccJerk-std()-Y     
20         tBodyAccJerk_std_Z        tBodyAccJerk-std()-Z     
21         tBodyGyro_mean_X          tBodyGyro-mean()-X       
22         tBodyGyro_mean_Y          tBodyGyro-mean()-Y       
23         tBodyGyro_mean_Z          tBodyGyro-mean()-Z       
24         tBodyGyro_std_X           tBodyGyro-std()-X        
25         tBodyGyro_std_Y           tBodyGyro-std()-Y        
26         tBodyGyro_std_Z           tBodyGyro-std()-Z        
27         tBodyGyroJerk_mean_X      tBodyGyroJerk-mean()-X   
28         tBodyGyroJerk_mean_Y      tBodyGyroJerk-mean()-Y   
29         tBodyGyroJerk_mean_Z      tBodyGyroJerk-mean()-Z   
30         tBodyGyroJerk_std_X       tBodyGyroJerk-std()-X    
31         tBodyGyroJerk_std_Y       tBodyGyroJerk-std()-Y    
32         tBodyGyroJerk_std_Z       tBodyGyroJerk-std()-Z    
33         fBodyAcc_mean_X           fBodyAcc-mean()-X        
34         fBodyAcc_mean_Y           fBodyAcc-mean()-Y        
35         fBodyAcc_mean_Z           fBodyAcc-mean()-Z        
36         fBodyAcc_std_X            fBodyAcc-std()-X         
37         fBodyAcc_std_Y            fBodyAcc-std()-Y         
38         fBodyAcc_std_Z            fBodyAcc-std()-Z         
39         fBodyAccJerk_mean_X       fBodyAccJerk-mean()-X    
40         fBodyAccJerk_mean_Y       fBodyAccJerk-mean()-Y    
41         fBodyAccJerk_mean_Z       fBodyAccJerk-mean()-Z    
42         fBodyAccJerk_std_X        fBodyAccJerk-std()-X     
43         fBodyAccJerk_std_Y        fBodyAccJerk-std()-Y     
44         fBodyAccJerk_std_Z        fBodyAccJerk-std()-Z     
45         fBodyGyro_mean_X          fBodyGyro-mean()-X       
46         fBodyGyro_mean_Y          fBodyGyro-mean()-Y       
47         fBodyGyro_mean_Z          fBodyGyro-mean()-Z       
48         fBodyGyro_std_X           fBodyGyro-std()-X        
49         fBodyGyro_std_Y           fBodyGyro-std()-Y        
50         fBodyGyro_std_Z           fBodyGyro-std()-Z        

####UNITS

Accelerometer measurements - indicated the "Acc" in the field name - are in units of metres/sec^2.  The gyroscope measurements  - indicated by "Gyro" in the field name - are in units of radians/sec.



