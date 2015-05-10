## Get and Clean Data for 1st assignment
## 2015-5-9

## Required packages
library(sqldf)
library(dplyr)

## Check to see if the existing tidy data set exists; if not, make it...
if (!file.exists('power_consumption.txt')) {
        
        ## Check to see if the source data set zip exists; if not, make it...
        if (!file.exists('power_consumption.zip')) {
                
                ## Download the zip file and unzip
                file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
                download.file(file.url, destfile='power_consumption.zip', method = "curl")
        }
        ## Unzip file
        unzip('power_consumption.zip', overwrite=TRUE)
        
        
        
        ## Read csv file based on condition that Date is either 2/2/2007 or 1/2/2007
        power.consumption <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)
        
        ## Generate a new column of type date. 
        power.consumption$DateTime <- strptime(paste(power.consumption$Date, power.consumption$Time), format = "%d/%m/%Y %H:%M:%S")
                
        ## Write a clean data set to the directory
        write.table(power.consumption,file='power_consumption.txt',sep=';',row.names=FALSE)
        
        ## Close connection
        sqldf()
        
        # Remove the large raw data set 
        if (file.exists('household_power_consumption.txt')) {
                x<-file.remove('household_power_consumption.txt')
        }
        
} else {
        
        power.consumption<-read.table('power_consumption.txt',header=TRUE,sep=';')
        power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
        
}