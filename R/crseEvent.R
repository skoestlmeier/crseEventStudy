##############################################################################################
## produces clustering robust t-statistics for ASR and CCAR type abnormal returns            #
## Dependencies: sandwich package                                                            #
## as of April 9, 2018 (by Seppo Pynnonen, University of Vaasa, Finland, sjp@uwasa.fi)       #
## Disclaimer: Absolutely no warranty.                                                       #
##############################################################################################
#
crseEvent <- function(data, # data, containing abnormal returns (by series name defined in abnr) and clusering series
                        # named by cluster1 (and by cluste2 if two-way clustering)
                   abnr = "asr", # name of the abnormal return series in data (default asr)
                   cluster1 = "yyyymm", # first clustering series name in data (default yyyymm, i.e., year month yyyymm)
                   cluster2 = NULL,   # second clustering variable in 2-way clustering (default is one way clustering)
                   na.rm = TRUE,
                   na.replace = 0
                   ){# tabnr computes t-statistics related to abnormal returns as well cluster robust standard errors,
                     # and t-values
    ## produces clustering robust t-stats etc

  if (missing(data)) {
    stop("Variable 'data' is missing.")
  }

  if(is.null(data[, abnr])){
    stop("Column for abnormal return time series (abnr) is unknown.")
  }

  if(is.null(data[, cluster1])){
    stop("Column for cluster1 is unknown.")
  }

  data <- check_data(data, abnr)

  if(!is(na.rm,"logical")){
    stop("The variable na.rm must be logical.")
  }

  if(!is.numeric(na.replace)){
    stop("The variable na.replace must be numeric")
  }

  if(na.rm){
    data <- data[!is.na(data[, abnr]), ]  # drop missing values
    if(length(data[, abnr]) == 0){stop("No data left after dropping missing data.")}
  }else{
    if(missing(na.replace)){
      stop("Variable 'na.replace' is not defined.")
    }
    is.na(data[, abnr]) <- na.replace  # replace NA with variable na.replace
    warning("Missing return data are replaced with value defined in na.replace.")
  }

    fm <- lm(data[, abnr] ~ 1, data = data)
    if(is.null(cluster1)) {
        if(!is.null(cluster2)) cluster1 <- cluster2 # switch if one way clustering indicated by cluster2
        cluster2 <- NULL
    }
    reg.summ <- summary(fm)
    t.cl0 <- reg.summ$coef[3] # t stat
    p.cl0 <- reg.summ$coef[4] # p val
    vcl1 <- vcl2 <- vcl12 <- NA
    t.cl1 <- t.cl2 <- t.cl12 <- NA
    p.cl1 <- p.cl2 <- p.cl12 <- NA
    M1 <- M2 <- NA
    if(!is.null(cluster1)) {
        c1 <- data[, cluster1]
        vcl1 <- vcovCL(x = fm, cluster = c1) # vcovCL from sandwich package
        t.cl1 <- drop(fm$coef[1] / sqrt(vcl1)) # fm$coef[1] is intercept
        M1 <- length(unique(c1))
        p.cl1 <- 2*(1 - pt(q = abs(t.cl1), df = M1))
        if(!is.null(cluster2)) {
            c2 <- data[, cluster2]
            vcl2 <- vcovCL(x= fm, cluster = c2)
            M2 <- length(unique(c2))
            t.cl2 <- drop(fm$coef[1] / sqrt(vcl2))
            p.cl2 <- 2*(1 - pt(q = abs(t.cl2), df = M2))
            vcl12 <- vcovCL(x = fm, cluster = data[, c(cluster1, cluster2)])
            t.cl12 <- drop(fm$coef[1] / sqrt(vcl12))
            p.cl12 <- 2*(1 - pt(q = abs(t.cl12), df = min(M1, M2)))
        } # if cluster and cluster2
    } # if cluster1

    table <- as.data.frame(matrix(nrow = 1, ncol = 17))
    colnames(table) <- c("N", "mean.abnormal.ret", "t.val.nonclustered", "p.val.nonclustered",
                         "t.val.one.clustered", "p.val.one.clustered", "tcl2", "pcl2", "tcl12",
                         "pcl12", "cluster1", "cluster2", "var.cl1", "var.cl2", "var.cl12",
                         "unique.cl1", "unique.cl2")


    table$N = nrow(data)
    table$mean.abnormal.ret = reg.summ$coef[1] # mean abnormal return
    table$t.val.nonclustered = t.cl0 # non-clustered t
    table$p.val.nonclustered = p.cl0 # p-value of tcl0
    table$t.val.one.clustered = t.cl1 # 1-way custering t-value
    table$p.val.one.clustered = p.cl1 # p-value of tcl1
    table$tcl2 = t.cl2 # 1-way clustering t-val with respect to second clustering variable (NA if cluster2 = NULL)
    table$pcl2 = p.cl2 # p-value of tcl2
    table$tcl12 = t.cl12 # 2-way clustering t-value (NA if cluster2 = NULL)
    table$pcl12 = p.cl12 # p-value of tcl12
    table$cluster1 = cluster1
    table$cluster2 = cluster2

    # Variance of standard error -> mean / sqrt(vcl1) is t-val robust
    table$var.cl1 = if(!is.na(vcl1)){vcl1[1,1]}else{NA}
    table$var.cl2 = if(!is.na(vcl2)){vcl2[1,1]}else{NA}
    table$var.cl12 = if(!is.na(vcl12)){vcl12[1,1]}else{NA}
    table$unique.cl1 = M1
    table$unique.cl2 = M2

    cat("\n")
    return(table)

}