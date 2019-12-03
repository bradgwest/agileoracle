test_that("seconds function is correct", {
  expect_equal(seconds(2, "days"), 172800)
  expect_equal(seconds(2, "hours"), 7200)
  expect_condition(seconds(2, "minutes"), regexp = ".*unsupported.*")
})

test_that("days function is correct", {
  expect_equal(days(3600, "seconds"), 1/24)
  expect_equal(days(24, "hours"), 1)
  expect_condition(days(2, "minutes"), regexp = ".*unsupported.*")
})
