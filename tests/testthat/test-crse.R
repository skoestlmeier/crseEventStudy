context('functions')

test_that('monoSummary', {
  skip_on_cran()
  tmp <- monoSummary(demo_returns, bootstrapRep = 1, wolakRep = 1, block_length = 10)

  # test for dimension of output
  expect_equal(dim(tmp),as.integer(c(1,9)))

  # round up negative number
  expect_equal(as.numeric(specify_decimal(-3.45678,2)), -3.46)

  expect_equal(tmp$TestOnePvalueWolak, 0)
  expect_equal(tmp$TestTwoPvalueWolak, 0.9801157, tolerance=1e-7)

  # test that all probability values are within the range [0,1]
  expect_gte(tmp$TestOnePvalueWolak,expected = 0)
  expect_gte(tmp$TestTwoPvalueWolak,expected = 0)

  # test that all probability values are within the range [0,1]
  expect_gte(tmp[1,1], expected = 0)
  expect_gte(tmp[1,2], expected = 0)
  expect_gte(tmp[1,3], expected = 0)
  expect_gte(tmp[1,4], expected = 0)
  expect_gte(tmp[1,5], expected = 0)
  expect_gte(tmp[1,6], expected = 0)
  expect_gte(tmp[1,7], expected = 0)
  expect_gte(tmp[1,8], expected = 0)
  expect_gte(tmp[1,9], expected = 0)

  expect_lte(tmp[1,1], expected = 1)
  expect_lte(tmp[1,2], expected = 1)
  expect_lte(tmp[1,3], expected = 1)
  expect_lte(tmp[1,4], expected = 1)
  expect_lte(tmp[1,5], expected = 1)
  expect_lte(tmp[1,6], expected = 1)
  expect_lte(tmp[1,7], expected = 1)
  expect_lte(tmp[1,8], expected = 1)
  expect_lte(tmp[1,9], expected = 1)
})
