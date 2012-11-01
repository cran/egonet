\name{read.egonet}
\Rdversion{1.2}
\alias{read.egonet}
\title{ Reads ego-centric graph in table format and creates a matrix suitable for SNA.
}
\description{ Reads text table and creates ego-centric graph from it, with the ego actor in the first row and column. The result is a square matrix with common input/output connection' names.
}
\usage{
read.egonet(file, sep=",", dec=".", ego.name="EGO")
}
\arguments{
  \item{file}{ 	the name of the file which the data are to be read from. 
It must be a square matrix, with node's names in the first row and column.
  See also \code{file} of \code{\link[utils:read.table]{read.table}} 
}
\item{sep}{ as in \code{\link[utils:read.table]{read.table}} }
\item{dec}{ as in \code{\link[utils:read.table]{read.table}} }

\item{ego.name}{ column and row name given to the ego subject. The default is \code{EGO} }
}
\value{
A square matrix containing the ego-centric network of the data in the file.
}
\author{
F. Gioachin, A. Sciandra, L. Finos  <livio@stat.unipd.it>
}



\seealso{
 \code{\link[utils:read.table]{read.table}}
}
\examples{
dat <- read.egonet("http://www.egonet.associazionerospo.org/egonetdata/q1.csv")

dat
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ file }
\keyword{ datagen }% __ONLY ONE__ keyword per line
