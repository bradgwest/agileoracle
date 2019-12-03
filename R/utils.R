# Common utilities

#' Convert a time unit to seconds
#'
#' @param t  time magnitude
#' @param unit time unit
#'
#' @return
#' @export
#'
#' @examples
seconds <- function(t, unit=NULL) {
  if (is.null(unit)) {
    return(t)
  }

  if (unit == "days") {
    return(t * 24 * 3600)
  }

  if (unit == "hours") {
    return(t * 3600)
  }

  stop(sprintf("unsupported unit: %s", unit))
}

#' Convert a time unit to hours
#'
#' @param t
#' @param unit
#'
#' @return
#' @export
#'
#' @examples
hours <- function(t, unit = NULL) {
  if (is.null(unit)) {
    return(t)
  }

  if (unit == "days") {
    return(t * 24)
  }

  stop(sprintf("unsupported unit: %s", unit))
}

#' Convert a time unit to days
#'
#' @param t time magnitude
#' @param unit time unit
#'
#' @return
#' @export
#'
#' @examples
days <- function(t, unit=NULL) {
  if (is.null(unit)) {
    return(t)
  }

  if (unit == "seconds") {
    return(t / 3600 / 24)
  }

  if (unit == "hours") {
    return(t / 24)
  }

  stop(sprintf("unsupported unit: %s", unit))
}
