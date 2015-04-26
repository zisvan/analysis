=================================================
Code book 
=================================================

Raw data can be downloaded here:

[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


Information about raw data can be found in its README.txt as well as the url below:

[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


Variables in Raw Data
--------------------------------------------------
Information about variables in raw data is included in the data directory linked above, in the features_info.txt file.  The names of each of the 561 variables can be found in features.txt.

Variables in the Tidy Data
--------------------------------------------------
Of the 561 variables for each subject, we summarized down to 79 by selecting only those variables that represent the mean and standard deviation of accelerator and gyroscope 3-axial signals.  This yielded a data set of 81 columns, including 79 variables, the identifier of the test subject (a number from 1-30) and the name of the activity: 

walking,  
walking_upstairs,  
walking_downstairs,   
sitting,  
standing,  
laying.  

We further summarized by calculating the mean of each of the 79 variables for the total of 30 subjects and 6 activities.  This yielded the final dataset with 180 observables and 81 variables. 

The names of the 79 variables have not been changed from the original names into more readable names.  This was a deliberate choice to preserve agreement with the features documents from the original data source. 

The final tidy dataset is written to tidy_data.txt


