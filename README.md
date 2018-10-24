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
The method `crseEvent` is based on abnormal standardized returns and offers two implementations. Standardized returns are defined as \eqn{sr_{it} = \frac{r_{it}}{s_{it}}} where \eqn{s_{it}} is a standard deviation estimator of log returns \eqn{r_{it}}:

\strong{Use of Abnormal standardized returns (ASR)}

Abnormal standardized returns are defined as \eqn{ASR_{it} = sr_{it} - sr_{ci,t}}, where \eqn{sr_{ci,t}} is the standardized return of the matching control firm or the average of standardized returns of the matching control portfolio.

\strong{Use of Continuously compounded abnormal returns (CCAR)}

Continuously compounded abnormal returns are defined as \eqn{CCAR{it} = r_{it} - r_{ci,t}}, where \eqn{r_{it} = log(1 + R_{it}} is the event month \eqn{t} continuously compounded return (i.e., log return) of event stock \eqn{i}, and \eqn{r_{ci,t}} is the continuously compounded return of the control firm.

Contributing
------------
Constributions in form of feedback, comments, code, bug reports or pull requests are most welcome. How to contribute:

* Issues, bug reports, or desired expansions: File a GitHub issue.
* Fork the source code, modify it, and issue a pull request through the project GitHub page.

Please read the [contribution guidelines](CONTRIBUTING.md) on how to contribute to this R-package.

Code of conduct
------------

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
