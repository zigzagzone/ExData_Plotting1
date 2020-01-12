source("produceDF.R")

produceGraph <- function () {
  ## call utils function to download and prepare data
  df <- produceDF()
  
  ## plot the graph with plot function, specific type to 'l' to create line function
  with(df, plot(DateTime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))
  
  ## copy to png file, named it "plot2.png" and set the width and height in pixel
  dev.copy(png, file = "plot2.png", width = 480, height = 480)
  
  ## close device
  dev.off()
}

produceGraph()