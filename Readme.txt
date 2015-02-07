This is the submission of Project Assignment 1 of the course Exploratory Data Analysis.

For the detail of the tasks of this project, please refer to the file README.md.

In this file, I am going to describe the steps of selecting data for display and how to 
run the scripts to generate the plot images.

Steps of preparing data environment:
1. Make a directory named "data".
2. Download the data zip file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
3. Unzip the file and move the file "household_power_consumption.txt" into the "data" directory.
4. Move the "data" directory to the R working directory

Steps of preparing the data set:
1. The file is read into a data frame format.
2. Convert the Date and Time character string to a POSIXlt format and bind to the data frame
3. Remove the original Date and Time columns
4. Subset the data  by selecting the required period of time
5. The data is now ready for the processing and plotting thr graphs.

Steps of running the script files:
1. Please make sure the script files and the data file is on the working directory.
2. In the R console, please run the following commands:
      source("plot1.R")
      source("plot2.R")
      source("plot3.R")
      source("plot4.R")
   Four png image files will be generated in the working directory.	

	
 