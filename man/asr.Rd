\name{asr}
\alias{asr}
\title{Abnormal standardized returns (ASR) in long-horizon event studies}
\description{
  \code{asr} implements the calculation of abnormal standardized returns.

Abnormal standardized returns are defined as the excess standardized returns relative to the standardized return of a matching control firm or relative to the average of standardized returns of a matching control portfolio. Standardized returns are defined as \eqn{sr_{it} = \frac{r_{it}}{s_{it}}} where \eqn{s_{it}} is a standard deviation estimator of log returns \eqn{r_{it}}.

}
\usage{
asr(event, control, logret = FALSE)
}
\arguments{
  \item{event}{a vector or time series of returns.}

  \item{control}{a vector or time series of returns.}

  \item{logret}{An object of class \code{"\link{logical}"}: If \code{logret} is FALSE, then both return-series 'event' and 'control' will be converted into log-returns before calculating abnormal standardized returns. Set \code{logret} to TRUE, if both return-series are already log-returns.}
}

\value{
  \code{asr} returns a vector of class \code{"\link{numeric}"}:

  \item{ASR}{Vector containing abnormal standardized returns.}
}


\references{
  Dutta, A., Knif, J., Kolari, J.W., Pynnonen, S. (2018):
  A robust and powerful test of abnormal stock returns in long-horizon event studies.
  \emph{Journal of Empirical Finance}, \bold{47}, p. 1-24.
  \doi{10.1016/j.jempfin.2018.02.004}.
}

\examples{
## load demo_returns
## calculate mean of daily abnormal standardized returns from 2015-01-01 to 2017-12-31
## with E.ON AG as event firm and RWE AG as control firm.
data(demo_returns)
ASR <- asr(event=demo_returns$EON, control=demo_returns$RWE, logret=FALSE)
mean(ASR)
}
