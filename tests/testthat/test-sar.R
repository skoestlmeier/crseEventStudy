context('functions')

test_that('sar', {
  tmp <- sar(event = demo_returns$EON, control = demo_returns$RWE, logret = FALSE)

  expect_equal(dim(tmp),NULL)
  expect_equal(class(tmp), c("numeric"))
  expect_equal(length(tmp), 760)

  expect_equal(mean(tmp), 0.006870196, tolerance=1e-7)
  expect_equal(min(tmp), -7.856651, tolerance=1e-7)
  expect_equal(max(tmp), 7.109707, tolerance=1e-7)
  expect_equal(sd(tmp), 1, tolerance=1e-7)
})
