source("produceDF.R")

produceGraph3 <- function (df, cex = 1, box.lwd = 1) {
  ## plot the graph with plot function, specific type to 'n' to create empty graph
  with(df, plot(DateTime, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering'))
  
  ## plot the line with lines function and specify data Sub_metering_1 as black
  with(df, lines(DateTime, Sub_metering_1, col = 'black'))
  
  ## repeat with Sub_metering_2 as red
  with(df, lines(DateTime, Sub_metering_2, col = 'red'))
  
  ## repeat with Sub_metering_3 as blue
  with(df, lines(DateTime, Sub_metering_3, col = 'blue'))
  
  ## fill the legend at topright
  ## cex parameter use to scale the size of legend box default to 1
  ## box.lwd is legend box border set to 0 to hide border
  legend("topright", lty=1, col=c('black','red', 'blue'), legend=c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), cex = cex, box.lwd = box.lwd)
}

produceGraph <- function () {
  ## call utils function to download and prepare data
  df <- produceDF()
  
  ## call function to plot graph
  produceGraph3(df)
  
  ## copy to png file, named it "plot3.png" and set the width and height in pixel
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  
  ## close device
  dev.off()
}

produceGraph()