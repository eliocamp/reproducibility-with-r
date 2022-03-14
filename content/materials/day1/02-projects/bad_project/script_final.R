#' Fast linear regression
#'
#' Computes regression coefficient quickly for the case
#' of simple lienar regression using the simple
#' covariance/variance formula.
#'
#' @param y dependent variable
#' @param x independent variable
#' @param weights vector of weights
#' @param r2 logical indicating wether to compute r.quared
#'
#' @export
lm_lite <- function(y, x, weights = rep(1, length(y)), r2 = FALSE) {
  cov <- stats::cov.wt(cbind(y, x), wt = weights, cor = r2)
  estimate <- cov$cov[1, 2]/var.wt(x, w = weights)
  out <- list(term = deparse(substitute(x)),
              estimate = estimate)

  if (r2) {
    out$r.squared <-  cov$cor[1, 2]^2
    out$adj.r.squared <- cov$cor[1, 2]^2   # Not real!!
  }
  return(out)
}


#' Weighted vaiance
#' @keywords internal
var.wt <- function(x, w, na.rm = FALSE) {
  if (na.rm) {
    w <- w[i <- !is.na(x)]
    x <- x[i]
  }
  sum.w <- sum(w)
  (sum(w*x^2) * sum.w - sum(w*x)^2) / (sum.w^2 - sum(w^2))
}



#' Compute p.values
#'
#' Computes p.values from the result of [metR::FitLm()] (or any assumed student-t-distributed
#' statistic) with optional adjustments.
#'
#' @param estimate estimate of the regression (or other fit)
#' @param std.error standard error
#' @param df degrees of freedom
#' @param adjustment method for adjustment, see [stats::p.adjust()].
#'
#' @export
Pvaluate <- function(estimate, std.error, df, adjustment = "none") {
  stats::p.adjust(2*stats::pt(abs(estimate)/std.error, df, lower.tail = FALSE), method = adjustment)
}


#' Remove intercept
#'
#' Removes intercept term from the result of [metR::FitLm()]. More to the point,
#' it removes rows from a data.frame in which a column named "term" equals "(Intercept)".
#'
#' @param data dataframe
#'
#' @export
rm_intercept <- function(data) {
  data[data$term != "(Intercept)"]
}

#' Remove singleton dimensions
#'
#' Removes any column from a dataframe that holds only
#' 1 unique value.
#'
#' @param data a dataframe
#'
#' @export
rm_singleton <- function(data) {
  data[, vapply(data, data.table::uniqueN, 1) != 1, with = FALSE]
}
