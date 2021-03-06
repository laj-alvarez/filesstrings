% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strings.R
\name{ExtendCharVec}
\alias{ExtendCharVec}
\title{Pad a character vector with empty strings.}
\usage{
ExtendCharVec(char.vec, extend.by = NA, length.out = NA)
}
\arguments{
\item{char.vec}{A character vector. The thing you wish to expand.}

\item{extend.by}{A non-negative integer. By how much do you wish to extend
the vector?}

\item{length.out}{A positive integer. How long do you want the output vector
to be?}
}
\value{
A character vector.
}
\description{
Extend a character vector by appending empty strings at the end.
}
\examples{
ExtendCharVec(1:5, extend.by = 2)
ExtendCharVec(c("a", "b"), length.out = 10)
}

