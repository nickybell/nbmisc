test_that("code prints when code argument is yes", {
  expect_identical(types_of_graphs(code = "y"), ggfun_graphs)
})

test_that("ggplot object returned when code argument is no", {
  expect_true(ggplot2::is_ggplot(types_of_graphs()))
})
