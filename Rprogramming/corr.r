corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  complete_cases <- complete(directory, 1:332)
  acceptable_cases <- which(complete_cases$nobs > threshold)
  
  temp <- list.files(path = paste(getwd(),"/",directory, sep = ""), pattern = "*.csv", full.names = TRUE)
  data <- lapply(temp[acceptable_cases], read.csv)
  
  v <- vector()
  
  if (length(data) == 0){
    return (v)
  }
  for (i in 1:length(data)){
    v <- c(v,(cor(data[[c(i,2)]], data[[c(i,3)]], use="complete.obs"))) 
  }
  
  return (v)
}