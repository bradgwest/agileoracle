# Utility functions

INFO_PREFIX <-  "INFO: "
WARN_PREFIX <- "WARN: "
ERR_PREFIX <- "ERROR: "

fmtlog <- function(msg, ..., prefix) {
  sprintf(paste0(prefix, msg), ...)
}

info <- function(msg, ...) {
  fmtlog(msg, ..., INFO_PREFIX)
}

warn <- function(msg, ...) {
  fmtlog(msg, ..., WARN_PREFIX)
}

error <- function(msg, ...) {
  fmtlog(msg, ..., ERR_PREFIX)
}
