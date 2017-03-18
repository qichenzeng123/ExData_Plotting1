##/////////////////////////////////////////////////////////////////////////////////////////////
## Qichen Zeng 
## Assignment: Programming Assignment 1 Electric power consumption 


## Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. 
## Different electrical quantities and some sub-metering values are available.
## The dataset has 2,075,259 rows and 9 columns.
## Create 4 plots 

##/////////////////////////////////////////////////////////////////////////////////////////////


## reading file

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


## filter the time from 1/2/2007 to 2/2/2007

finaldf <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

##combine date and time together

timedatedf <- strptime(paste(finaldf$Date, finaldf$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##bind back into df

finaldf <- cbind(timedatedf, finaldf)


## plot 1 freqency vs global active power
plot1 <- hist(finaldf$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
