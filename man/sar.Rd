\name{sar}
\alias{sar}
\title{Standardized abnormal returns (SAR) in long-horizon event studies}
\description{
  \code{sar} implements the calculation of standardized abnormal returns.

Standardized abnormal returns are defined as the excess event-return relative to a specific  return of a matching control firm, and the remaining result subsequently divided by the standard variation of this excess return series: \eqn{SAR_{it} = \frac{r_{event} - r_{control}}{sd_{event-control}}}, with log-returns \eqn{r_{event}} and \eqn{r_{control}}. The matching control-return should be a single firm return-series and not portfolio-returns.

}
\usage{
sar(event, control, logret="FALSE")
}
\arguments{
  \item{event}{a vector or time series of returns.}

  \item{control}{a vector or time series of returns.}

    \item{logret}{An object of class \code{"\link{logical}"}: If \code{logret} is FALSE, then both return-series 'event' and 'control' will be converted into log-returns before calculating standardized abnormal returns. Set \code{logret} to TRUE, if both return-series are already log-returns.}

}

\value{
  \code{sar} returns a vector of class \code{"\link{numeric}"}:

  \item{SAR}{Vector containing standardized abnormal returns.}
}


\references{
  Dutta, A., Knif, J., Kolari, J.W., Pynnonen, S. (2018):
  A robust and powerful test of abnormal stock returns in long-horizon event studies.
  \emph{Journal of Empirical Finance}, \bold{47}, p. 1-24.
  \doi{10.1016/j.jempfin.2018.02.004}.
}

\examples{
## load demo_returns
## calculate mean of daily standardized abnormal returns from 2015-01-01 to 2017-12-31
## with E.ON AG as event firm and RWE AG as control firm.
data(demo_returns)
SAR <- sar(event=demo_returns$EON, control=demo_returns$RWE, logret=FALSE)
mean(SAR)
}
