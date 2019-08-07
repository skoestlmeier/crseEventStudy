context('functions')

test_that('check_data', {
  
  test <- matrix()
  expect_error(check_data(test, 1))
})
