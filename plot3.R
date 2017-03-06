# plot3.R

# load helper functions
source("plotLib.R")

infile <- c("household_power_consumption.txt");

d <- read_data(infile)
d <- filter_data(d)

# make date objects (POSIXct) and add to the data frame:
dateTime <- paste(d$Date, d$Time)
dateTimeFormat = "%d/%m/%Y %H:%M:%S"
d$DateTime <- as.POSIXct(dateTime, format = dateTimeFormat)

plot(d$DateTime, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");

points(d$DateTime, d$Sub_metering_2, pch=".", xlab="", ylab="")
lines(d$DateTime, d$Sub_metering_2, col="red")

points(d$DateTime, d$Sub_metering_3, pch=".", xlab="", ylab="")
lines(d$DateTime, d$Sub_metering_3, col="blue")

legend("topright", 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lwd = 1)


# write PNG file
dev.copy(png, "plot3.png")
dev.off()
