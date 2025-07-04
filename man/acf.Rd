% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/facf.R
\name{acf}
\alias{acf}
\alias{acf.default}
\alias{pacf}
\alias{pacf.default}
\alias{acf.dfts}
\alias{pacf.dfts}
\title{ACF/PACF Functions}
\usage{
acf(x, lag.max = NULL, ...)

\method{acf}{default}(x, lag.max = NULL, ...)

pacf(x, lag.max = NULL, ...)

\method{pacf}{default}(x, lag.max = NULL, ...)

\method{acf}{dfts}(
  x,
  lag.max = NULL,
  alpha = 0.05,
  method = c("Welch", "MC", "Imhof"),
  WWN = TRUE,
  figure = TRUE,
  ...
)

\method{pacf}{dfts}(x, lag.max = NULL, n_pcs = NULL, alpha = 0.95, figure = TRUE, ...)
}
\arguments{
\item{x}{Object for computation of (partial) autocorrelation function
(see \code{acf()} or \code{pacf}).}

\item{lag.max}{Number of lagged covariance estimators for the time series
that will be used to estimate the (partial) autocorrelation function.}

\item{...}{Additional parameters to appropriate function}

\item{alpha}{A value between 0 and 1 that indicates significant level for
the confidence interval for the i.i.d. bounds of the (partial) autocorrelation
function. By default \code{alpha = 0.05}.}

\item{method}{Character specifying the method to be used when estimating the
distribution under the hypothesis of functional white noise.
Accepted values are:
\itemize{
\item "Welch": Welch approximation.
\item "MC": Monte-Carlo estimation.
\item "Imhof": Estimation using Imhof's method.
}
By default, \code{method = "Welch"}.}

\item{WWN}{Logical. If \code{TRUE}, WWN bounds are also computed.}

\item{figure}{Logical. If \code{TRUE}, prints plot for the estimated
function with the specified bounds.}

\item{n_pcs}{Number of principal components that will be used to fit the
ARH(p) models.}
}
\value{
List with ACF or PACF values and plots

\itemize{
\item \code{acfs/pacfs}: Autocorrelation values for
each lag of the functional time series.
\item \code{SWN_bound}: The upper prediction
bound for the i.i.d. distribution under strong white noise assumption.
\item \code{WWN_bound}: The upper prediction
bound for the i.i.d. distribution under weak white noise assumption.
\item \code{plot}: Plot of autocorrelation values for
each lag of the functional time series.
}
}
\description{
This function computes the ACF/PACF of data. This can be applied on traditional
scalar time series or functional time series defined in \code{\link[=dfts]{dfts()}}.
}
\examples{
acf(1:10)
x <- generate_brownian_bridge(100, seq(0, 1, length.out = 20))
acf(x, 20)

x <- generate_brownian_bridge(100, seq(0, 1, length.out = 20))
pacf(x, lag.max = 10, n_pcs = 2)

}
\references{
Mestre G., Portela J., Rice G., Munoz San Roque A., Alonso E. (2021).
\emph{Functional time series model identification and diagnosis by
means of auto- and partial autocorrelation analysis.}
Computational Statistics & Data Analysis, 155, 107108.

Mestre, G., Portela, J., Munoz San Roque, A., Alonso, E. (2020).
\emph{Forecasting hourly supply curves in the Italian Day-Ahead
electricity market with a double-seasonal SARMAHX model.}
International Journal of Electrical Power & Energy Systems,
121, 106083.

Kokoszka, P., Rice, G., Shang, H.L. (2017).
\emph{Inference for the autocovariance of a functional
time series under conditional heteroscedasticity}
Journal of Multivariate Analysis,
162, 32--50.
}
\seealso{
\code{\link[stats:acf]{stats::acf()}}, \code{\link[=sacf]{sacf()}}
}
