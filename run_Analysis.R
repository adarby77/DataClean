read_averages <- function(file = "av_output.txt") {
	av <- read.table(file)
	av
}

average_dataset <- function(ds) {
	nr <- 1
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
	dsname <- names(ds)
	dsn <- length(dsname)
	for (i in dsname[3:dsn]) {
		eval(parse(text = paste0("ret <- ddply(ds, c(.(Subject), .(Activity)), summarize, ", i, "=mean(", i, ", na.rm=TRUE))")))
		av <- merge(av, ret, all=TRUE)
	}
	av
}



get_act_labels <- function(file = "./activity_labels.txt") {
	al <- read.table(file, stringsAsFactors=FALSE)
}

get_data_indices_labels <- function(file = "./features.txt") {
	idl <- read.table(file)
	idl$V2 <- gsub("\\(\\)", "", idl$V2)
	idl <- idl[grepl("mean-|std-", idl$V2),]
	idl$V2 <- gsub("-", "_", idl$V2)
	idl
}

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


run_Analysis <- function(nrows = -1, outfile="av_output.txt") {
	save_dir <- getwd()
	dil <- get_data_indices_labels()
	act_lab <- get_act_labels()
	d1 <- read_dataset("train", dil, nrows = nrows)
	d2 <- read_dataset("test", dil, nrows = nrows)
	dcom <- rbind(d1, d2)
	dcom$Activity <- factor(dcom$Activity, levels = act_lab$V1, labels = act_lab$V2)
	setwd(save_dir)
	av <- average_dataset(dcom)
	write.table(av, file = outfile)
}
