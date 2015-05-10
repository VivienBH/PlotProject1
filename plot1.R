## Load data, draw graphic and store in file "plot1.png"
## 2015-5-9

## Set the working directory
#setwd("~/Desktop/Coursera/Exploratory Data Analysis")

## Load tidy data - data set store in object named power.consumption
source("getandcleandata.R")

## Par
par(ps = 12, cex = 1, cex.main = 1.5)

## Draw plot1
hist(power.consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!