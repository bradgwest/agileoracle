# This script exposes functions for visualizing data

#' Standard ggplot theme for the agile oracle package. It is thin wrapper around ggplot::theme_minimal().
#'
#' @return
#' @export
#'
#' @examples
#' ggplot2::ggplot(data = mtcars, mapping = ggplot2::aes(x = disp, y = mpg)) +
#'   ggplot2::geom_point() +
#'   theme_oracle() +
#'   ggplot2::labs(title = "My plot")
theme_oracle <- function() {
  # Start with minimal theme, and build off of it
  ggplot2::theme_minimal() +
    ggplot2::theme(
      complete = FALSE,  # We're building off of the minimal theme and don't want elements inheriting from blank
      plot.title = ggplot2::element_text(
        hjust = 0.5  # Center the title
      ),
      plot.subtitle = ggplot2::element_text(
        # subtitle is centered too
        hjust = 0.5,
        vjust = 0
      )
  )
}

#' Plot a single distribution
#'
#' @param t time measurements
#' @param geom Geom to use
#' @param ... Args to pass to geom function
#'
#' @return
#'
#' @examples
plot_dist <- function(t, geom, ...) {
  ggplot2::ggplot(data = data.frame(t), mapping = ggplot2::aes(x = t)) +
    geom(...) +
    theme_oracle()
}

#' Visualize a feature's distributions
#'
#' @param feature list of 4 feature components
#'
#' @return
#' @export
#'
#' @examples
plot_feature_distribution <- function(features) {
  plots <- lapply(features, plot_dist, geom = ggplot2::geom_histogram, bins = 50)
  # Add some titles
  for (i in 1:length(plots)) {
    plots[[i]] <- plots[[i]] + ggplot2::labs(title = names(features[i]))
  }
  # Arrange like mfrow(par = c())
  gridExtra::grid.arrange(grobs = plots, ncol = ceiling(length(plots)/2))
}
