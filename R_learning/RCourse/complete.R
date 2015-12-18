complete <- function(directory, id = 1:332)
{
  nobs <- vector(length = length(id))
  index = 1
  for (i in id)
  {
    psep <- if (Sys.info()['sysname'] == 'Windows'){'\\'} else {'/'}
    data <- read.csv(paste(directory, paste(sprintf('%03d', i),'.csv', sep = ''), sep = psep))
    nobs[index] <- sum(complete.cases(data[['nitrate']], data[['sulfate']]))
    index = index + 1
  }
  
  df <- data.frame(id, nobs)
  df
}