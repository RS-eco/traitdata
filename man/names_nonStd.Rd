% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/traitdata-package.R
\docType{data}
\name{names_nonStd}
\alias{names_nonStd}
\title{Names of non-standardised species}
\format{
A \code{data.frame} with 8231 observations and 3 variables 
(Genus, Species and scientificName).
}
\usage{
data(names_nonStd)
}
\description{
Contains non-standardised names of species, which could not be resolved 
by the `get_taxonomy` function.
}
\details{
This csv file contains all species names which could not be standardised using 
the `get_taxonomy` function, as species names were misspelled or old, and for which also no synonym was provided.
These species thus have an NA value for the scientificNameStd column in the respective dataset.
}
