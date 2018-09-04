##############################################################################################
## produces clustering robust t-statistics for ASR and CCAR type abnormal returns            #
## Dependencies: sandwich package                                                            #
## as of April 9, 2018 (by Seppo Pynnonen, University of Vaasa, Finland, sjp@uwasa.fi)       #
## Disclaimer: Absolutely no warranty.                                                       #
##############################################################################################
#
crse <- function(xdf, # data frame containing abnormal return (by series name defined in abnr) and clusering series
                        # named by cluster1 (and by cluste2 if two-way clustering)
                   abnr = "asr", # name of the abnormal return series in xdf (default asr)
                   cluster1 = "yrm", # first clustering series name in xdf (default yrm, i.e., year month yyyymm)
                   cluster2 = NULL   # second clustering variable in 2-way clustering (default is one way clustering)
                   ){# tabnr computes t-statistics related to abnormal returns as well cluster robust standard errors,
                     # and t-values
    ## produces clustering robust t-stats etc
    if(is.null(xdf[, abnr])) return(NA) # no abnormal returns available
    xdf <- xdf[!is.na(xdf[, abnr]), ]  # drop missing values
    if(length(xdf[, abnr]) == 0) return(NA) # no data left after dropping missing data
    fm <- lm(xdf[, abnr] ~ 1, data = xdf)
    if(is.null(cluster1)) {
        if(!is.null(cluster2)) cluster1 <- cluster2 # switch if one way clustering indicated by cluster2
        cluster2 <- NULL
    }
    reg.summ <- summary(fm)
    t.cl0 <- reg.summ$coef[3]
    p.cl0 <- reg.summ$coef[4]
    vcl1 <- vcl2 <- vcl12 <- NA
    t.cl1 <- t.cl2 <- t.cl12 <- NA
    p.cl1 <- p.cl2 <- p.cl12 <- NA
    M1 <- M2 <- NA
    if(!is.null(cluster1)) {
        c1 <- xdf[, cluster1]
        vcl1 <- vcovCL(x = fm, cluster = c1) # vcovCL from sandwich package
        t.cl1 <- drop(fm$coef[1] / sqrt(vcl1))
        M1 <- length(unique(c1))
        p.cl1 <- 2*(1 - pt(q = abs(t.cl1), df = M1))
        if(!is.null(cluster2)) {
            c2 <- xdf[, cluster2]
            vcl2 <- vcovCL(x= fm, cluster = c2)
            M2 <- length(unique(c2))
            t.cl2 <- drop(fm$coef[1] / sqrt(vcl2))
            p.cl2 <- 2*(1 - pt(q = abs(t.cl2), df = M2))
            vcl12 <- vcovCL(x = fm, cluster = xdf[, c(cluster1, cluster2)])
            t.cl12 <- drop(fm$coef[1] / sqrt(vcl12))
            p.cl12 <- 2*(1 - pt(q = abs(t.cl12), df = min(M1, M2)))
        } # if cluster and cluster2
    } # if cluster1
    return(list(mean.abnr = reg.summ$coef[1], # mean abnormal return
                tcl0 = t.cl0, # non-clustered t
                pcl0 = p.cl0, # p-value of tcl0
                tcl1 = t.cl1, # 1-way custering t-value
                pcl1 = p.cl1, # p-value of tcl1
                tcl2 = t.cl2, # 1-way clustering t-val with respect to second clustering variable (NA if cluster2 = NULL)
                pcl2 = p.cl2, # p-value of tcl2
                tcl12 = t.cl12, # 2-way clustering t-value (NA if cluster2 = NULL)
                pcl12 = p.cl12, # p-value of tcl12
                cluster1 = cluster1,
                cluster2 = cluster2,
                reg.fit = reg.summ, # regression results on which t-value compuations are based
                vcl1 = vcl1, vcl2 = vcl2, vcl12 = vcl12,
                cl1 = list(M = M1, N = nrow(xdf)),
                cl2 = list(M = M2, N = nrow(xdf))
                ) # list
           ) # return
}
