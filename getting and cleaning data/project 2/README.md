analysis of accelerometer data for coursera getdata-002 peer assessment

download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and extract into the toplevel of the repository. then run

    Rscript run_analysis.R

to apply analysis.

this will result in two csv files being written:

* measurements_mean_std.txt containing only the mean and standard deviation for each measurement
* activity_subject_means.txt containing the averages of the mean and the standard deviation per unique (activity, subject) pair

see CodeBook.md for description of the extraction process and the
columns in the two files.
