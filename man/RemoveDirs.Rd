% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/files.R
\name{RemoveDirs}
\alias{RemoveDirs}
\title{Remove directories.}
\usage{
RemoveDirs(dirs)
}
\arguments{
\item{dir.names}{The names of the directories, specified via relative or
absolute paths.}
}
\value{
Logical vector with \code{TRUE} for each success and \code{FALSE} for
  failures.
}
\description{
Delete directories and all of their contents (can just be one directory).
}
\examples{
RemoveDirs("mydir1", "mydir2")
RemoveDirs("/home/mydir")
}

