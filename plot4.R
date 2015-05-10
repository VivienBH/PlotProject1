## Load data, draw graphic and store in file "plot3.png"
## 2015-5-10

## Set the working directory
#setwd("~/Desktop/Coursera/Exploratory Data Analysis")

## Load tidy data - data set store in object named power.consumption
source("getandcleandata.R")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
par(ps = 12, cex.lab = 1)
with(power.consumption, {
        plot(DateTime, Global_active_power, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(DateTime, Voltage, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(DateTime, Sub_metering_1, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(DateTime, Sub_metering_2,col="Red")
        lines(DateTime, Sub_metering_3,col="Blue")
        legend("topright", lty="solid", cex = 0.45, col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()