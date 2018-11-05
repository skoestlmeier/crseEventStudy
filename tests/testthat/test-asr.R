context('functions')

test_that('asr', {
  tmp <- asr(event = demo_returns$EON, control = demo_returns$RWE, logret = FALSE)

  expect_equal(dim(tmp),NULL)
  expect_equal(class(tmp), c("numeric"))
  expect_equal(length(tmp), 760)

  expect_equal(mean(tmp), -0.0004806957, tolerance=1e-7)
  expect_equal(min(tmp), -5.344941, tolerance=1e-7)
  expect_equal(max(tmp), 4.821122, tolerance=1e-7)
  expect_equal(sd(tmp), 0.7438619, tolerance=1e-7)
})
