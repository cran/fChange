% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/confidence_interval.R
\name{confidence_interval}
\alias{confidence_interval}
\title{Change Point Confidence Intervals}
\usage{
confidence_interval(
  X,
  changes,
  K = bartlett_kernel,
  h = 2 * ncol(X)^(1/5),
  weighting = 0.5,
  M = 5000,
  alpha = 0.1,
  method = "distribution"
)
}
\arguments{
\item{X}{A dfts object or data which can be automatically converted to that
format. See \code{\link[=dfts]{dfts()}}.}

\item{changes}{Numeric vector for detected change points.}

\item{K}{Function for the Kernel. Default is bartlett_kernel.}

\item{h}{Numeric for bandwidth in computation of long run variance. The default
is \eqn{2N^{1/5}}.}

\item{weighting}{Weighting for the interval computation, value in [0,1].
Default is 0.5.}

\item{M}{Numeric for the number of Brownian motion simulations in computation
of the confidence interval. Default is 1000.}

\item{alpha}{Numeric for the significance level, in [0,1]. Default is 0.1.}

\item{method}{String to indicate the method for computing the percentiles used
in the confidence intervals. The options are 'distribution' and 'simulation'.
Default is 'distribution'.}
}
\value{
Data.frame with the first column for the changes, second for the lower
bounds of confidence intervals, and the third for the upper bounds of
confidence intervals.
}
\description{
Compute confidence intervals for the data based on some changes. The current
version is tuned to mean changes.
}
\examples{
X <- cbind(
  generate_brownian_motion(100, v = seq(0, 1, 0.05))$data,
  generate_brownian_motion(100, v = seq(0, 1, 0.05))$data + 0.5
)
confidence_interval(X, 100, alpha = 0.1)
confidence_interval(X, changes = 100, alpha = 0.1, method = "simulation")

X <- generate_brownian_motion(200, v = seq(0, 1, 0.05))
confidence_interval(X, 100)
confidence_interval(X, 100, method = "simulation")

X <- cbind(
  generate_brownian_motion(200, v = seq(0, 1, 0.05))$data,
  generate_brownian_motion(100, v = seq(0, 1, 0.05))$data + 0.1,
  generate_brownian_motion(150, v = seq(0, 1, 0.05))$data - 0.05
)
confidence_interval(X, c(200, 300))

confidence_interval(X = electricity, changes = c(64, 120), alpha = 0.1)
}
\references{
Horvath, L., & Rice, G. (2024). Change Point Analysis for Time
Series (First edition.). Springer.

Aue, A., Rice, G., & Sonmez, O. (2018). Detecting and dating structural
breaks in functional data without dimension reduction. Journal of the Royal
Statistical Society. Series B, Statistical Methodology, 80(3), 509-529.
}
