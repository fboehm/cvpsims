vec <- 1:5

test_that("correct vector entry is outputted", {
  expect_equal(get_fitted(index = 3, vec = vec), 3)
  expect_equal(get_fitted(index = 5, vec = vec), 5)
})

test_that("input checking works", {
  expect_error(get_fitted(index = 6, vec = vec))
  expect_error(get_fitted(index = 0, vec = vec))
})
