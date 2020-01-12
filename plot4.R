source("produceDF.R")
source("plot3.R")

produceGraph <- function () {
  ## call utils function to download and prepare data
  df <- produceDF()
  
  par(mfrow = c(2, 2))
  
  ## plot the graph with plot function, specific type to 'l' to create line function
  with(df, plot(DateTime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power'))
  
  ## plot the graph with plot function, specific type to 'l' to create line function
  with(df, plot(DateTime, df$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage'))
  
  ## call function to plot graph number 3
  produceGraph3(df, cex = 0.5, box.lwd = 0)
  
  ## plot the graph with data Global_reactive_power
  with(df, plot(DateTime, Global_reactive_power, type = 'l', xlab = 'datetime'))
  
  ## copy to png file, named it "plot4.png" and set the width and height in pixel
  dev.copy(png, file = "plot4.png", width = 480, height = 480)
  
  ## close device
  dev.off()
}

produceGraph()