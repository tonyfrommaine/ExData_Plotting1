## Plot4.R is for assignment to create a 480X480 PNG for 4 differnt graphs
##
## First a function to Load the Data is called to populate the data.frame named data
## This is sourced from "load_the_dat.R" and included i the GITHub
## Next a PNG is opened which is 480X480
## Next the charts are created
## Then the device is turned off to close the file
##
## Special notes:  The load_the_data ensures a clean data frame by repopulating data each time, but
## saves processing by checking for existence of the downloaded .zip and .txt files and skipping
## those steps if appropriate.
source("load_the_data.R")
data<-load_the_data()

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## First Plot  Line Graph Global Active Power
plot(data$Time, data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     col="black")

## Second Plot Line Graph Voltage
plot(data$Time, data$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime",
     col="black")

## Third Plot Multi-Line Energy Sub Metering
plot(data$Time, data$Sub_metering_1,
        type="n",
        ylab="Energy sub metering",
        xlab="",
        col="black")
points(data$Time, data$Sub_metering_1,col="black", type="l")
points(data$Time, data$Sub_metering_2,col="red", type="l")
points(data$Time, data$Sub_metering_3,col="blue", type="l")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       bty="n")

## Fourth Plot Line Chargt Global Reactive Power
plot(data$Time, data$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime",
     col="black")

dev.off()