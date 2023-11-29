#' Plotting function for types of graphs matrix
#'
#' @return A ggplot2 object.
#' @noRd
ggfun_t_tests <- function() {
  p <-
    ggplot2::ggplot() +
    ggplot2::geom_hline(yintercept = 0) +
    ggplot2::geom_vline(xintercept = 0) +
    ggplot2::scale_x_continuous(limits = c(-1, 1), labels = c("Greater than/less than", "Different"), breaks = c(-.5,.5), expand = c(0,0)) +
    ggplot2::scale_y_continuous(limits = c(-1, 1), labels = c("Two Groups", "One Group"), breaks = c(-.5, .5), expand = c(0,0)) +
    ggplot2::labs(y = "Number of Groups",
                  x = "Type of Hypothesis",
                  caption = "Note: When weighting is not required, set \"weights = NULL\" or \"formula = variable ~ group_var\".") +
    ggplot2::annotate("text", x = -.5, y = .5, label = "One-sample, one-tailed t-test\n\nweighted_ttest(data = dataframe,\nx = variable,\nmu = .5,\nweights = weight_var,\nalternative = \"greater\")") +
    ggplot2::annotate("text", x = .5, y = .5, label = "One-sample, two-tailed t-test\n\nweighted_ttest(data = dataframe,\nx = variable,\nmu = .5,\nweights = weight_var)") +
    ggplot2::annotate("text", x = -.5, y = -.5, label = "Two-sample, one-tailed t-test\n\nweighted_ttest(\nformula = variable ~ group_var +\nweight_var,\ndata = dataframe,\nalternative = \"less\")") +
    ggplot2::annotate("text", x = .5, y = -.5, label = "Two-sample, two-tailed t-test\n\nweighted_ttest(\nformula = variable ~ group_var +\nweight_var,\ndata = dataframe)") +
    ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 90, hjust = .5, size = 12),
                   axis.text.x = ggplot2::element_text(size = 12),
                   axis.title = ggplot2::element_text(face = "bold"),
                   axis.ticks = ggplot2::element_blank(),
                   panel.grid = ggplot2::element_blank(),
                   plot.caption = ggplot2::element_text(size = 10))
  p
}

#' Generate plot of types of graphs matrix
#'
#' @param code If yes (`"y"`), the function will print the code to generate the ggplot2 object in the console. If no (`"n"`), the function will return a ggplot2 object.
#'
#' @return If `code` is `"n"`, a ggplot2 object. If `code` is `"y"`, nothing (the code is printed in the console).
#' @export
types_of_t_tests <- function(code = c("n", "y")) {
  code <- rlang::arg_match(code)
  switch(
    code,
    n = ggfun_t_tests(),
    y = ggfun_t_tests
  )
}
