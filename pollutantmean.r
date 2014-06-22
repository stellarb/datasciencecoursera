pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  DataPoll <- data.frame()
  
  for(file in rep(id)){
    DataPoll <- rbind(DataPoll,read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""),sep=",",header=TRUE))
  }
  
  mean(as.matrix(DataPoll[pollutant]),na.rm=TRUE)

}