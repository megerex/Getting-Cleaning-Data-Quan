# Getting-Cleaning-Data-Quan
Getting and Cleaning Data Course Project

User's Guide:
1. Download the data source and put into a folder on your local drive.
2. Put run_analysis.R in the parent folder of UCI HAR Dataset.
3. Set the fold where run_analysis.R locates as your working directory using setwd() function in RStudio.
4. Run source("run_analysis.R").
5. A new file named "TidiedSamSungdataQuan.txt" will appear in your working directory.

Dependencies
Step 4 of the the guide will automatically install depended packages for you if they do not exist previously.
"run_analysis.R" depends on reshape2, dplyr.
