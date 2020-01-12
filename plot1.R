source("produceDF.R")

produceGraph <- function () {
  ## call utils function to download and prepare data
  df <- produceDF()
  
  ## plot the graph with hist function
  with(df, hist(Global_active_power, main='Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)'))
  
  ## copy to png file, named it "plot1.png" and set the width and height in pixel
  dev.copy(png, file = "plot1.png", width = 480, height = 480)
  
  ## close device
  dev.off()
}

produceGraph()