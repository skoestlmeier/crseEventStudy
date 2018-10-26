context('functions')

test_that('crseEvent', {
  tmp <- crseEvent(demo_returns, cluster1 = "date")

  # test for dimension of output
  expect_equal(dim(tmp),NULL)
  expect_equal(class(tmp), c("crse", "list"))

  expect_equal(tmp$N, 2340)
  expect_equal(tmp$unique.cl1, 145)
  expect_equal(tmp$cluster1, "date")
  expect_equal(tmp$tcl2, NA)
  expect_equal(tmp$mean.abnormal.ret, -0.006964425, tolerance=1e-7)

  # test that all probability values are within the range [0,1]
  expect_gte(tmp$p.val.nonclustered, expected = 0)
  expect_gte(tmp$p.val.one.clustered,expected = 0)
})
