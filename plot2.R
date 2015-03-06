## Plot2.R is for assignment to create a 480X480 PNG for Global Active Power
##
## First a function to Load the Data is called to populate the data.frame named data
## This is sourced from "load_the_dat.R" and included i the GITHub
## Next a PNG is opened which is 480X480
## Next a Line Chart is plotted with the appropriate settings
## Then the device is turned off to close the file
##
## Special notes:  The load_the_data ensures a clean data frame by repopulating data each time, but
## saves processing by checking for existence of the downloaded .zip and .txt files and skipping
## those steps if appropriate.
source("load_the_data.R")
data<-load_the_data()

png("plot2.png", width=480, height=480)
plot(data$Time, data$Global_active_power,
        type="l",
        ylab="Global Active Power (kilowatts)",
        xlab="",
        col="black")
dev.off()