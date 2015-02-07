## Read the data into memory
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## Combine the Date and Time columns and convert the string into Date format
datetime <- strptime(x=paste(data[, 1], data[, 2]), format="%d/%m/%Y %H:%M:%S")

## Bind the column to the original data
data <- cbind(datetime, data)

## Remove Date abd Time columns
data["Date"] = NULL
data["Time"] = NULL

## Select data from the dates 2007-02-01 and 2007-02-02
startdate <- strptime(x="1/2/2007 0:0:0", format="%d/%m/%Y %H:%M:%S")
enddate <- strptime(x="2/2/2007 23:59:59", format="%d/%m/%Y %H:%M:%S")
data <- subset(data, datetime >= startdate & datetime <= enddate)
Sys.setlocale("LC_TIME", "English")

## Plot 1
png(filename = "plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatt)", main="Global Active Power")
dev.off()

## Remove and free memory
rm(data)
rm(datetime)
rm(startdate)
rm(enddate)


