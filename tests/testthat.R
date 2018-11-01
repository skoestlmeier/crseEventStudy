## load dependencies
library(testthat)
library(crseEventStudy)

## test package separated with filter due to limited Travis-CI build time
test_check('crseEventStudy', filter = "asr")
test_check('crseEventStudy', filter = "crseEvent")
test_check('crseEventStudy', filter = "sar")
