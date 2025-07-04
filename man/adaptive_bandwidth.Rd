% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kernels.R
\name{adaptive_bandwidth}
\alias{adaptive_bandwidth}
\title{Adaptive_bandwidth}
\usage{
adaptive_bandwidth(
  X,
  kernel = bartlett_kernel,
  name = NULL,
  order = NULL,
  weighting = NULL
)
}
\arguments{
\item{X}{A dfts object or data which can be automatically converted to that
format. See \code{\link[=dfts]{dfts()}}.}

\item{kernel}{Kernel function. No additional parameters are needed for
\code{bartlett_kernel()}, \code{parzen_kernel()}, \code{tukey_hanning_kernel()},
and \code{quadratic_spectral_kernel()}.}

\item{name, order, weighting}{Additional parameters if non-standard kernels, e.g.
those not in fChange, are used. See references for the definitions. Name is
extracted from the kernel name to select \code{order}/\code{weighting} when
not given, if the function aligns with the recommended functions, see
\code{kernel} parameter.}
}
\value{
Scalar value of the data-adapted bandwidth.
}
\description{
Computes the data-driven bandwidth using a method based on the
spectral density operator which adapts to the functional data.
}
\examples{
adaptive_bandwidth(generate_brownian_motion(100))
adaptive_bandwidth(electricity, parzen_kernel)
}
\references{
Rice, G., & Shang, H. L. (2017). A Plug‐in Bandwidth Selection
Procedure for Long‐Run Covariance Estimation with Stationary Functional Time
Series. Journal of Time Series Analysis, 38(4), 591–609.
}
\seealso{
\code{\link[=bartlett_kernel]{bartlett_kernel()}}, \code{\link[=truncated_kernel]{truncated_kernel()}}, \code{\link[=parzen_kernel]{parzen_kernel()}},
\code{\link[=tukey_hanning_kernel]{tukey_hanning_kernel()}}, \code{\link[=quadratic_spectral_kernel]{quadratic_spectral_kernel()}}, \code{\link[=daniell_kernel]{daniell_kernel()}},
\code{\link[=flat_top_kernel]{flat_top_kernel()}}
}
