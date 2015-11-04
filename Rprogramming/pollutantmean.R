pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!

        temp <- list.files(path = paste(getwd(),"/",directory, sep = ""), pattern = "*.csv", full.names = TRUE)
        data <- do.call("rbind", lapply(temp[id], read.csv))
        
        ## For some reason, this messes up the values
        # good <- complete.cases(data)
        # clean_data <- data[good,]

        # if (pollutant == "sulfate"){
        # 	## return (sum(clean_data[,2])/nrow(clean_data))
        # 	return (mean(clean_data[,2], na.rm = TRUE))
        # }

        # else if (pollutant == "nitrate"){
        # 	## return (sum(clean_data[,3])/nrow(clean_data))
        # 	return (mean(clean_data[,3], na.rm = TRUE))
        # }

        # return (mean(clean_data[pollutant]))

        return (mean(data[[pollutant]], na.rm  = TRUE))
}