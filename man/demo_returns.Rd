\name{demo_returns}
\alias{demo_returns}
\title{Abnormal standardized returns for german stock repurchase announcements}
\description{
  \code{demo_returns} is a sample of abnormal standardized returns (ASR). The data contains 65 share repurchase announcements for german stocks from Jan. 2006 to Dec. 2016 listed in the DAX, MDAX and SDAX, where monthly return data for three subsequent years (beginning in the month after the announcement) is available. \code{code} denotes the Thomson-Reuters Datastream Mnemonic for each observation. \code{date} is the date (format: "yyyymm") for which the abnormal standardized return is calculated.
}
\usage{
data(demo_returns)
}

\examples{
## load demo_returns
data(demo_returns)

## calculate the mean abnormal return for the subsequent three years after
## the announcement of share repurchases for Munich Re AG from Apr. 2015 to Mar. 2018
beginn <- which(demo_returns$code=="D:MUV2" && demo_returns$date=="201504")
stop <- beginn + 35
mean(demo_returns$asr[beginn:stop])
}
