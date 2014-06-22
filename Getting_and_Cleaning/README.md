# Getting and Cleaning Data Project

## Prerequisites
* Install plyr package
* Download the file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Extract the folder into your work directory (.\UCI HAR Dataset)

## To run the code
* Execute the 'run_analysis.R' file in R Studio
* The script will produce a file called Tidy_Dataset.txt in your work directory.

## Steps of the R script:

1. Loading all the datasets into frames. Test and Train sets are merged together and columns are renamed by the features.txt list.
2. Extracting the needed columns only from the merged dataset
3. Join the Activities to the merged dataset
4. Renaming the activity and subject columns 
5. Create a tidy dataset 


