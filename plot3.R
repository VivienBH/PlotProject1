## Load data, draw graphic and store in file "plot3.png"
## 2015-5-10

## Set the working directory
#setwd("~/Desktop/Coursera/Exploratory Data Analysis")

## Load tidy data - data set store in object named power.consumption
source("getandcleandata.R")

par(ps = 11, cex = 1, cex.main = 1)
## Draw plot
plot(power.consumption$DateTime, power.consumption$Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "l")
lines(power.consumption$DateTime, power.consumption$Sub_metering_2, col = "red")
lines(power.consumption$DateTime, power.consumption$Sub_metering_3, col = "blue")
legend("topright",  lty="solid", col=c("black", "red", "blue"), 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!