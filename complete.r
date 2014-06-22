complete <- function(directory, id = 1:332) {  
  
  all <- data.frame()
  
  for(file in rep(id)){
    
    DataComplete <- read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""),sep=",",header=TRUE)
    all <- rbind(all,cbind(file,nrow(DataComplete[complete.cases(DataComplete),])))
  }
  
  colnames(all)<-c("id","nobs")
  all
}