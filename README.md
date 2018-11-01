# crseEventStudy

Overview
--------
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/crseEventStudy)](https://cran.r-project.org/package=crseEventStudy)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build Status](https://travis-ci.org/skoestlmeier/crseEventStudy.svg?branch=master)](https://travis-ci.org/skoestlmeier/crseEventStudy)
[![Build status](https://ci.appveyor.com/api/projects/status/nsrpduvdn28gf78r?svg=true)](https://ci.appveyor.com/project/skoestlmeier/crseEventStudy)
[![codecov](https://codecov.io/gh/skoestlmeier/crseEventStudy/branch/master/graph/badge.svg)](https://codecov.io/gh/skoestlmeier/crseEventStudy)
[![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/crseEventStudy?color=blue)](https://CRAN.R-project.org/package=crseEventStudy)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

`crseEventStudy` is an R package providing a standardized test for abnormal returns in long-horizon event studies that takes into account the cross-sectional correlation, autocorrelation, and heteroskedasticity of stock returns. The test is proposed in the paper *[A robust and powerful test of abnormal stock returns in long-horizon event studies](https://doi.org/10.1016/j.jempfin.2018.02.004)* by Anupam Dutta, Johan Knif, James W. Kolari and Seppo Pynnonen (2018, JempFin).

### Key Features
Functions of `crseEventStudy` for testing abnormal stock returns in long-horizon event studies:

* crseEvent

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
Standardized returns are defined as the ratio of log-returns and their standard deviation estimator. The method `crseEvent` is based on abnormal standardized returns and offers three implementations:

* **Abnormal standardized returns (ASR)**

  Abnormal standardized returns are defined as the excess standardized returns relative to the standardized return of a matching control firm or relative to the average of standardized returns of a matching control portfolio.

* **Standardized abnormal returns (SAR)**

  Standardized abnormal returns are defined as the excess event-return relative to a specific  return of a matching control firm, and the remaining result subsequently divided by the standard variation of this excess return series. As stated on p. 3f. in [Dutta et al. (2018, JempFin)](https://doi.org/10.1016/j.jempfin.2018.02.004), the matching control-return should be a single firm return-series and not be a portfolio-return.

* **Continuously compounded abnormal returns (CCAR)**

  Continuously compounded abnormal returns first consider their relative performance. First, the monthly continuously compounded return (i.e., log return) of the event stock is subtracted by the continuously compounded return of the control firm (or control portfolio). Second, this resulting excess return is divided by a robust standard deviation estimator for the excess return.

Contributing
------------
Constributions in form of feedback, comments, code, bug reports or pull requests are most welcome. How to contribute:

* Issues, bug reports, or desired expansions: File a GitHub issue.
* Fork the source code, modify it, and issue a pull request through the project GitHub page.

Please read the [contribution guidelines](CONTRIBUTING.md) on how to contribute to this R-package.

Code of conduct
------------

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
