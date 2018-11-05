\name{crseEvent}
\alias{crseEvent}
\title{Clustering robust t-statistics for abnormal returns in long-horizon event studies}
\description{
  \code{crseEvent} implements a robust statistical test developed by Dutta et al. (JempFin, 2018).

The test is based on abnormal standardized returns and offers three implementations. Standardized returns are defined as \eqn{sr_{it} = \frac{r_{it}}{s_{it}}} where \eqn{s_{it}} is a standard deviation estimator of log returns \eqn{r_{it}}:

\strong{Use of Abnormal standardized returns (ASR)}

Abnormal standardized returns are defined as \eqn{ASR_{it} = sr_{it} - sr_{ci,t}}, where \eqn{sr_{ci,t}} is the standardized return of the matching control firm or the average of standardized returns of the matching control portfolio.

\strong{Use of Standardized abnormal returns (SAR)}

Standardized abnormal returns are defined as \eqn{SAR_{it} = \frac{r_{event} - r_{control}}{sd_{event-control}}}. The matching control return should be derived from a single firm observation and not be the return-series of a portfolio.

\strong{Use of Continuously compounded abnormal returns (CCAR)}

Continuously compounded abnormal returns are defined as \eqn{CCAR_{it} = r_{it} - r_{ci,t}}, where \eqn{r_{it} = log(1 + R_{it})} is the event month \eqn{t} continuously compounded return (i.e., log-return) of event stock \eqn{i}, and \eqn{r_{ci,t}} is the continuously compounded return of the control firm.

}
\usage{
crseEvent(data, abnr = "ars", cluster1 = "yyyymm",
  cluster2 = NULL, na.rm = TRUE, na.replace = 0)
}
\arguments{
  \item{data}{an object of class \code{"\link{data.frame}"} (or one that
    can be coerced to that class)}

  \item{abnr}{Name of a column from \code{data} which contains abnormal standardized returns (ASR), standardized abnormal returns (SAR) or continuously compounded abnormal returns (CCAR).}

  \item{cluster1}{Name of a column from \code{data} which contains the primarely cluster-variables for the observations.}

  \item{cluster2}{Name of a column from \code{data} which contains additional cluster-variables for the observations.}

  \item{na.rm}{An object of class \code{"\link{logical}"}: If \code{na.rm} is TRUE, missing observations for the item \code{abnr} will be removed from the dataset. Otherwise missing oberservations will be replaced with a value defined in \code{na.replace}}

  \item{na.replace}{A numeric scalar: If \code{data} contains missing observations for the abnormal return series and \code{na.rm} is FALSE, these missing return values will be overritten with the value of \code{na.replace}}

}

\value{
  \code{crseEvent} returns an object of \code{\link{class}} \code{crse} and \code{list}.

  The returning value of \code{"crseEvent"} is a \code{"list"} containing the
  following components:

  \item{N}{Total number of observations.}
  \item{mean.abnormal.ret}{Mean abnormal return.}
  \item{t.val.nonclustered}{Non-clustered (common) t-value.}
  \item{p.val.nonclustered}{Non-clustered (common) p-value.}
  \item{t.val.one.clustered}{One-way clustered t-value.}
  \item{p.val.one.clustered}{One-way clustered p-value.}
  \item{tcl2}{One-way clustering t-value with respect to second clustering variable (\code{\link{NA}} if cluster2 is \code{\link{NULL}}).}
  \item{pcl2}{One-way clustering p-value with respect to second clustering variable (\code{\link{NA}} if cluster2 is \code{\link{NULL}}).}
  \item{tcl12}{2-way clustering t-value (\code{\link{NA}} if cluster2 is \code{\link{NULL}}).}
  \item{pcl12}{2-way clustering p-value (\code{\link{NA}} if cluster2 is \code{\link{NULL}}).}
  \item{cluster1}{Name of the first cluster variable.}
  \item{cluster2}{Name of the second cluster variable.}
  \item{reg.fit}{Regression results on which t-value compuations are based.}
  \item{var.cl1}{Robust variance of abnormal return series with regard to one-way clustering on variable \code{cluster1}.}
  \item{var.cl2}{Robust variance of abnormal return series with regard to one-way clustering on variable \code{cluster2}.}
  \item{var.cl12}{Robust variance of abnormal return series with regard to two-way clustering on both variable \code{cluster1} and \code{cluster2}.}
  \item{unique.cl1}{Total number of unique observations by clustering on variable \code{cluster1}.}
  \item{unique.cl2}{Total number of unique observations by clustering on variable \code{cluster2}.}
}


\references{
  Dutta, A., Knif, J., Kolari, J.W., Pynnonen, S. (2018):
  A robust and powerful test of abnormal stock returns in long-horizon event studies.
  \emph{Journal of Empirical Finance}, \bold{47}, p. 1-24.
  \doi{10.1016/j.jempfin.2018.02.004}.
}

\examples{
## load demo_share_repurchases
## one-way clustering on column "date" and print summary statistics
data(demo_share_repurchases)
crse <- crseEvent(demo_share_repurchases, abnr="ars", cluster1 = "date")
summary(crse)

## print mean of abnormal return series
crse$mean.abnormal.ret
}
