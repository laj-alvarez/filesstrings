% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strings.R
\name{StrElemsPasted}
\alias{StrElemsPasted}
\title{Extract bits of a string and paste them together}
\usage{
StrElemsPasted(string, elem.indices)
}
\arguments{
\item{string}{A string.}

\item{indices}{A numeric vector of positive integers detailing the indices of the characters of \code{string} that we wish to paste together.}
}
\value{
A string.
}
\description{
Extract characters - specified by their indices - from a string and paste them together
}
\examples{
StrElemsPasted("abcdef", c(2, 5:6))
}

