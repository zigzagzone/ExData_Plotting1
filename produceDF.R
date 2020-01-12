library(sqldf)
library(downloader)

produceDF <- function () {
  ## Download data file
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  directoryName <- "./"
  fileName <- "dataset.zip"
  fileLocationToStore <- file.path(directoryName, fileName)
  if (!file.exists(fileLocationToStore)) {
    download(url, dest=fileName, mode="wb") 
    unzip (fileName, exdir = directoryName)
    
    ## Date format dd/mm/yy
    ## filter only selected date
    df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
    
    ## Concat date and time and create new col named 'DateTime'
    df$DateTime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
    
    ## store the tidy version of data for faster load next time
    write.csv(df, file = 'household_power_consumption_reduce.csv', row.names=FALSE)
  }
  ## read for the file that save only specific date, save time!
  ## specific the col class to read to be the same when read from function read.csv.sql
  df <- read.csv("household_power_consumption_reduce.csv", colClasses=c(rep("character", 2), rep("numeric",7), "POSIXct"))
  
  ## return df
  df
}