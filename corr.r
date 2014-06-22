corr <- function(directory, threshold = 0) {
  
  all <- numeric()
  
  for(file in list.files(directory)){
    
    DataPoll <- read.table(paste(directory,"/",file,sep=""),sep=",",header=TRUE)
    DataComplete <- nrow(DataPoll[complete.cases(DataPoll),])
    
    if(DataComplete > threshold){
      all <- c(all,cor(DataPoll$nitrate,DataPoll$sulfate,use="complete.obs"))
    }
  }
  as.numeric(all)
}