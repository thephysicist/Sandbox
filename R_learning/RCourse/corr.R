corr <- function(directory, threshold = 0)
{
  files <- list.files(directory)
  output <- vector(mode  = "numeric")
  for (f in files)
  {
    psep <- if (Sys.info()['sysname'] == 'Windows'){'\\'} else {'/'}
    data <- read.csv(paste(directory, f, sep = psep))
    comp <- complete.cases(data[["Date"]], data[["sulfate"]], data[["nitrate"]], data[["ID"]])
    if (length(comp[comp]) > threshold)
    {
      nsCorr = cor(data[["sulfate"]][comp], data[["nitrate"]][comp])
      output <- c(output, nsCorr)
    }
  }
  output
}