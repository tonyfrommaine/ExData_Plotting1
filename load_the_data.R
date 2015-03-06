## Function load_the_data is called from the various plotting functions
## Purpose is to load the data, convert dates, and subset to meet
## requirements of the project.
## Function does not have any agruments and returns a dataframe with the required data.
## Thus, the function should be called to populate a data.frame in such a way as:
##         data <- load_the_data()
## This should be called at the start of each of the plot.R programs to load the appropriate
## data.
##
## The function will only download the the zip file if it has not been downloaded
## The function will only unzip the file if the .txt file does not exist.
## The function will ALWAYS reload the dataframe from the .txt to ensure clean data
##


#Set the Source Url and destination file, download only if it does not exist yet

load_the_data <- function() {
        zipfile <- "household_power_consumption.zip"
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        filename <- "household_power_consumption.txt"
        if (!file.exists(zipfile)){
                download.file(fileUrl,zipfile,method="curl")}
        if(!file.exists(filename)){
                unzip(zipfile)
        }
        
        ## Load the data with appropriate coClasses
        df <- read.table(filename,
                         header=TRUE,
                         sep=";",
                         colClasses=c("character", "character", rep("numeric",7)),
                         na="?")
        # Then use the strptime and as date to convert the data
        df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
        df$Date <- as.Date(df$Date, "%d/%m/%Y")
        # Now filter the data
        dates_to_subset <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
        df <- subset(df, Date %in% dates_to_subset)
        
        #Return the data frame to be used by the various graphing programs
        return(df)
        
}

