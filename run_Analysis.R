library(plyr)

# right_place() is a helper function used to allow the user to determine
# if the working directory is correctly set for the run_Analysis() function

right_place <- function() {
	yy <- all(file.exists("activity_labels.txt", "features.txt", "test/subject_test.txt", "test/X_test.txt", "test/y_test.txt", "train/subject_train.txt", "train/X_train.txt", "train/y_train.txt"))
	yy
}

# read_averages() is a helper function that can be called to read the processed
# data written to the output file into a R console session.

read_averages <- function(file = "av_output.txt") {
	av <- read.table(file)
	av
}

# Processes data as described in code book.  Takes means of selected 
# measurements based on subsets of the data indexed on Subject/Activity.

create_averages_dataset <- function(ds) {
	nr <- 1

	# Create the Subject/Activity index data frame

	pkey <- unique(ds$Subject)
	skey <- unique(ds$Activity)
	maxrow <- length(pkey) * length(skey)

	pidx <- rep(NA, maxrow)
	sidx <- rep(NA, maxrow)
	
	for (i in pkey) {
		for (j in skey) {
			pidx[nr] <- i
			sidx[nr] <- j
			nr <- nr + 1
		}
	}
	av <- data.frame(Subject=pidx, Activity=sidx)
	
	# Generate the count of observations of each Subject/Activity Pair

	nav <- names(av)
	av <- ddply(ds, c(.(Subject), .(Activity)), nrow)

	nav <- c(nav, "Count")
	names(av) <- nav

	# Generate the summary data from measurements of each subject and activity

	dsname <- names(ds)
	dsn <- length(dsname)
	for (i in dsname[3:dsn]) {
		eval(parse(text = paste0("ret <- ddply(ds, c(.(Subject), .(Activity)), summarize, ", i, "=mean(", i, ", na.rm=TRUE))")))
		av <- merge(av, ret, all=TRUE)
	}

	# Order the resulting dataset based on Subject ID and Activity
	av <- av[order(av$Subject, av$Activity),]
	av
}

# Reads Activity Labels

get_act_labels <- function(file = "./activity_labels.txt") {
	al <- read.table(file, stringsAsFactors=FALSE)
}

# Helper function to retrieve the indices of the mean/standard deviation of acceleration/angular velocity measurements.  Modify the field names to those described in the codebook.

get_data_indices_labels <- function(file = "./features.txt") {
	idl <- read.table(file)
	idl$V2 <- gsub("\\(\\)", "", idl$V2)
	idl <- idl[grepl("mean-|std-", idl$V2),]
	idl$V2 <- gsub("-", "_", idl$V2)
	idl
}

# Read subset of the UCI dataset from a given directory location

read_dataset <- function(dir, idl, nrows=-1) {
	save_dir <- getwd()
	setwd(dir)
	fname <- sprintf("subject_%s.txt", dir)
	ss <- read.table(fname, nrows=nrows)
	fname <- sprintf("y_%s.txt", dir)
	yy <- read.table(fname, nrows=nrows)
	fname <- sprintf("X_%s.txt", dir)
	xx <- read.table(fname, nrows=nrows)
	xx <- xx[, idl$V1]
	xx["Subject"] <- ss
	xx["Activity"] <- yy

	nr <- nrow(idl)
	xx <- xx[c(nr+1, nr+2, 1:nr)]
	names(xx) <- c("Subject", "Activity", idl$V2)
	setwd(save_dir)	
	xx
}

# run_Analysis() is the function required to executed by the user
# to process the UCI data
#
# By default, it will read all the data in the test and training datasets
# The parameter "nrows" can be used to read a given number of rows 
# in each dataset. 
#
# The processed data will be written to a text file called 
# "av_output.txt" unless the parameter "outfile" is used to specify 
# the output file name.
#
# The parameter "write_combine" can be used to write the merged UCI dataset 
# with descriptive labels and field names (these are the same as in the 
# final output file). My default this file is not written.  The value of 
# write_combine should be a character string containing the filename/path 
# to write the combined data into.


run_Analysis <- function(nrows = -1, outfile="av_output.txt", write_combine=NULL) {

# Read the indices of the each field and field name associated with each measurement that is a mean() or standard deviation of a measured acceleration or angular velocity (see codebook for more details)

	dil <- get_data_indices_labels()

# Read the Activity Labels 
	act_lab <- get_act_labels()

# Read the UCI training dataset & apply field names
	d1 <- read_dataset("train", dil, nrows = nrows)

# Read the UCI test dataset & apply field names
	d2 <- read_dataset("test", dil, nrows = nrows)

# Merge the two datasets
	dcom <- rbind(d1, d2)

# Apply the Activity labels to the dataset
	dcom$Activity <- factor(dcom$Activity, levels = act_lab$V1, labels = act_lab$V2)

# Check if user wants combined dataset written out

	if (! is.null(write_combine)) {
		write.table(dcom, write_combine)
	}

# Process the data to produce the summary dataset 
	av <- create_averages_dataset(dcom)

# Write the data to the output file
	write.table(av, file = outfile, row.name=FALSE)
}
