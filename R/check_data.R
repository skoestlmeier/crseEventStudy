###
# Data-Frame noch testen, da auch character enthalten (und so alles umgewandelt wird!)
#  Fehler in model.frame.default(formula = xdf[, abnr] ~ 1, data = xdf, drop.unused.levels = TRUE) :
#  ungültiger Typ (list) für die Variable 'xdf[, abnr]'
#
###

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
