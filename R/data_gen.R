# This script exposes convenience functions for generating data

#' Build a Feature's Lead Time
#'
#' The most granular unit of software delivery speed is the lead time of a single pull request. There are four
#' component measurements of a PR's lead time, the sum of which is the aggregate lead time for that PR. The four
#' components are:
#'   1. Development -- the length of time of development (i.e. discovery work as well as programming)
#'   2. Pull Request - the length of time between opening of the pull request and merging it into the master branch
#'   3. Build - the length of time alloted to automated building of a deployable artifact
#'   4. Release -- the length of time between a feature being ready for development and it's availability in every
#'      environment
#'
#'
#' @param dev numeric vector of length n
#' @param pr numeric vector of length n
#' @param build numeric vector of length n
#' @param release numeric vector of length n
#'
#' @export
#' @return list of length 4 with dev, pr, build, and release times
build_feature_lead_time <- function(dev, pr, build, release) {
  list(
    "dev" = dev,
    "pr" = pr,
    "build" = build,
    "release" = release
  )
}

#' Closure helper for random generators
#'
#' @param n number of samples
#' @param fnc random generator to use
#' @param ... passed to generator function
#'
#' @return
#' @export
#'
#' @examples
#' # Calling .rnorm() is equivalent to calling rnorm(n, mean = 3, sd = 10)
#' .rnorm <- rgen(10, rnorm, mean = 3, sd = 10)
rgen <- function(n, fnc, ...) {
  function() {
    fnc(n, ...)
  }
}

