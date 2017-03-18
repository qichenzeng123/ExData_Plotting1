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

##plot 4 all plots global active power, voltage, engergy sub metering and global reactive power

par(mfrow=c(2,2))
plot(finaldf$timedatedf, finaldf$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(finaldf$timedatedf, finaldf$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(finaldf$timedatedf, finaldf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finaldf$timedatedf, finaldf$Sub_metering_2, type="l", col="red")
lines(finaldf$timedatedf, finaldf$Sub_metering_3, type="l", col="blue")
plot(finaldf$timedatedf, finaldf$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,"plot4.png", width=480, height=480)