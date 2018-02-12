### Script to analyze spectrophotometer files
### Written by ... 

## Function read.spec reads in data, 
## removes header and footer, 
## subsets to wavelength range 300 - 750 

## If you need to setwd() make sure you comment it out before you submit it.

read.spec <- function ( myfile )  {  
	dat <- read.table(file=myfile, skip=17, comment.char=">")
	names(dat) <- c("lambda", "intensity")
	
	dat <- dat[ dat$lambda >= 300 & dat$lambda <= 750,   ]
	return (dat)
}

dat1 <- read.spec( "Data/20070725_01forirr.txt"  )
dat2 <- read.spec( "Data/20070725_01upirr.txt"  )
dat3 <- read.spec( "Data/20070725_01rightirr.txt"  )
dat4 <- read.spec( "Data/20070725_01leftirr.txt"  )

plot.spec <- function( X ) {

    plot(X, type="l")
	max_intensity <- max(X$intensity)   # use indexing to find the lambda @max intensity
	max_lambda <- X$lambda[ X$intensity  == max_intensity ]
	
    points(max_lambda, max_intensity, col="red", cex=3, pch=19)  
    return(c(max_lambda, max_intensity))
} 
	## What should we return for our final dataframe of max intensity, lambda?

plot(dat1, type="l")   ## ... 
plot(dat2, type="l")   ## ... 
plot(dat3, type="l")
plot(dat4, type="l")




  