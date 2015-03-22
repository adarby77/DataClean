
## SUMMARY
The R script "run_Analysis.R" can be used process the Human Activity dataset available and described at the following web location :-

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset is downloadable from that location as a zip file.  When the zip file is uncompressed the extracted data will be contained a directory named "UCI HAR Dataset".

The script will produce a summary dataset that is described in more detail in the file "CodeBook.md". 

## RUNNING THE SCRIPT

To run the script in R/Rstudio 

1) Use the R source() command to read the code into the R console session :-

##### > source("run_Analysis.R") 

this assumes the script is in the current working directory, if the script is not in the working directory then you need to provide the appropriate file path 

2) set the R console session working directory to be the "UCI HAR Dataset" directory extracted from the zip file, e.g.

##### > setwd("/home/user/DC/project/UCI HAR Dataset")

3) You can check if the script can locate the data by running the helper function right_place() which returns "TRUE" if the files exist in the expected locations.

##### > right_place()
#######[1] TRUE

4) Run the "run_Analysis()" script.

##### > run_Analysis()

By default the processed data is written to file "av_output.txt" in the current working directory.  To write to a different file use the "outfile" parameter, e.g.

##### > run_Analysis(outfile = "/home/user/mydata/UCI_output.txt")

5) To read the processed output data into the R session use the helper function "read_averages()".  If the output file is the default location, i.e. in the current working directory and called "av_output.txt" then the fllowing command can be used.

##### > uci_avs <- read_averages()

If the file is in a different location then use the "file" parameter to specify the path to the processed output file, e.g.

##### > uci_avs <- read_averages(file = "/home/user/mydata/UCI_output.txt")

Optionally the run_Analysis script can also write the full combined datasets to an output file (effectively the data as it exists at the end of step 4 of the project assignment).  This requires the use of the "write_combine" parameter, e.g.

##### > run_Analysis(write_combine = "full_merge_data.txt")

## REQUIRED PACKAGES
The script requires the "plyr" package to be installed.