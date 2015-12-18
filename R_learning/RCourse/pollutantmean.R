pollutantmean <- function(directory, pollutant, id = 1:332)
{
  psum <- 0.0
  pcount <- 0.0
  for (i in id)
  {
    psep <- if (Sys.info()['sysname'] == 'Windows'){'\\'} else {'/'}
    data <- read.csv(paste(directory, paste(sprintf('%03d', i),'.csv', sep = ''), sep = psep))
    data <- data[[pollutant]][!is.na(data[[pollutant]])]
    psum <- psum + sum(data)
    pcount <- pcount + length(data)
  }
  
  psum / pcount
}