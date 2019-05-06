## Codebook of the UCI-HAR Dataset


The following information about this data set is a citation from the 'features_info file' within the ZIP-package of the UCI-HAR Dataset. The variables listed in the 'features' file have been reduced and are listed at the bottom.

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```{r}
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation"

Note: Features are normalized and bounded within [-1,1].


The data set also contains one variable called 'subject' that is a vector of class 'integer', containing the subject IDs to identify the individuals that are executing the activities. This variable has been extracted from the files 'subjecttrain' and 'subjecttest'.

Moreover, there is the variable 'activity', which is a factor variable indicating the activity that is being performed by the individual. The information for this variable was taken from the files 'ytrain' and 'ytest', but has been modified by replacing the integer numbers that represented the activites with descriptive names.

The following table 'variablenames' has been created for this CodeBook to show the names of the 68 variables that are included in the data frame 'alldata' as well as in the data frame 'averages'. The variable names have been adjusted to suit the guidelines.

```{r}               
1                   subject
2                  activity
3             tBodyAccMeanX
4             tBodyAccMeanY
5             tBodyAccMeanZ
6              tBodyAccStdX
7              tBodyAccStdY
8              tBodyAccStdZ
9          tGravityAccMeanX
10         tGravityAccMeanY
11         tGravityAccMeanZ
12          tGravityAccStdX
13          tGravityAccStdY
14          tGravityAccStdZ
15        tBodyAccJerkMeanX
16        tBodyAccJerkMeanY
17        tBodyAccJerkMeanZ
18         tBodyAccJerkStdX
19         tBodyAccJerkStdY
20         tBodyAccJerkStdZ
21           tBodyGyroMeanX
22           tBodyGyroMeanY
23           tBodyGyroMeanZ
24            tBodyGyroStdX
25            tBodyGyroStdY
26            tBodyGyroStdZ
27       tBodyGyroJerkMeanX
28       tBodyGyroJerkMeanY
29       tBodyGyroJerkMeanZ
30        tBodyGyroJerkStdX
31        tBodyGyroJerkStdY
32        tBodyGyroJerkStdZ
33          tBodyAccMagMean
34           tBodyAccMagStd
35       tGravityAccMagMean
36        tGravityAccMagStd
37      tBodyAccJerkMagMean
38       tBodyAccJerkMagStd
39         tBodyGyroMagMean
40          tBodyGyroMagStd
41     tBodyGyroJerkMagMean
42      tBodyGyroJerkMagStd
43            fBodyAccMeanX
44            fBodyAccMeanY
45            fBodyAccMeanZ
46             fBodyAccStdX
47             fBodyAccStdY
48             fBodyAccStdZ
49        fBodyAccJerkMeanX
50        fBodyAccJerkMeanY
51        fBodyAccJerkMeanZ
52         fBodyAccJerkStdX
53         fBodyAccJerkStdY
54         fBodyAccJerkStdZ
55           fBodyGyroMeanX
56           fBodyGyroMeanY
57           fBodyGyroMeanZ
58            fBodyGyroStdX
59            fBodyGyroStdY
60            fBodyGyroStdZ
61          fBodyAccMagMean
62           fBodyAccMagStd
63  fBodyBodyAccJerkMagMean
64   fBodyBodyAccJerkMagStd
65     fBodyBodyGyroMagMean
66      fBodyBodyGyroMagStd
67 fBodyBodyGyroJerkMagMean
68  fBodyBodyGyroJerkMagStd
```

The data frame 'alldata' has 10299 rows (observations) and is a join of the 'train' and the 'test' set. (The train and test set both consist of the columns 'subject', 'activity' and all of the 561 initial signal variables. But we created a subset of this data frame, by choosing only 66 signal variables.) Every row is an observation of a certain 'subject' (individual) performing a specific 'activity' and its measurements of the 66 different variables. The measurements have been extracted from the files 'Xtrain' and 'Xtest'. Every activity is being performed by every subject.

The following list shows the six different activities:

walking
walking upstairs
walking downstairs
sitting
standing
laying


The data set 'averages' is a data frame with the dimensions '180 obs. of 68 variables' that gives the mean values of the 66 variables for every combination of one subject and one activity. Since every subject performs every activity, there are 30 x 6 = 180 observations.  
This data set in the wide format is tidy, because every variable is represented by one column and I have one row for each combination of subject and activity. This is nice, because you don't find combinations that repeat itself in different rows. This data frame is a perfect foundation for further analysis, depending on your focus. If you want to examine just the mean() or the std() variables, you need to arrange the data differently than if you are interested in a specific signal, e.g. tBodyAcc. If you know what you are interested in, you can arrange the data frame accordingly now.
The data set 'averages' is being saved as a text file 'averages.txt' by using the write.table function.



