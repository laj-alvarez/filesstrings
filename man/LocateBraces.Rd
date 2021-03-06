% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strings.R
\name{LocateBraces}
\alias{LocateBraces}
\title{Locate the braces in a string.}
\usage{
LocateBraces(string)
}
\arguments{
\item{string}{A character vector}
}
\value{
A list of data frames (\link[tibble]{tibble}s), one for each member of the string character
  vector. Each data frame has a "position" and "brace" column which give the
  positions and types of braces in the given string.
}
\description{
Give the positions of (, ), [, ], \{, and \} within a string.
}
\examples{
LocateBraces(c("a{](kkj)})", "ab(]c{}"))
}

