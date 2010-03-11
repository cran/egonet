\name{index.egonet}
\Rdversion{1.1}
\alias{index.egonet}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{  Compute Burt's indexes (effective size and aggregate constraint) and other measure from sna package
}
\description{
Compute Burt's indexes (effective size and aggregate constraint) and other measure from 
\code{\link[sna:sna]{sna}} package.  
It also allow to restrict the analysis to one social circle identified by the name of the alters.
}
\usage{
index.egonet(dat, index = list("effsize", "constraint", "outdegree", "indegree", "efficiency", "hierarchy", "centralization", "gden", "ego.gden"), subset = NULL, ego.name = "EGO")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{graph to be analyzed having row and column names in the same order. 
}
  \item{index}{ is a list containing prespecified index functions. 
  \code{effsize} and  \code{constraint} are defined in as in Burt (1992) \\
  \code{outdegree} and \code{indegree} make a call of \code{degree(dat, cmode="outdegree")} and \code{degree(dat, cmode="indegree")} and take the element corresponding to \code{ego.name}\\
  \code{ego.gden} applies \code{gden} in a matrix without \code{ego.name} connections.  \\
  Other indeces are call of the homonimous functions of package \code{\link[sna:sna]{sna}}. \\ 
  If the generic element \code{is.call(index[[h]])} is \code{TRUE}, it will be evaluated in the global environment: \code{eval(index[[h]],envir =.GlobalEnv)}  (see also example below)
}
\item{subset}{Restricts the analysis to the nodes with at least one among the elements of \code{vector} in the name. If \code{vector = NULL} - the default - all the nodes of the graph are comprised.}
\item{ego.name}{ column and row name given to the ego subject. The default is \code{EGO} }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% Burt, R.S. (1992) ''Structural Holes. The Social Structure of Competition'', Cambridge (MA), Harvard University Press.
}
\author{
A. Sciandra, F. Gioachin, L. Finos  <livio@stat.unipd.it>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

# make a toy dataset
egomat <-  matrix(c(0,1,1,1,0,0,1,0,0),3,3)
colnames(egomat) <- rownames(egomat) <- c("EGO", "1P", "1A")

index.egonet(egomat)

# an example with self defined index 
my.outdegree <- function(dat) degree(dat,cmod="outdegree")[1]
index.egonet(egomat,index=c("effsize","constraint","outdegree","indegree","efficiency", "centralization", "gden", "ego.gden", my.outdegree=call("my.outdegree",dat=egomat)))

#Restricts the \code{outdegree} and \code{efficiency} to "EGO" and nodes with "P" in the name
index.egonet(egomat,index=c("outdegree","efficiency"),subset="P")

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ datagen }
