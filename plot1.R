# plot1.R
# Makes histogram of Global Active Power for desired date range

# load helper functions
source("plotLib.R")

infile <- c("household_power_consumption.txt");

d <- read_data(infile)
d <- filter_data(d)

# purposely demonstrating setting title after initial rendering
# must set main = "" so the default title isn't drawn
# note: cannot specify xlab/ylab after rendering!!!
hist(d$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main="")
title("Global Active Power")

# write PNG file
dev.copy(png, "plot1.png")
dev.off()
