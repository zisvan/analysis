=========================================
README
=========================================

Run the code run_analysis.R by sourcing it in R studio:

source("run_analysis.R")

The code should live in a directory parallel to the data directory.

These are the steps that run_analysis.R performs to create a tidy dataset of the means of each of the mean() and std() variables in the raw data.  See the codebook for descriptions of variables. 

1. Read in "subject", "y", and "X" text files for both test and training datasets.  This leaves you with six data frames. 

2. Bind columns together to combine the subject, y (activity) and X(variables) data frames into one data frame.  This leaves you with two data frames, one for training and one for test.

3. rbind the two data frames to create the complete merged dataset. This is called data.total in the code. 

4. The data doesn't have column names so far.  In order to give it column names, read in the text file features.txt, and make a vector of column names, then apply these column names to the data.total data frame.

5. We only want to keep variables that are means or standard deviations, these have either "mean()" or "std()" in their column name.  grep column names with these strings, and subset the total data to select only these columns. The resulting subset is called data.sub().

6. Each of the six activities is given a number; replace these with the names of the activities given in activity_label.txt.  The code performs this by looping over the activity labels and replacing each number with the corresponding name.  

7. Use dplyr to group by subject and activity, and evaluate the means of every other column. Return the summary object as a data.frame called df.

8. Write df to a text file named "tidy_data.txt."

9. To test the output, read into a data frame by

x <- read.table("tidy_data.txt", header = TRUE)  
View(x)





