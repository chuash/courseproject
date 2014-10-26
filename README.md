1)	As part of the Getting and Cleaning Data Course, we are supposed to submit a project which would demonstrate our ability to collect, work with, and clean a data set. We are required to submit: 1) a tidy data set, 2) a link to a Github repository with our script for performing the analysis, 3) a code book that describes the variables, the data, and any transformations or work that were performed to clean up the data called CodeBook.md and last but not least, a README.md file which explains how all of the scripts work and how they are connected. 

2) 	Together with this README file in the repo, you will find i) the tidy data set - "independentdataset.txt", ii) the R script for performing the analysis - "run_analysis.R"and iii) the codebook - "CodeBook.md" 

3)	In this README file, you will understand the steps taken by the R script from reading in the raw training and test datasets -> merging them to create a single dataset -> extracting only the measurements on the mean and standard deviation for each measurement -> using descriptive activity names to name the activities in the single dataset -> appropriately labeling the single dataset with descriptive variable names and lastly creating a second, independent tidy data set with the average of each variable for each activity and each subject (which is the "independentdataset.txt").

####Raw Data. 

4)	The raw data is obtained from the following url " https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".See the CodeBook.md for background information on the raw datasets. As the instructions in the course project website did not explicitly state that the R script should include the codes to download and unzip the raw data, the raw data was manually downloaded onto the local machine and unzipped.The raw data originally unzipped into a folder with the default folder name "UCI HAR Dataset". For the purpose of this project, this folder was renamed as "projectdata" which resides as a subfolder within the R script source file folder in the local machine. If you are to download the R script , run_analysis.R, it should be run in the same folder as the "projectdata" sub-folder.You need to create the "projectdata" subfolder and download the raw data on your own into that folder. 

####Reading raw data in R (lines 15-22)
5)	 The script uses read.table function to read in the training datasets (X_train.txt, y_train.txt and subject_train.txt) as well as the testing dataset(X_test.txt, y_test.txt and subject_test.txt). Refer to CodeBook.md for description on the contents within each of these text files.

####Basic data exploration (lines 23-28)
6)	Using the dim and head functions, it allows us to understand the number of rows and columns within each dataset as well as to see what their contents are.

####Data preparation (lines 30-31)
7)	Since we need to be able to, at the last stage, generate a separate dataset with the average of each feature variable grouped by each activity and each subject, it makes sense to combine (using cbind functions) the y_train (the activity table) and the subject_train (the subject table) with the main training data set - X_train to form the combined training dataset - trainData. The first two columns of trainData are the subject and the activity respectively. The rest of the columns are the feature variables. Repeat the same for the testing datasets to get a combined testing dataset - testData.Similarly the first two columns of testData are the subject and the activity respectively. The rest of the columns are the feature variables

####Merging training and testing datasets (lines 34-38)
8)	trainData and testData are merged to create a single dataset. As the raw datasets do not come with column names, we need to provide column names for the combined single dataset at this point so that we can later on sieve out feature variables that describe the mean and standard deviation for each measurement. The names for each of the 561 feature variables are obtained from the feature.txt file.

 
####Sieving out variables depicting measurements on the mean & standard deviation for each measurement and creating subset table (lines 43-47)
9)	To determine which of the 561 feature variables depict measurements on the mean and standard deviation for each measurement, we look at the feature_info.txt file. In my opinion, feature variables that depict measurements on the mean and standard deviation for each measurment should refer to the set of variables (mean(): Mean value, std(): Standard deviation and meanFreq(): Weighted average of the frequency components to obtain a mean frequency) that were estimated from the list of accelerometer and gyroscope tri-axial signals. There were also other vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean.However, in my opinion, this doesn't seem to be what the question is asking for. Hence this later set of vectors used on the angle() variable was not included. Using the grepl function, the code proceeds to sieve out the merged dataset column names containing "mean", "std","activity" and "subject". The subset table has 81 columns, the first two columns being the subject and activity columns. The remaining 79 columns are the sieved out feature variables.


#### using descriptive activity names to name the activities in the data set (lines 50-54)
10)	Before renaming, the activity column is a mere list of numbers from 1-6. However, each of these numbers actually correspond to a physical activity such as walking or standing etc. The number-activity mapping can be found in the file activity_labels.txt which is read into R. To be descriptive, the numbers in the activity column are then replaced with the corresponding physical activity description via the factor function and manipulating the labeling of the factor levels.Proper naming conventions state that names should be lowercase where possible and should not have underscores,dots or whitespaces. To be aligned, the names of the physical activity are changed to lowercase from the original uppercase (using tolower function). At the sametime, the underscores in "walking_upstairs" and "walking_downstairs" were also removed using the gsub function.

#### appropriately label the data set with descriptive variable names (lines 58-69)
11)	To be descriptive, in my opinion, the abbreviatons should all be expanded to remove any ambiguities. Hence the following abbreviations are expanded - "t", "f","mag","acc", "gyro, "std", "freq". Proper/good naming conventions also state that names should be lowercase where possible, not be duplicated and should not have underscores,dots or whitespaces. These are all incorporated into the revised column names using the gsub function.In addition, I also spotted some errors(could be typo in nature) in some of the feature variable names, for intance "fBodyBodyGyroMag-mean()". The phrase "Body" is repeated once, which shouldn't be the case. Thus "...bodybody..." is replaced with "...body..." 

##### Creating the 2nd data set with the average of each variable for each activity and each subject(lines 74-77)
12)	The dplyr package is being used.The selectedData dataset is first grouped by subject and activity before applying the mean function individually over the 79 sieved out feature variables to form a 2nd table. This 2nd table is then exported out to a text file "independentdataset.txt" using the write.table function which is delimited by tabs. This txt file is stored in the same folder as the R script source file folder.

13) 	To read "independentdataset.txt" back into R, use these R scripts.
	- data <- read.table("./independentdataset.txt", header = TRUE) #make sure you set the R working directory to the same directory where "run_analysis.R" is.  
 	- View(data)
Quoted from https://class.coursera.org/getdata-008/forum/thread?thread_id=24#comment-436 

