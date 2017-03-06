# plot2.R
# plot Global Active Power vs. time and connect the dots

# load helper functions
source("plotLib.R")

infile <- c("household_power_consumption.txt");

d <- read_data(infile)
d <- filter_data(d)

# make date objects (POSIXct) and add to the data frame:
dateTime <- paste(d$Date, d$Time)
dateTimeFormat = "%d/%m/%Y %H:%M:%S"
d$DateTime <- as.POSIXct(dateTime, format = dateTimeFormat)

plot(d$DateTime, d$Global_active_power, pch = 27, xlab="", ylab="Global Active Power (kilowatts)");
lines(d$DateTime, d$Global_active_power)

# write PNG file
dev.copy(png, "plot2.png")
dev.off()
