% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_ggplot2.R
\name{stat_3D}
\alias{stat_3D}
\title{Draw 3D Geoms for ggplot2}
\usage{
stat_3D(
  mapping = NULL,
  data = NULL,
  geom = "point",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)
}
\arguments{
\item{mapping}{Default list of aesthetic mappings to use for plot.
If not specified, must be supplied in each layer added to the plot.}

\item{data}{Default dataset to use for plot. If not already a data.frame,
will be converted to one by \code{\link[ggplot2:fortify]{fortify()}}. If not specified,
must be supplied in each layer added to the plot.}

\item{geom}{The geometric object to use to display the data for this layer.
When using a \verb{stat_*()} function to construct a layer, the \code{geom} argument
can be used to override the default coupling between stats and geoms. The
\code{geom} argument accepts the following:
\itemize{
\item A \code{Geom} ggproto subclass, for example \code{GeomPoint}.
\item A string naming the geom. To give the geom as a string, strip the
function name of the \code{geom_} prefix. For example, to use \code{geom_point()},
give the geom as \code{"point"}.
\item For more information and other ways to specify the geom, see the
\link[ggplot2:layer_geoms]{layer geom} documentation.
}}

\item{position}{Set position information. Find more details in \code{ggplot2}
function.}

\item{na.rm}{Boolean if na data should be removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display. To include legend keys for all levels, even
when no data exists, use \code{TRUE}.  If \code{NA}, all levels are shown in legend,
but unobserved levels are omitted.}

\item{inherit.aes}{If FALSE, overrides the default aesthetics, rather than
combining with them. This is most useful for helper functions that define
both data and aesthetics and shouldn't inherit behaviour from the default
plot specification.}

\item{...}{Arguments passed on to layer. Often the aesthetics
like \code{color = "red"} or \code{size = 3}. Two important ones are
\code{theta} (azimuthal rotation) and \code{phi} (colatitude rotation)
to define angle in degrees of viewing data.}
}
\value{
No direct return value, called to be used with \code{\link[ggplot2:ggplot]{ggplot2::ggplot()}}
in designing the plot.
}
\description{
This function adds 3D geoms such as points and paths to a ggplot2 plot.
}
\examples{
dat <- electricity

data_lines <- cbind(data.frame("Time" = dat$fparam), dat$data) \%>\%
  tidyr::pivot_longer(cols = 1 + 1:ncol(dat$data))

colors_plot <- RColorBrewer::brewer.pal(11, "Spectral")
colors_plot <- grDevices::colorRampPalette(colors_plot)(ncol(dat$data))
data_lines$color <- rep(colors_plot, nrow(dat$data))
data_lines$name <- as.numeric(data_lines$name)

result <- ggplot2::ggplot(
  data_lines,
  ggplot2::aes(y = Time, x = name, z = value, color = color)
) +
  ggplot2::theme_void() +
  stat_3D(theta = 0, phi = 15, geom = "path") +
  ggplot2::scale_color_manual(
    breaks = data_lines$color,
    values = data_lines$color
  ) +
  ggplot2::guides(color = "none")
}
\references{
Acker D (2024). gg3D: 3D perspective plots for ggplot2. R
package version 0.0.0.9000.
}
