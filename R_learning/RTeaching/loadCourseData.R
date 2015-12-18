checkAndInstall <- function(packageName)
{
    # pkg is a matrix and its first column is a vector of package names
    pkg <- installed.packages()
    dsExists <- packageName %in% pkg[ , 1]
    if (!dsExists)
    {
        print(paste(packageName, "is currently not installed."))
        print(paste("Installing", packageName, "..."))
        install.packages(packageName)
    }
    else
    {
        print(paste(packageName, "is already installed."))
    }
}

loadCourseData <- function()
{
    checkAndInstall("datasets")
    checkAndInstall("ggplot2")
    checkAndInstall("stats")
    checkAndInstall("graphics")
    
    
    print("test plotting ...")
    boxplot(weight ~ feed, data = chickwts, col = "lightgray",
    varwidth = TRUE, notch = FALSE, main = "chickwt data",
    ylab = "Weight at six weeks (gm)")
    anova(fm1 <- lm(weight ~ feed, data = chickwts))
    opar <- par(mfrow = c(2, 2), oma = c(0, 0, 1.1, 0),
    mar = c(4.1, 4.1, 2.1, 1.1))
    plot(fm1)
    par(opar)
}


loadCourseData()