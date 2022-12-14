% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggplot.exstra_score.R
\name{ggexstra_ecdf}
\alias{ggexstra_ecdf}
\title{Create a ggplot2 ecdf plot from an exstra_score object}
\usage{
ggexstra_ecdf(x, mapping = aes(x = rep, colour = sample), ...)
}
\arguments{
\item{x}{exstra_score object}

\item{mapping}{Default list of aesthetic mappings to use for plot.}

\item{...}{Additional arguments to ggplot()}
}
\description{
Create a ggplot2 ecdf plot from an exstra_score object
}
\examples{
data(exstra_wgs_pcr_2)
ggexstra_ecdf(exstra_wgs_pcr_2["HD",])

library(ggplot2)
ggexstra_ecdf(exstra_wgs_pcr_2[,]) + facet_wrap("locus")

}
