# This script exposes convenience functions for generating data

#' Generate a Feature's Lead Time
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
#' @param dev numeric vector. Development time in seconds
#' @param pr numeric vector. Pull request time in seconds
#' @param build numeric vector. Build time in seconds
#' @param release numeric vector. Release time in seconds
#'
#' @return list of length 4 with dev, pr, build, and release times
#' @export
gen_feature_lead_time <- function(dev, pr, build, release) {
  lead_time <- list(
    "dev" = dev,
    "pr" = pr,
    "build" = build,
    "release" = release
  )
  if (length(unique(lapply(lead_time, length))) != 1) {
    stop("`gen_feature_lead_time` takes vectors of equal length")
  }
  lead_time
}
