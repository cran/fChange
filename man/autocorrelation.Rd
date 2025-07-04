% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autodependence.R
\name{autocorrelation}
\alias{autocorrelation}
\title{Estimate the autocorrelation function of the series}
\usage{
autocorrelation(X, lags)
}
\arguments{
\item{X}{A dfts object or data which can be automatically converted to that
format. See \code{\link[=dfts]{dfts()}}.}

\item{lags}{Numeric(s) for the lags to estimate the lagged operator.}
}
\value{
Return a list or data.frame with the lagged autocorrelation function(s)
estimated from the data. Each function is given by a \eqn{(r } x \eqn{ r)}
matrix, where \eqn{r} is the number of points observed in each curve.
}
\description{
Obtain the empirical autocorrelation function for the given \code{lags} of a
functional time series, \code{X}. Given a functional time series, the sample
autocovariance functions \eqn{\hat{C}_{h}(u,v)} are given by:
\deqn{\hat{C}_{h}(u,v) =  \frac{1}{N} \sum_{i=1}^{N-|h|}(X_{i}(u) -
     \overline{X}_{N}(u))(X_{i+|h|}(v) - \overline{X}_{N}(v))}
where \eqn{ \overline{X}_{N}(u) = \frac{1}{N} \sum_{i = 1}^{N} X_{i}(t)}
denotes the sample mean function and \eqn{h} is the lag parameter. The
autocorrelation functions are defined over the range \eqn{(0,1)} by
normalizing these functions using the factor \eqn{\int\hat{C}_{0}(u,u)du}.
}
\examples{
N <- 100
v <- seq(from = 0, to = 1, length.out = 10)
bbridge <- generate_brownian_bridge(N = N, v = v)
lagged_autocor <- autocorrelation(X = bbridge, lags = 0:1)
}
\seealso{
\code{\link[=autocovariance]{autocovariance()}}
}
