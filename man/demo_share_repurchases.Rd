\name{demo_share_repurchases}
\alias{demo_share_repurchases}
\title{Abnormal standardized returns for german stock repurchase announcements}
\description{
  \code{demo_share_repurchases} is a sample of abnormal standardized returns (ASR). The data contains 65 share repurchase announcements for german stocks from Jan. 2006 to Dec. 2016 listed in the DAX, MDAX and SDAX, where monthly return data for three subsequent years (beginning in the month after the announcement) is available. \code{code} denotes the Thomson-Reuters Datastream Mnemonic for each observation. \code{date} is the date (format: "yyyymm") for which the abnormal standardized return is calculated. \code{ars} denotes the column for the abnormal return series, which are pre-calculated abnormal standardized returns (ASR).
}
\usage{
data(demo_share_repurchases)
}

\examples{
## load demo_share_repurchases
data(demo_share_repurchases)

## calculate the mean abnormal return for the subsequent three years after
## the announcement of share repurchases for Munich Re AG from Apr. 2015 to Mar. 2018
beginn <- which(demo_share_repurchases$code=="D:MUV2" && demo_share_repurchases$date=="201504")
stop <- beginn + 35
mean(demo_share_repurchases$ars[beginn:stop])
}
