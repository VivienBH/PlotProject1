## Load data, draw graphic and store in file "plot2.png"
## 2015-5-10

## Set the working directory
#setwd("~/Desktop/Coursera/Exploratory Data Analysis")

## Load tidy data - data set store in object named power.consumption
source("getandcleandata.R")


## Draw plot
plot(power.consumption$DateTime, power.consumption$Global_active_power, xlab = " ", ylab = "Global Active Power (kilowatts)", type = "l")


dev.copy(png, file = "plot2.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!