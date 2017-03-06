# Reads in and filters data set by desired date range.
read_data <- function(infile) {
	d <- read.csv(
		infile, sep=";", 
		na.strings="?", 
		colClasses = c(
		    "character",
		    "character",
		    "numeric",
		    "numeric",
		    "numeric",
		    "numeric",
		    "numeric",
		    "numeric",
		    "numeric"
		)
	);

    d
}

filter_data <- function(df) {
    # filter by desired date range
    f <- grepl("^(1|2)/2/2007", d$Date)
    filter(d, f)
}



