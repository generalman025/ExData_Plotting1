
## Check text file
files <- list.files(pattern = "household_power_consumption.txt")
if(length(files) == 0){
  ## Download and Unzip file
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'household_power_consumption.zip')
  unzip('household_power_consumption.zip')
}
rm(files)

## Read Text File to Dataset
dataset <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                      na.strings = '?', stringsAsFactors = FALSE)

## Create New Column 'DateTime' which combine of 'Date' column and 'Time' Column
library(dplyr)
dataset <- subset(dataset, Date=='1/2/2007' | Date=='2/2/2007')
dataset <- mutate(dataset, DateTime = paste(Date, Time))
dataset <- mutate(dataset, DateTime = as.POSIXct(strptime(DateTime, '%d/%m/%Y %H:%M:%S'), tz=''))

## Create plot3.png
png("plot3.png", width = 480, height = 480)
with(dataset, plot(DateTime, Sub_metering_1, type = "S", xlab = '', ylab = 'Energy sub metering'))
with(dataset, lines(DateTime, Sub_metering_2, col='red'))
with(dataset, lines(DateTime, Sub_metering_3, col='blue'))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8)
dev.off()

