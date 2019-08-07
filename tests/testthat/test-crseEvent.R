context('functions')

test_that('crseEvent', {
  tmp <- crseEvent(demo_share_repurchases, abnr = "ars", cluster1 = "date", cluster2 = "code")

  expect_error(crseEvent(abnr = "ars", cluster1 = "date"))
  expect_error(crseEvent(data = demo_share_repurchases, abnr = "ars", cluster1 = "date", na.rm = "FALSE"))
  expect_error(crseEvent(data = demo_share_repurchases, abnr = "ars", cluster1 = "date", na.replace = "0"))
  
  test <- as.data.frame(matrix(c(NA, NA, 1, 1), ncol = 2))
  colnames(test) <- c("first", "second")
  expect_error(crseEvent(data = test, abnr = "first", cluster1 = "second", na.rm = TRUE))
  
  expect_warning(crseEvent(data = demo_share_repurchases, abnr = "ars", cluster1 = "date", na.rm = FALSE, na.replace = 0))
  
  expect_null(print(tmp))
  
  expect_equal(dim(tmp),NULL)
  expect_equal(class(tmp), c("crse", "list"))
  expect_equal(length(tmp), 18)

  expect_equal(tmp$N, 2340)
  expect_equal(tmp$unique.cl1, 145)
  expect_equal(tmp$cluster1, "date")
  expect_equal(tmp$cluster2, "code")
  expect_equal(tmp$tcl2, -0.2037347, tolerance=1e-7)
  expect_equal(tmp$var.cl1[1,1], 0.001883136, tolerance=1e-7)
  expect_equal(tmp$mean.abnormal.ret, -0.006964425, tolerance=1e-7)

  # test that all probability values are within the range [0,1]
  expect_gte(tmp$p.val.nonclustered, expected = 0)
  expect_gte(tmp$p.val.one.clustered,expected = 0)
  expect_lte(tmp$p.val.nonclustered, expected = 1)
  expect_lte(tmp$p.val.one.clustered,expected = 1)

})
