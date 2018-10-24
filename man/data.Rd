\name{data}
\alias{data}
\title{Abnormal standardized returns for }
\description{
  \code{data} is a sample of abnormal standardized returns (ASR). The data contains 65 share repurchase announcements for german stocks from Jan. 2006 to Dec. 2016 listed in the DAX, MDAX and SDAX, where monthly return data for three subsequent years (beginning in the month after the announcement) is available. \code{code} denotes the Thomson-Reuters Datastream Mnemonic for each observation. \code{date} is the month (format: "yyyymm") for which the abnormal standardized return is calculated.
}
\usage{
data(data)
}

\examples{
## load data.
data(demo_returns)

## calculate the mean abnormal return for the subsequent three years after the announcement of share repurchases for Munich Re AG from Apr. 2015 to Mar. 2018
beginn <- which(data$code=="D:MUV2" && data$date=="201504")
stop <- beginn + 35
mean(data$asr[beginn:stop])
}
