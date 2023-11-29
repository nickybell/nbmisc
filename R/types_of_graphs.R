#' Plotting function for types of graphs matrix
#'
#' @return A ggplot2 object.
#' @noRd
ggfun_graphs <- function() {
  p <-
    ggplot2::ggplot() +
    ggplot2::geom_hline(yintercept = 0) +
    ggplot2::geom_vline(xintercept = -.5) +
    ggplot2::geom_vline(xintercept = .5) +
    ggplot2::scale_x_continuous(limits = c(-1.5, 1.5), labels = c("Discrete", "Continuous", "Mixed"), breaks = c(-1, 0, 1), expand = c(0,0)) +
    ggplot2::scale_y_continuous(limits = c(-1, 1), labels = c("Bivariate", "Univariate\n(counting)"), breaks = c(-.5, .5), expand = c(0,0)) +
    ggplot2::labs(y = "Number of Variables",
                  x = "Type of Variables",
                  caption = "* For multivariate (3+ variables) graphs, use an aesthetic mapping or facets.") +
    ggplot2::annotate("text", x = -1, y = .5, label = "Bar graph") +
    ggplot2::annotate("text", x = 0, y = .5, label = "Histogram") +
    ggplot2::annotate("text", x = -1, y = -.5, label = paste("Bar graph", "Heatmap (2D)", sep = "\n")) +
    ggplot2::annotate("text", x = 0, y = -.5, label = paste("Scatterplot", "Line graph", sep = "\n")) +
    ggplot2::annotate("text", x = 1, y = -.5, label = paste("Box and whisker plot", "Violin plot", sep = "\n")) +
    ggplot2::geom_rect(ggplot2::aes(xmin = .5, xmax = 1.5, ymin = 0, ymax = 1), fill = "gray") +
    ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 90, hjust = .5),
                   axis.ticks = ggplot2::element_blank(),
                   panel.grid = ggplot2::element_blank(),
                   plot.caption = ggplot2::element_text(face = "bold", size = 11))
  p
}

#' Generate plot of types of graphs matrix
#'
#' @param code If yes (`"y"`), the function will print the code to generate the ggplot2 object in the console. If no (`"n"`), the function will return a ggplot2 object.
#'
#' @return If `code` is `"n"`, a ggplot2 object. If `code` is `"y"`, nothing (the code is printed in the console).
#' @export
types_of_graphs <- function(code = c("n", "y")) {
  code <- rlang::arg_match(code)
  switch(
    code,
    n = ggfun_graphs(),
    y = ggfun_graphs
  )
}
