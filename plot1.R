
## Download and Unzip file
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'household_power_consumption.zip')
unzip('household_power_consumption.zip')

## Read Text File to Dataset
dataset <- read.table('household_power_consumption.txt', sep=';', na.strings = '?', stringsAsFactors = FALSE)
names(dataset) <- dataset[1, ]
dataset <- dataset[-1,]