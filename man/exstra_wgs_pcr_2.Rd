% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exstra_wgs_pcr_2.R
\docType{data}
\name{exstra_wgs_pcr_2}
\alias{exstra_wgs_pcr_2}
\title{Repeat score data from cohort WGS_PCR_2.}
\format{
An exstra_score object:
\describe{
  \item{data}{A data.table repeat scores, one row for each read}
  \item{samples}{A data.table of input samples}
  \item{db}{A data.table of the known loci}
  \item{input_type}{Indication that the loci are referred to by name (as opposed to genomic position)}
}
}
\source{
Rick M. Tankard, Martin B. Delatycki, Paul J. Lockhart, 
        Melanie Bahlo. 
        Detecting known repeat expansions with standard protocol next generation 
        sequencing, towards developing a single screening test for neurological repeat 
        expansion disorders. 
        \emph{bioRxiv} 157792; 
        doi: \url{https://doi.org/10.1101/157792}
}
\usage{
data(exstra_wgs_pcr_2)
}
\description{
Table of known repeat expansion disorder loci.
}
\keyword{datasets}
