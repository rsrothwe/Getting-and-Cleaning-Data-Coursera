#Code Book
In this document, we describe the variables, data, and transformations performed using run_analysis.R

##Data
This data was collected form the accelerometers of Samsung Galazy S smartphones. There are 30 volunteers in the study, aged 19-48 years old. Each subject performed siz activities while wearing the smart phone. Data was then collected from the embedded accelerometer and gyroscope. For more details on the data collection process, please see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data format
The original dataset included the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Variables
The final data set is made up of:
- SubjectID: Subject's ID Number
- ActivityLabel: Which of the six activities is being performed
- The remaining columns gives the mean of each of the measurements (given in the column name) by subject and activity

##Data Transformation
In this analysis we:  
1. Load the training and the test sets.  
2. Uses the features and activity labels datasets to create understandable row and column labels.  
3. Extracts only the measurements on the mean and standard deviation for each measurement.  
4. Combines the training and test sets into one large data set.  
5. Cleans the column names by using descriptive variable names in the data set  
6. Finally, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
7. Writes this data set to file.  
