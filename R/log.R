# Utility functions

INFO_PREFIX <-  "INFO - "
WARN_PREFIX <- "WARN - "
ERR_PREFIX <- "ERROR - "

#' Standard formatting for log messages
#'
#' @param msg
#' @param ...
#' @param prefix
#'
#' @return
#'
#' @examples
fmtlog <- function(msg, ..., prefix) {
  current_utc_time <- format(Sys.time(), tz="UTC")
  sprintf(paste0(prefix, current_utc_time, ": ", msg), ...)
}

#' Standard info log
#'
#' @param msg
#' @param ...
#'
#' @return
#'
#' @examples
info <- function(msg, ...) {
  fmtlog(msg, ..., prefix=INFO_PREFIX)
}

#' Standard warn log
#'
#' @param msg
#' @param ...
#'
#' @return
#'
#' @examples
warn <- function(msg, ...) {
  fmtlog(msg, ..., prefix=WARN_PREFIX)
}

#' Standard error log
#'
#' @param msg
#' @param ...
#'
#' @return
#'
#' @examples
error <- function(msg, ...) {
  fmtlog(msg, ..., prefix=ERR_PREFIX)
}
