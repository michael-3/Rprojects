complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  temp <- list.files(path = paste(getwd(),"/",directory, sep = ""), pattern = "*.csv", full.names = TRUE)
  data <- lapply(temp[id], read.csv)
  
  clean_data <- lapply(data, na.omit)
  complete_cases <- mapply(nrow, clean_data)

  return (data.frame(id = id, nobs = complete_cases))
}