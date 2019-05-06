# Reading all the necessary files and packages
features <- read.table("features.txt")

Xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
subjecttrain <- read.table("subject_train.txt")

Xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
subjecttest <- read.table("subject_test.txt")

library(plyr)
library(dplyr)
library(data.table)
library(stringr)

# Merging all of the training data and all of the test data:
# To form a data frame: For every observation, we need to identify the subject, the type of activity that is being 
# performed (expressed by integer numbers 1:6 that represent six different activities) as well as the values that
# were measured and calculated according to the variables
train <- cbind(subjecttrain, ytrain, Xtrain)
test <- cbind(subjecttest, ytest, Xtest)

# 1. Merging the training and the test sets into one data set:
alldata <- rbind(train, test)

# 2. Extracting measurements only on the mean and standard deviation for each measurement:
#    Since it says "for each measurement", I only chose the variables that contained mean() or std(), 
#    because we want to apply only these two functions on the signals (measurements).
#    I did not include meanFreq(), since this is not the mean, but the mean frequency and it is a weighted average.
colindex <- grep("[m][e][a][n][(][)]|[s][t][d][(][)]", features$V2)
colindex2 <- colindex + 2L
alldata <- alldata[,c(1,2,colindex2)]

# 3. Changing the activity factor numbers to descriptive names: 
#    Instead of numbers, now you can see the names of the activities in the data frame right away.
#    I am using the revalue function, so the numbers simply get replaced with the names, while the order of 
#    the data remains the same
alldata$V1.1 <- as.factor(alldata$V1.1)
alldata$V1.1 <- revalue(alldata$V1.1, c("1"="walking", "2"="walking upstairs", 
                                                "3"="walking downstairs", "4"="sitting", "5"="standing", "6"="laying"))

# 4. Label the data with descriptive variable names:
#    The variables 3:68 are very specific measurements and thus need exactly the names presented in the features file
#    Again, we need to choose only the variables that are values of the mean() or std() on the signal measurements.
#    To create names according to the guide lines, we then need to omit the symbols '-' and '()':
features$V2 <- as.character(features$V2)
names(alldata) <- c("subject", "activity", features$V2[colindex])
names(alldata) <- gsub("-", "", names(alldata))
names(alldata) <- sub("\\(\\)","", names(alldata))
names(alldata) <- gsub("mean", "Mean", names(alldata))
names(alldata) <- gsub("std", "Std", names(alldata))

# 5. Create a second data set that contains the average of each variable for 
#    each activity and each subject; In my version, the activities represent groups while the subjects are
#    subgroups of these activities, but you can also do it the other way around. 
#    If you want to compare the activity measurements within one individual, you should make subject the major
#    group and activity the subgroup. Instead, if you want to look at one activity and compare the individuals
#    within, then you should group it like I did here, by making the activity the major group and subject the subgroup.
byActSub <- group_by(alldata, activity, subject)
averages <- summarise_at(byActSub, names(byActSub[3:68]), mean)

# I left the data frame in the wide format, since I interpret every measurement as an own variable.
# In this format, every combination of subject and activity only exists one time and I can see the averaged
# values of all variables for each combination. This makes it possible to execute further investigations,
# depending on what you want to focus on. Maybe you want to examine either the mean() or the std() variables 
# or maybe you are interested in one specific signal, e.g. tBodyAcc. If you know what you are interested in, 
# you can arrange the data frame accordingly.


# Writing and reading a text file that contains the data set 'averages':
write.table(averages, "averages.txt", row.names=FALSE)
averagesread <- read.table("averages.txt", header=TRUE)

# Saving all of the new variable names from the new data frame 'alldata' for the CodeBook:
variablenames <- data.frame(variablename = names(alldata))


