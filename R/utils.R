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
seconds <- function(t, unit=c("hours", "days")) {
  if (length(unit) > 1) {
    warning(sprintf("unit not specified, using %s", unit[1]))
    unit = unit[1]
  }

  if (unit == "days") {
    return(t * 24 * 3600)
  }

  if (unit == "hours") {
    return(t * 3600)
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
days <- function(t, unit=c("hours", "seconds")) {
  if (unit == "seconds") {
    return(t / (3600 * 24))
  }

  if (unit == "hours") {
    return(t / 24)
  }

  stop(sprintf("unsupported unit: %s", unit))
}
