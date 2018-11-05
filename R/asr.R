##############################################################################################
## produces abnormal standardized return-series                                              #
## Dependencies: none                                                                        #
## as of October 30, 2018 (by Siegfried Köstlmeier, University of Regensburg, Germany)       #
## Disclaimer: Absolutely no warranty.                                                       #
##############################################################################################

asr <- function(event,          # data, containing event returns
                control,        # data, containing control returns
                logret = FALSE  # logical, TRUE if return series are log-returns
                ){# asr computes abnormal standardized returns

  if (missing(event) | missing(control)) {
    stop("Return series is missing.")
  }

  if(!is(logret,"logical")){
    stop("The variable 'logret' must be logical.")
  }

  if(!(length(event)==length(control))){
    stop("Return series have different length.")
  }

  if(isFALSE(logret)){
      event <- log(1+event)
      control <- log(1+control)
  }

  sr_event <- event/sd(event)
  sr_control <- control/sd(control)

  ASR <- sr_event - sr_control

  return(ASR)
}
