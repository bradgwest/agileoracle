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
