\name{demo_returns}
\alias{demo_returns}
\title{Total returns for E.ON AG and RWE AG}
\description{
  \code{demo_returns} is a sample of daily total returns, i.e. including dividends, for the german electric utility companies E.ON AG (ISIN: DE000ENAG999) and RWE AG (ISIN: DE0007037129). The return series for the Frankfurt stock exchange starts at 2015-01-01 with end at 2017-12-31 and has 760 daily return observations which are denoted in Euro. \code{date} is the trading-day, for which return observations are available ind the format "yyyy-mm-dd". \code{EON} denotes the return series for E.ON AG and \code{RWE} denotes the return series for RWE AG.
}
\usage{
data(demo_returns)
}

\examples{
## load demo_returns
data(demo_returns)

## calculate the mean total return E.ON AG in the year 2016.
## get the appropriate rows for the whole year 2016
dates <- which("2016-01-01" <= demo_returns$date & demo_returns$date <= "2016-12-31")

## calculate mean return
mean(demo_returns$EON[dates])
}
