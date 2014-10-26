##This codebook describes both the raw and the processed datasets

##Raw dataset information
==========================
1) 	This is the Human Activity Recognition Using Smartphones Data Set. See "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity are captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Feature selection
2)	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean,tBodyGyroJerkMean

3) The raw dataset comprises the following:
* features_info.txt : As per paragraph 2 in this codebook.
* features.txt: List of all 561 features with time and frequency domain variables
* activity_labels.txt: Links the class labels (number 1 to 6) with their activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 					LAYING) respectively.
* train/X_train.txt: Training set (7352 records x 561 feature variables)
* train/y_train.txt: Training labels (7352 records x 1 activity class label)
* test/X_test.txt : Test set.(2947 records x 561 feature variables)
* test/y_test.txt : Test labels.(2947 records x 1 activity class label)
* train/subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* test/subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* train/Inertial Signals/total_acc_x_train.txt : The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row 		shows a 128 element vector. The same description applies for the 'total_acc_y_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
	
* test/Inertial Signals/total_acc_x_train.txt : The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row 		shows a 128 element vector. The same description applies for the 'total_acc_y_test.txt' and 'total_acc_z_test.txt' files for the Y and Z axis. 

* train/Inertial Signals/body_acc_x_train.txt : The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* test/Inertial Signals/body_acc_x_train.txt : The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* train/Inertial Signals/body_gyro_x_train.txt : The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
* test/Inertial Signals/body_gyro_x_train.txt  : The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

##Processed dataset information 
===============================

4)	This pertains to the tidy dataset "independentdataset.txt" (a 180 x 81 dataset).To get this dataset, the raw training and testing datasets are merged into a single dataset and then the variables depicting measurements on the mean & standard deviation for each measurement were sieved out. Refer to README.md para. 9 for an explanation of the choice of the subset and how the sieving is done. This subset table has 81 columns, the first two columns being the subject and activity columns. The remaining 79 columns are the sieved out feature variables containing mean and standard deviation for each measurement. As the project had asked for appropriate and descriptive names for the feature variables, the original feature variable names in the features.txt file in the raw dataset had been processed and transformed. Refer to README.md para.11 for a description of how the names had been processed.The 81 column names are as follows:

###ID variables (columns 1,2)
* "subject"- Class: integer, Value range : 1 - 30
* "activity" - Class : factor, 6 factor levels (walking,walkingupstairs,walkingdownstairs,sitting,standing,laying). Note: the activity names are in camelcase with underscore removed so as to fit the descriptive and proper naming convention. See README.md para 10 for an explanation of how the transformation is done.

###feature variables(columns 3-81)
Class: numeric 
Values: each row gives the average values of each 79 feature variables for each activity and each subject. Values are normalised to within [-1,1]. 
The feature variables are as follows:
* "timebodyaccelerationmeanx/"timebodyaccelerationmeany"/"timebodyaccelerationmeanz" 
	- correspond to tBodyAcc-mean()-XYZ (original feature variable names)

* "timebodyaccelerationstandarddeviationx"/"timebodyaccelerationstandarddeviationy"/"timebodyaccelerationstandarddeviationz"
  	- correspond to tBodyAcc-std()-XYZ(original feature variable names)

* "timegravityaccelerationmeanx"/"timegravityaccelerationmeany"/"timegravityaccelerationmeanz" 
	- correspond to tGravityAcc-mean()-XYZ(original feature variable names)

* "timegravityaccelerationstandarddeviationx"/"timegravityaccelerationstandarddeviationy"/"timegravityaccelerationstandarddeviationz"
	- correspond to tGravityAcc-std()-XYZ(original feature variable names)

* "timebodyaccelerationjerkmeanx"/"timebodyaccelerationjerkmeany"/"timebodyaccelerationjerkmeanz"
	-correspond to tBodyAccJerk-mean()-XYZ(original feature variable names)
	
* "timebodyaccelerationjerkstandarddeviationx"/"timebodyaccelerationjerkstandarddeviationy"/"timebodyaccelerationjerkstandarddeviationz"
	- correspond to tBodyAccJerk-std()-XYZ(original feature variable names)

* "timebodygyroscopemeanx"/"timebodygyroscopemeany"/"timebodygyroscopemeanz"
	- correspond to tBodyGyro-mean()-XYZ(original feature variable names)

* "timebodygyroscopestandarddeviationx"/"timebodygyroscopestandarddeviationy"/"timebodygyroscopestandarddeviationz"
	-correspond to tBodyGyro-std()-XYZ(original feature variable names)

* "timebodygyroscopejerkmeanx"/"timebodygyroscopejerkmeany"/"timebodygyroscopejerkmeanz"
	-correspond to tBodyGyroJerk-mean()-XYZ(original feature variable names)

* "timebodygyroscopejerkstandarddeviationx"/"timebodygyroscopejerkstandarddeviationy"/"timebodygyroscopejerkstandarddeviationz"
	-correspond to tBodyGyroJerk-std()-XYZ(original feature variable names)

