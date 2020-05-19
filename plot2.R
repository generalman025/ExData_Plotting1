
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

## Create plot2.png
png("plot2.png", width = 480, height = 480)
plot(dataset$DateTime, dataset$Global_active_power, type = "S", xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
