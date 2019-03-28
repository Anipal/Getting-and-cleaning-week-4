library(dplyr)
#reading all the required data from the file 
trainX <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
mini_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
mini_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
#creating common data frames com_X ,com_Y and com_mini that store all the test and train values for X ,Y and subset data respectively
com_X <- rbind(trainX, testX)
com_Y <- rbind(trainY, testY)
com_mini <- rbind(mini_train, mini_test)
#reading features and labels
var <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
mean_std_var <- var[grep("mean\\(\\)|std\\(\\)",var[,2]),]
com_X <- com_X[,mean_std_var[,1]]
#adding extra column to com_Y that stores the function performed such as sitting, walking etc
com_Y$work <- factor(com_Y$V1, labels = as.character(labels[,2]))
work <- com_Y[,-1]
colnames(com_X) <- var[mean_std_var[,1],2]
colnames(com_mini) <- "candidate"
final <- cbind(com_X, work, com_mini)
final_mean <- final %>% group_by(work, candidate) %>% summarize_all(funs(mean))
write.table(final_mean, file = "./Getting-and-cleaning-week-4/tidydata.txt", row.names = FALSE, col.names = TRUE)
