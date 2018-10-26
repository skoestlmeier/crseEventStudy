##############################################################################################
## check if input data is in appropiate format and column for abnormal return series exists  #
## Dependencies: none                                                                        #
## as of September 28, 2018 (by Siegfried Köstlmeier, University of Regensburg, Germany)     #
## Disclaimer: Absolutely no warranty.                                                       #
##############################################################################################

check_data <- function(data, abnr) {
      if(is(data,"data.frame")){
        if(is.null(data[,abnr])){
          stop("Column for abnormal return series could not be found")
        }else{
          return(data)
        }
      }else{
        stop("Input class must be 'data.frame'")
      }


}
