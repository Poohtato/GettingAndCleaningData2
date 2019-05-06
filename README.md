
Human Activity Recognition Using Smartphones Dataset
Coursera Assignment: Arranging the Data Set 'UCI-HAR'
==================================================================
Potato
==================================================================


The files for this project can be obtained from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Reference:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


The following description has been copied from the README.txt that accompanies the UCI-HAR dataset and was modified:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

The data set that is being created in this project (within the 'run_analysis.R' file) is a join of the initial training and test sets and contains 10299 rows (observations). It has been reduced to 68 variables (from originally 563 variables). Fore more information see 'CodeBook.md'.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md':    Gives information about all of the variables that were created to generate and arrange the data                      frames as well as information about the data frames and text file.  
                    Provides a list of all the features included and of the activities performed by the                                  subjects.

- 'run_analysis.R': An R script file containing the code to modify the original data set UCI-HAR:
                    1. Merges the training and the test sets to create one data set 'alldata'
                    2. Extracts only the measurements on the mean and standard deviation for each measurement.
                    3. Uses descriptive activity names to name the activities in the data set
                    4. Appropriately labels the data set with descriptive variable names.
                    5. From the data set in step 4, creates a second, independent tidy data set 'averages' with the                         average of each variable for each activity and each subject.
                    6. Creates a text file containing the data set 'averages' and a variable 'averagesread' to
                       present how to read said text file with the tidy data set into R
                    7. Creates and prints a variable 'variablenames' that contains all of the variable names from the                        new data sets to list them in the 'CodeBook.md'

- 'averages.txt':   The data set that has been created in step 5 of the Assignment in week 4 of the coursera course                      'Getting and Cleaning Data': a tidy data frame containing the averages of the 66 variables for                       each combination of 'subject' and 'activity'. With 'subject' containing 30 different IDs and with                     6 different activies, there are 30 x 6 = 180 observations of 66 variables plus the two columns
                    'subject' and 'activity' with 180 obervations each.


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


For more information about the original dataset UCI-HAR contact: activityrecognition@smartlab.ws


License:
========
Use of the original UCI-HAR dataset in publications must be acknowledged by referencing the following publication [1] The original dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



Potato. May 2019.
