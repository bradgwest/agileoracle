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
    return(days_to_seconds(t))
  }

  if (unit == "hours") {
    return(hours_to_seconds(t))
  }

  stop(sprintf("%s is not a valid unit", unit))
}

#' Convert days to seconds
#'
#' @param t
#'
#' @return
#'
#' @examples
days_to_seconds <- function(t) {
  t * 24 * 3600
}

#' Convert hours to seconds
#'
#' @param t
#'
#' @return
#' @export
#'
#' @examples
hours_to_seconds <- function(t) {
  t * 3600
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
    return(t / 3600 / 24)
  }

  if (unit == "hours") {
    return(t * 24)
  }

  stop(sprintf("%s is not a valid unit", unit))
}
