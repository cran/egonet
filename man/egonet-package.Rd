\name{egonet-package}
\Rdversion{1.1}
\alias{egonet-package}
\alias{egonet}
\docType{package}
\title{
Tool for ego-centric measures in Social Network Analysis
}
\description{
A small tool for Social Network Analysis, dealing with 
ego-centric network measures, including Burt's effective size and aggregate constraint and an 
import code suitable for a large number of adjacency matrices.

This package depends on \code{\link[sna:sna]{sna} } but does not automatically import it during installation. Therefore if \code{\link[sna:sna]{sna}} is not already present in your system, install it (e.g. \code{install.packages("sna")} ).
}

\details{
\tabular{ll}{
Package: \tab egonet\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2010-03-11\cr
License: \tab GPL (>= 2)\cr
LazyLoad: \tab yes\cr
}

}
\author{
A. Sciandra, F. Gioachin, L. Finos

Maintainer:  <livio@stat.unipd.it>
}
\references{
Burt, R.S. (1992) ''Structural Holes. The Social Structure of Competition'', Cambridge (MA), Harvard University Press.

Wasserman, S. and Faust, K. (1994) ''Social Network Analysis. Method and Applications'', Cambridge (MA), Cambridge University Press.
}

\keyword{ package }
\seealso{ \code{\link[sna:sna]{sna}} }

\examples{
## This is a list of file' names containing the ego-network
ff <- c("q1.csv","q2.csv","q3.csv")
files  <- paste("http://associazionerospo.org/egonetdata/",ff,sep="")
names(files) <- ff

##if all your data are in a directory (eg. egonets, containing all files with the same extension), 
##you can easily get this list with the following commands
# ff <- dir("./egonets",pattern=".csv")
# files  <- paste("./egonets/",ff,sep="")
# names(files) <- ff


# Here is a dataset with demographic informations and the names of files containing the ego-network
#we now want to add network indeces to this data.frame
data <- data.frame( gender=c("F","F","M"), age =(2:4)*10, filename=ff)
data


#import all the egonets
mats <- lapply(files,read.egonet)

#compute (default) indices on the first subject
index.egonet(mats[[1]])

#compute indices on all adjacency matrices
idx <- sapply(mats,index.egonet)

#reshape idx in a data.frame and add the file names
idx <- as.data.frame(t(idx))
idx <- cbind(idx,filename=rownames(idx))

#now merge demographic informations with the indices
data <- merge(data,idx,by="filename")
data

#Compute the \code{effsize} and \code{constraint} to the restricted network with "EGO" and nodes with "P" in the name (i.e. the relatives social circle)
idx <- sapply(mats,index.egonet, subset = "P",index = c("effsize","constraint"))
rownames(idx) <- paste(rownames(idx),"P",sep=".")
idx <- as.data.frame(t(idx))
idx <- cbind(idx,filename=rownames(idx))

#and merge them to the dataset
data <- merge(data,idx,by="filename")
data
}
