% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot.dfts}
\alias{plot.dfts}
\title{Plot dfts objects}
\usage{
\method{plot}{dfts}(
  x,
  changes = NULL,
  type = c("spaghetti", "fast", "rainbow", "banded", "acf", "pacf", "summary", "qq",
    "distribution", "change", "interval", "surface"),
  plot_title = x$name,
  val_axis_title = NULL,
  res_axis_title = NULL,
  FD_axis_title = NULL,
  eye = NULL,
  aspectratio = NULL,
  showticklabels = TRUE,
  lag.max = 20,
  d.max = 2,
  alpha = 0.05,
  TVE = 0.95,
  distribution = c("norm"),
  method = c("Welch", "MC", "Imhof"),
  legend = TRUE,
  highlight_changes = TRUE,
  intervals = confidence_interval(x, changes),
  int.gradual = TRUE,
  ...
)
}
\arguments{
\item{x}{A dfts object or data which can be automatically converted to that
format. See \code{\link[=dfts]{dfts()}}.}

\item{changes}{Vector of numeric change point locations. Can be NULL.}

\item{type}{Choice of plotting method. Options include: 'spaghetti', 'fast',
'rainbow','banded','acf', 'pacf', 'summary', 'qq', 'distribution', 'change',
'interval', and'surface'.}

\item{plot_title}{Title to include on the return plot.}

\item{val_axis_title, res_axis_title, FD_axis_title}{Title for the axis giving
the values (val), the resolution of the fparam (res), and the functional
observations (FD).}

\item{eye, aspectratio}{Angle (eye) and ratio (aspectratio) to view 3d plots.}

\item{showticklabels}{Boolean if the tick marks should be shown.}

\item{lag.max}{Max number of lags to consider for ACF/PACF and summary plots.}

\item{d.max}{Max number of dimensions for qq/distribution and summary plots.}

\item{alpha}{Significance level to be used in various plots. Value in [0,1].}

\item{TVE}{Total variance explained used in qq/distribution plots. Value in [0,1].}

\item{distribution}{String of the distribution to compare against in.
distribution plot. The string can be anything such that there is a
rdistribution and ddistribution function available. For example 'exp',
'gamma'. Additional parameters can be passed using ... .}

\item{method}{Method for computing ACF/PACF. Options include 'Welch', 'MC',
and 'Imhof'.}

\item{legend}{Boolean if legend should be given in qq/distribution plots.}

\item{highlight_changes}{Boolean if changes should be highlighted in black.}

\item{intervals}{Information on confidence intervals of changes for change
plot. See \code{\link[=confidence_interval]{confidence_interval()}}.}

\item{int.gradual}{Boolean if confidence interval be solid gray (FALSE) or
gradual colors (TRUE) when \code{type='change'} plot.}

\item{...}{Details for plotting in acf/pacf, summary, or distribution function.}
}
\value{
Plot of varying types.
}
\description{
Provides various visualizations for functional data.
}
\examples{
plt <- plot(electricity)
plt <- plot(dfts(var(electricity)), type = "surface")
}
\references{
John Fox, & Sanford Weisberg (2019). An R Companion to Applied
Regression. Sage.
}
