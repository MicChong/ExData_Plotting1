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

data2 <- subset(data, select=c(datetime, Sub_metering_1, Sub_metering_2, Sub_metering_3))
data2 <- reshape(data2, direction="long", varying=list(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")), times=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), timevar="Sub_metering", idvar="datetime", v.names="value")


## Plot 4
png(filename = "plot4.png", width=480, height=480, units="px")

par(mfrow=c(2, 2))
plot(Global_active_power ~ datetime, data, type="l", xlab="", ylab="Global Active Power", main="")

plot(Voltage ~ datetime, data, type="l", xlab="datetime", ylab="Voltage", main="")

with(data2, plot(datetime, value, main="", type="n", xlab="", ylab="Energy sub metering"))
with(subset(data2, Sub_metering=="Sub_metering_1"), lines(datetime, value, col="black"))
with(subset(data2, Sub_metering=="Sub_metering_2"), lines(datetime, value, col="red"))
with(subset(data2, Sub_metering=="Sub_metering_3"), lines(datetime, value, col="blue"))
legend( "topright", lty=1,  col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(Global_reactive_power ~ datetime, data, type="l", main="")

dev.off()

## Remove and free memory
rm(data)
rm(data2)
rm(datetime)
rm(startdate)
rm(enddate)

