% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tsum_p_value_summary.R
\name{tsum_p_value_summary}
\alias{tsum_p_value_summary}
\title{create summary of significance on a exstra_tsum object}
\usage{
tsum_p_value_summary(
  tsum,
  p = c(1e-04, 0.001, 0.01, 0.05),
  bonferroni = TRUE,
  raw = TRUE,
  bonferroni.size = NULL
)
}
\arguments{
\item{tsum}{An exstra_tsum object.}

\item{p}{P-value thresholds}

\item{bonferroni}{If TRUE, give Bonferroni corrected values.}

\item{raw}{If TRUE, give raw p-values.}

\item{bonferroni.size}{If not NULL, override the number of tests to correct for in the 
Bonferroni correction with this value.}
}
\value{
A data.table
}
\description{
Creates a data.table from the given p-values
}
\seealso{
\code{\link{p_values}}
}
