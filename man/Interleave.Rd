% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{Interleave}
\alias{Interleave}
\title{Interleave two vectors.}
\usage{
Interleave(vec1, vec2)
}
\arguments{
\item{vec1}{A vector. If the vectors are of different lengths, this must be
the longer one.}

\item{vec2}{A vector of either the same length as vec1 or 1 shorter than it.}
}
\value{
A vector which is \code{vec1} and \code{vec2} interleaved.
}
\description{
Given two vectors that differ in length by at most 1, interleave them into a
vector where every odd element is from the first vector and every even
element is from the second. Hence, every second element is from the same
original vector and every next element is from a different vector. This is
done in the natural order.
}
\examples{
Interleave(c("a", "b", "c"), c("x", "y", "z"))
Interleave(c("a", "b", "c", "d"), c("x", "y", "z"))
}

