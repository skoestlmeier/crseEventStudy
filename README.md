# monotonicity

Overview
--------
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/crseEventStudy)](https://cran.r-project.org/package=crseEventStudy)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build Status](https://travis-ci.org/skoestlmeier/crseEventStudy.svg?branch=master)](https://travis-ci.org/skoestlmeier/crseEventStudy)
[![Build status](https://ci.appveyor.com/api/projects/status/nsrpduvdn28gf78r?svg=true)](https://ci.appveyor.com/project/skoestlmeier/crseEventStudy)
[![codecov](https://codecov.io/gh/skoestlmeier/crseEventStudy/branch/master/graph/badge.svg)](https://codecov.io/gh/skoestlmeier/crseEventStudy)
[![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/crseEventStudy?color=blue)](https://CRAN.R-project.org/package=crseEventStudy)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

`crseEventStudy` is an R package providing a standardized test for abnormal returns in long-horizon event studies that takes into accoutncross-sectional correltaion, autocorrelation, and heteroskedasticity of stock returns. The test is proposed in the paper *[A robust and powerful test of abnormal stock returns in long-horizon event studies](https://doi.org/10.1016/j.jempfin.2018.02.004)* by Anupam Dutta, Johan Knif, James W. Kolari and Seppo Pynnonen.

### Key Features
Functions for crseEventStudy for testing abnormal stock returns in long-horizon event studies:

* Wolak Test
* Up and Down Test
* MR (Monotonic Relationship) Test
* Weak monotonicity test using Bonferroni bounds
* Stationary Bootstrap Simulation

Installation
------------
```r
# The easiest way to install crseEventStudy is to download via CRAN
install.packages("crseEventStudy")

# Alternatively, you can install the development version from GitHub
# install.packages("devtools")
devtools::install_github("skoestlmeier/crseEventStudy")
```
Notes
-----
The monotonicity tests provided by this package are mostly based on simulated bootstrap samples. The results may therefore slightly differ for repeated tests.

For an estimation of the variation of the results, we exemplarily run the MR (Monotonic Relationship) Test provided by the function `monoRelation` 1,000 times with identical input data. We observed the following results for the mean studentised p-value, using the provided R package and in comparison Andrew Pattons original Matlab code:


| Software | Mean | Minimum | Maximum | Standard Deviation
| --- | --- | --- | --- | ---|
| Matlab | 0.032 | 0.014 | 0.047 | 0.0057
| R | 0.031 | 0.018 | 0.048 | 0.0064

In fact, the observed variation seems to be acceptable and should not affect any decision based on the returning p-value, when using the recommended number of 1,000 bootstrap replications.


Contributing
------------
Constributions in form of feedback, comments, code, bug reports or pull requests are most welcome. How to contribute:

* Issues, bug reports, or desired expansions: File a GitHub issue.
* Fork the source code, modify it, and issue a pull request through the project GitHub page.

Please read the [contribution guidelines](CONTRIBUTING.md) on how to contribute to this R-package.

Code of conduct
------------

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
