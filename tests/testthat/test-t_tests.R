test_that("code prints when code argument is yes", {
  expect_identical(types_of_t_tests(code = "y"), ggfun_t_tests)
})

test_that("ggplot object returned when code argument is no", {
  expect_true(ggplot2::is_ggplot(types_of_t_tests()))
})