* "timebodyaccelerationmagnitudemean"
	-correspond to tBodyAccMag-mean()(original feature variable names)

* "timebodyaccelerationmagnitudestandarddeviation"
	-correspond to tBodyAccMag-std()(original feature variable names)

* "timegravityaccelerationmagnitudemean"
	-correspond to tGravityAccMag-mean()(original feature variable names)

* "timegravityaccelerationmagnitudestandarddeviation"
	-correspond to tGravityAccMag-std()(original feature variable names)

* "timebodyaccelerationjerkmagnitudemean"
	-correspond to tBodyAccJerkMag-mean()(original feature variable names)

* "timebodyaccelerationjerkmagnitudestandarddeviation"
	-correspond to tBodyAccJerkMag-std()(original feature variable names)

* "timebodygyroscopemagnitudemean"
	-correspond to tBodyGyroMag-mean()(original feature variable names)

* "timebodygyroscopemagnitudestandarddeviation"
	-correspond to tBodyGyroMag-std()(original feature variable names)

* "timebodygyroscopejerkmagnitudemean"
	-correspond to tBodyGyroJerkMag-mean()(original feature variable names)
 
* "timebodygyroscopejerkmagnitudestandarddeviation"
	-correspond to tBodyGyroJerkMag-std()(original feature variable names)

* "frequencybodyaccelerationmeanx"/"frequencybodyaccelerationmeany"/"frequencybodyaccelerationmeanz"
	-correspond to fBodyAcc-mean()-XYZ(original feature variable names)

* "frequencybodyaccelerationstandarddeviationx"/"frequencybodyaccelerationstandarddeviationy"/"frequencybodyaccelerationstandarddeviationz"
	-correspond to fBodyAcc-std()-XYZ(original feature variable names)

* "frequencybodyaccelerationmeanfrequencyx"/"frequencybodyaccelerationmeanfrequencyy"/"frequencybodyaccelerationmeanfrequencyz"
	-correspond to fBodyAcc-meanFreq()-XYZ(original feature variable names)

* "frequencybodyaccelerationjerkmeanx"/"frequencybodyaccelerationjerkmeany"/"frequencybodyaccelerationjerkmeanz"
	-correspond to fBodyAccJerk-mean()-XYZ(original feature variable names)

* "frequencybodyaccelerationjerkstandarddeviationx"/"frequencybodyaccelerationjerkstandarddeviationy"/"frequencybodyaccelerationjerkstandarddeviationz"
	-correspond to fBodyAccJerk-std()-XYZ(original feature variable names)

* "frequencybodyaccelerationjerkmeanfrequencyx"/"frequencybodyaccelerationjerkmeanfrequencyy"/"frequencybodyaccelerationjerkmeanfrequencyz"
	-correspond to fBodyAccJerk-meanFreq()-XYZ(original feature variable names)

* "frequencybodygyroscopemeanx"/"frequencybodygyroscopemeany"/"frequencybodygyroscopemeanz"
	-correspond to fBodyGyro-mean()-XYZ(original feature variable names)

* "frequencybodygyroscopestandarddeviationx"/"frequencybodygyroscopestandarddeviationy"/"frequencybodygyroscopestandarddeviationz"
	-correspond to fBodyGyro-std()-XYZ(original feature variable names)

* "frequencybodygyroscopemeanfrequencyx"/"frequencybodygyroscopemeanfrequencyy"/"frequencybodygyroscopemeanfrequencyz"
	-correspond to fBodyGyro-meanFreq()-XYZ(original feature variable names)

* "frequencybodyaccelerationmagnitudemean"
	-correspond to fBodyAccMag-mean()(original feature variable names)

* "frequencybodyaccelerationmagnitudestandarddeviation"
	-correspond to fBodyAccMag-std()(original feature variable names)

* "frequencybodyaccelerationmagnitudemeanfrequency"
	-correspond to fBodyAccMag-meanFreq()(original feature variable names)

* "frequencybodyaccelerationjerkmagnitudemean"
	-correspond to fBodyBodyAccJerkMag-mean()(original feature variable names). Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodyaccelerationjerkmagnitudestandarddeviation"
	-correspond to fBodyBodyAccJerkMag-std()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodyaccelerationjerkmagnitudemeanfrequency"
	-correspond to fBodyBodyAccJerkMag-meanFreq()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodygyroscopemagnitudemean"
	-correspond to fBodyBodyGyroMag-mean()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodygyroscopemagnitudestandarddeviation"	
	-correspond to fBodyBodyGyroMag-std()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodygyroscopemagnitudemeanfrequency"
	-correspond to fBodyBodyGyroMag-meanFreq()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodygyroscopejerkmagnitudemean"
	-correspond to fBodyBodyGyroJerkMag-mean()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodygyroscopejerkmagnitudestandarddeviation"
	-correspond to fBodyBodyGyroJerkMag-std()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11

* "frequencybodygyroscopejerkmagnitudemeanfrequency"
	-correspond to fBodyBodyGyroJerkMag-meanFreq()(original feature variable names).Note: the original name has an error and has been cleaned up. Refer to README.md para.11



