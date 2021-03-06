% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{Last}
\alias{Last}
\title{Get the last element of a list or vector.}
\usage{
Last(listorvec)
}
\arguments{
\item{listorvec}{A list or a vector.}
}
\value{
The last element of \code{listorvec}
}
\description{
A shortcut for having to do \code{ll[[length(ll)]]} or \code{vv[length(vv)]}
where \code{ll} is a list and \code{vv} is a vector.
}
\examples{
Last(1:8)
Last(list(1:3, 5, 6:2))
}

