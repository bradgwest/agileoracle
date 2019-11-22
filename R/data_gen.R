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
#' @param dev function that takes a single argument, n, and returns a numeric vector of length n
#' @param pr function that takes a single argument, n, and returns a numeric vector of length n
#' @param build function that takes a single argument, n, and returns a numeric vector of length n
#' @param release function that takes a single argument, n, and returns a numeric vector of length n
#' @param n numeric vec of length 1
#'
#' @export
#' @return list of length 4 with dev, pr, build, and release times
build_feature_lead_time <- function(dev, pr, build, release, n=NULL) {
  if (length(n) != 1) {stop("`n` must be length 1")}
  list(
    "dev" = dev(n),
    "pr" = pr(n),
    "build" = build(n),
    "release" = release(n)
  )
}

#' Closure helper of random generators
#'
#' @param n number of samples
#' @param fnc random generator to use
#' @param ... passed to generator function
#'
#' @return
#' @export
#'
#' @examples
.rgen <- function(fnc) {
  function(n, ...) {
    function() {
      fnc(n, ...)
    }
  }
}

.rnorm <- .rgen(rnorm)
.rgamma <- .rgen(rgamma)
# plot(data.frame(x=seq(0, 10, 0.1), y = dgamma(seq(0, 10, 0.1), shape = 2)))

