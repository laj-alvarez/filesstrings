#' Check if all elements are equal.
#'
#' If one argument is specified, check that all elements of that argument are
#' equal. If two arguments of equal length are specified, check equality of all
#' of their corresponding elements. If two arguments are specified, \code{a} of
#' length 1 and \code{b} of length greater than 1, check that all elements of
#' \emph{b} are equal to the element in a.
#'
#' @param a A vector
#' @param b A vector of length either 0, 1 or \code{length(a)}
#' @return \code{TRUE} if "equality of all" is satisfied (as detailed in
#'   "Description" above) and \code{FALSE} otherwise.
#' @examples
#' AllEqual(1, rep(1, 3))
#' AllEqual(2, 1:3)
#' AllEqual(1:4, 1:4)
#' AllEqual(1:4, c(1, 2, 3, 3))
#' AllEqual(rep(1, 10))
#' AllEqual(c(1, 88))
AllEqual <- function(a, b = NA) {
  if (is.na(b[1])) {
    return(length(unique(a)) == 1)
  } else {
    if (is.list(a) && !is.list(b)) b <- list(b)
    if (is.list(b) && !is.list(a)) a <- list(a)
    if (length(a) == 1) a <- rep(a, length(b))
    if (length(b) == 1) b <- rep(b, length(a))
    return(isTRUE(all.equal(a, b)))
  }
}

#' Group together close adjacent elements of a vector.
#'
#' Given a strictly increasing vector (each element is bigger than the last),
#' group together stretches of the vector where \emph{adjacent} elements are
#' separeted by at most some specified distance. Hence, each element in each
#' group has at least one other element in that group that is \emph{close} to
#' it. See the examples.
#' @param vec.ascending A strictly increasing numeric vector
#' @param max.gap The biggest allowable gap between adjacent elements for them
#'   to be considered part of the same \emph{group}.
#' @return A where each element is one group, as a numeric vector.
#' @examples
#' GroupClose(1:10, 1)
#' GroupClose(1:10, 0.5)
#' GroupClose(c(1, 2, 4, 10, 11, 14, 20, 25, 27), 3)
GroupClose <- function(vec.ascending, max.gap = 1) {
  lv <- length(vec.ascending)
  if (lv == 0) stop("vec.ascending must have length greater than zero.")
  test <- all(vec.ascending > dplyr::lag(vec.ascending), na.rm = TRUE)
  if (!test) stop("vec.ascending must be strictly increasing.")
  if (lv == 1) {
    return(list(vec.ascending))
  } else {
    gaps <- vec.ascending[2:lv] - vec.ascending[1:(lv-1)]
    big.gaps <- gaps > max.gap
    nbgaps <- sum(big.gaps)  # number of big (>10) gaps
    if (!nbgaps) {
      return(list(vec.ascending))
    } else {
      ends <- which(big.gaps)  # vertical end of lines
      group1 <- vec.ascending[1:ends[1]]
      lg <- list(group1)
      if (nbgaps == 1){
        lg[[2]] <- vec.ascending[(ends[1] + 1):lv]
      } else {
        for (i in 2:nbgaps){
          lg[[i]] <- vec.ascending[(ends[i - 1] + 1):ends[i]]
          ikeep <- i
        }
        lg[[ikeep + 1]] <- vec.ascending[(ends[nbgaps] + 1):lv]
      }
      return(lg)
    }
  }
}

#' Interleave two vectors.
#'
#' Given two vectors that differ in length by at most 1, interleave them into a
#' vector where every odd element is from the first vector and every even
#' element is from the second. Hence, every second element is from the same
#' original vector and every next element is from a different vector. This is
#' done in the natural order.
#' @param vec1 A vector. If the vectors are of different lengths, this must be
#'   the longer one.
#' @param vec2 A vector of either the same length as vec1 or 1 shorter than it.
#' @return A vector which is \code{vec1} and \code{vec2} interleaved.
#' @examples
#' Interleave(c("a", "b", "c"), c("x", "y", "z"))
#' Interleave(c("a", "b", "c", "d"), c("x", "y", "z"))
Interleave <- function(vec1, vec2) {
  l1 <- length(vec1)
  l2 <- length(vec2)
  if (l1 < 1 || l2 < 1) stop("Both vectors must have positive lengths.")
  if (! (l1 - l2) %in% 0:1) stop("vec1 must be either the same length as vec2 or one longer than it")
  ans <- 1:(l1 + l2)
  ans[seq(1, 2 * l1 - 1, 2)] <- vec1
  ans[seq(2, 2 * l2, 2)] <- vec2
  return(ans)
}

#' Get the last element of a list or vector.
#'
#' A shortcut for having to do \code{ll[[length(ll)]]} or \code{vv[length(vv)]}
#' where \code{ll} is a list and \code{vv} is a vector.
#'
#' @param listorvec A list or a vector.
#' @return The last element of \code{listorvec}
#' @examples
#' Last(1:8)
#' Last(list(1:3, 5, 6:2))
Last <- function(listorvec) {
  l <- length(listorvec)
  if (is.list(listorvec)) {
    return(listorvec[[l]])
  } else {
    return(listorvec[l])
  }
}

#' List of matrix rows or columns.
#'
#' From a matrix, create a list whose \eqn{i}th element is the \eqn{i}th row or
#' column of the matrix.
#' @param mat A matrix.
#' @examples
#' m <- matrix(1:6, nrow = 2)
#' print(m)
#' Mat2RowList(m)
#' Mat2ColList(m)
Mat2RowList <- function(mat) {
  Mat2ColList(t(mat))
}
#' @rdname Mat2RowList
Mat2ColList <- function(mat) {
  lapply(seq_len(ncol(mat)), function(i) mat[, i])
}

#' Stop or return NA
#'
#' @param stop \code{TRUE} if you want to stop with an error message, \code{FALSE} if you want to return NA
#' @param message The error message to display if \code{stop = TRUE}
StopOrNA <- function(stop, message = "") {
  if (stop) stop(message, call. = FALSE)
  NA
}

#' Ensure a file name has the intended extension
#'
#' Say you want to ensure a name is fit to be the name of a csv file. Then, if
#' the input doesn't end with ".csv", this function will tack ".csv" onto the
#' end of it.
#'
#' @param file.name The intended file name
#' @param ext The intended file extension (with or without the ".")
#'
#' @return A string: the file name in your intended form.
#'
#' @examples
#' MakeExtName("abc.csv", "csv")
#' MakeExtName("abc", "csv")
#' @export
MakeExtName <- function(string, ext) {
  stopifnot(is.character(string) && length(string) == 1)
  without.dot <- TrimAnything(ext, ".", side = "left")
  end.pattern <- str_c("\\.", without.dot, "$")
  ifelse(grepl(end.pattern, string), string, str_c(string, ".", without.dot))
}
