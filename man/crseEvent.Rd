\name{crseEvent}
\alias{crseEvent}
\title{Clustering robust t-statistics for ASR and CCAR type abnormal returns in long-horizon event studies}
\description{
  \code{crseEvent} implements a robust statistical test developed by Dutta et al. (JempFin, 2018).

The test is based on abnormal standardized returns and offers two implementations. Standardized returns are defined as \eqn{sr_{it} = \frac{r_{it}}{s_{it}}} where \eqn{s_{it}} is a standard deviation estimator of log returns \eqn{r_{it}}:

\strong{Use of Abnormal standardized returns (ASR)}

Abnormal standardized returns are defined as \eqn{ASR_{it} = sr_{it} - sr_{ci,t}}, where \eqn{sr_{ci,t}} is the standardized return of the matching control firm or the average of standardized returns of the matching control portfolio.

\strong{Use of Continuously compounded abnormal returns (CCAR)}

Continuously compounded abnormal returns are defined as \eqn{CCAR{it} = r_{it} - r_{ci,t}}, where \eqn{r_{it} = log(1 + R_{it}} is the event month \eqn{t} continuously compounded return (i.e., log return) of event stock \eqn{i}, and \eqn{r_{ci,t}} is the continuously compounded return of the control firm.

}
\usage{
crseEvent(data, abnr = "asr", cluster1 = "yyyymm",
  cluster2 = NULL, na.rm = TRUE, na.replace = 0)
}
\arguments{
  \item{data}{an object of class \code{"\link{data.frame}"} (or one that
    can be coerced to that class)}

  \item{abnr}{Name of a column from \code{data} which contains abnormal standardized returns (ASR) or continuously compounded abnormal returns (CCAR).}

  \item{cluster1}{Name of a column from \code{data} which contains the primarely cluster-variables for the observations.}

  \item{cluster2}{Name of a column from \code{data} which contains additional cluster-variables for the observations.}

  \item{na.rm}{An object of class \code{"\link{logical}"}: If \code{na.rm} is TRUE, missing observations for the item \code{abnr} will be removed from the dataset. Otherwise missing oberservations will be replaced with a value defined in \code{na.replace}}

  \item{na.replace}{A numeric scalar: If \code{data} contains missing observations for the abnormal return series ASR or CCAR, these missing return values will be overritten with the value of \code{na.replace}}

}

\value{
  \code{crseEvent} returns an object of \code{\link{class}} \code{"data.frame"}.

  The returning value of \code{"crseEvent"} is a \code{"data.frame"} containing the
  following components:

  \item{TopMinusBottom}{Mean difference return between top and bottom portfolio.}
  \item{t_stat}{the residuals, that is response minus fitted values.}
  \item{t_pval}{the fitted mean values.}
  \item{MR_pval}{the numeric rank of the fitted linear model.}
  \item{MRall_pval}{the numeric rank of the fitted linear model.}
  \item{UP_pval}{studentized p-value from Patton and Timmermanns (JoE, 2010) "Up and Down" test for assumed increasing monotonicity pattern and using absolute difference returns.}
  \item{DOWN_pval}{studentized p-value from Patton and Timmermanns (JoE, 2010) "Up and Down" test for assumed decreasing monotonicity pattern and using absolute difference returns.}
  \item{Wolak_pval}{p-value "TestOnePvalueWolak" for \eqn{H0*} of Test 1 in \code{wolak.R}}
  \item{Bonferroni_pval}{p-value for \eqn{H0*} of Test 1 from \code{monoBonferroni.R}.}
}


\references{
  Patton, A. and Timmermann, A. (2010):
  Monotonicity in asset returns: New testes with applications to the term structure, the CAPM, and portfolio sorts.
  \emph{Journal of Financial Economics}, \bold{98}, No. 3, p. 605--625.
  \doi{10.1016/0304-4076(89)90094-8}.
}

\examples{
## load daily non-difference return data.
## test an increasing pattern of monotonicity
\donttest{
data(demo_returns)
monoSummary(demo_returns, increasing = TRUE, block_length = 10)
}
}
