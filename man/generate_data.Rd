% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_data.R
\name{generate_data}
\alias{generate_data}
\title{Generate Functional Data}
\usage{
generate_data(fparam, data_details, burnin = 100)
}
\arguments{
\item{fparam}{fparam of data (or resolution that will be equally spaced
on [0,1]).}

\item{data_details}{List of named lists indicating parameters for each data group.
Each process can use different parameters, given below.
\itemize{
\item \strong{bmotion}: Brownian motion contains:
\itemize{
\item \strong{N}: Numeric indicating the number of observations.
\item \strong{sd}: Numeric for the standard deviation of the observations.
}
\item \strong{bbridge}: Brownian bridge contains:
\itemize{
\item \strong{N}: Numeric indicating the number of observations.
\item \strong{sd}: Numeric for the standard deviation of the observations.
}
\item \strong{kl}: Karhunen-Loeve expansion contains:
\itemize{
\item \strong{N}: Numeric indicating the number of observations.
\item \strong{distribution}: Distribution of the errors. Options include:
\code{binomial}, \code{exponential}, \code{laplace}, \code{normal},
\code{t} (add dof argument), \code{gamma} (add shape argument),
and \code{cauchy}.
\item \strong{eigenvalues}: Numerics for the eigenvalues of the given
distribution (value for each in basis).
\item \strong{mean}: Numeric for the mean of the group.
\item \strong{dependence}: Strength of dependence between observation.
\item \strong{basis}: fda \code{basisfd} object.
\item \strong{dof}: (Optional) Numeric for the degrees of freedom if using
a \code{t} distribution.
\item \strong{shape}: (Optional) Numeric for the shape if using
a \code{gamma} distribution.
}
\item \strong{ou}: Ornstein-Uhlenbeck process requires:
\itemize{
\item \strong{N}: Numeric indicating the number of observations.
\item \strong{dependence}: Strength of dependence between observation.
}
\item \strong{far1}: Functional autoregressive process of order 1 contains:
\itemize{
\item \strong{N}: Numeric indicating the number of observations.
\item \strong{dependence}: Strength of dependence between observation.
\item \strong{sd}: Numeric for the standard deviation of the observations.
\item \strong{vary}: Boolean if the starting value each observation should
be 0 or vary. It does this by dropping first value. If fparam is
given as a number, it can adjust so that the length is the same. If
fparam is a vector, the fparam will be one smaller.
}
}}

\item{burnin}{Numeric for amount of burnin for data. Only used for the first
groups. Subsequent groups begin at the end of the last group.}
}
\value{
A dfts object for the generated data.
}
\description{
A general wrapper function to allow generation of functional data according
to several approaches: \code{bbridge}, \code{bmotion}, \code{kl}, \code{ou},
and \code{far1}.
}
\examples{
result <- generate_data(
  fparam = 15,
  data_details = list(
    "bmotion" = list("N" = 100, "sd" = 1),
    "bbridge" = list("N" = 100, "sd" = 1),
    "bbridge" = list("N" = 100, "sd" = 1),
    "kl" = list(
      "N" = 100,
      "distribution" = "Normal",
      "eigenvalues" = 1 / 1:4,
      "mean" = 0, "dependence" = 0,
      "basis" = fda::create.bspline.basis(),
      "sd" = 1
    ),
    "ou" = list("N" = 100, "dependence" = 0),
    "far1" = list(
      "N" = 100, "dependence" = 0,
      "sd" = 1, "vary" = FALSE
    )
  )
)
}
\seealso{
\code{\link[=generate_brownian_bridge]{generate_brownian_bridge()}}, \code{\link[=generate_brownian_motion]{generate_brownian_motion()}},
\code{\link[=generate_far1]{generate_far1()}}, \code{\link[=generate_karhunen_loeve]{generate_karhunen_loeve()}},
\code{\link[=generate_ornstein_uhlenbeck]{generate_ornstein_uhlenbeck()}}
}
