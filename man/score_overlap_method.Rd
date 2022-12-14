% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/score_bam.R
\name{score_overlap_method}
\alias{score_overlap_method}
\title{Score DNA sequences using the overlap method}
\usage{
score_overlap_method(seqs, motif)
}
\arguments{
\item{seqs}{A vector of DNA sequences}

\item{motif}{A single DNA repeat motif string}
}
\description{
The overlap method tags all base pairs that match the motif or cycles of the 
motif (starting on different bases).
}
