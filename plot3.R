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

##plot 3 Engergy sub metering vs time

labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finaldf$timedatedf, finaldf$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finaldf$timedatedf, finaldf$Sub_metering_2, col=columnlines[2])
lines(finaldf$timedatedf ,finaldf$Sub_metering_3, col=columnlines[3])

dev.copy(png,"plot3.png", width=480, height=480)