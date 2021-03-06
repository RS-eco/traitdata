% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_taxonomy.R
\name{get_taxonomy}
\alias{get_taxonomy}
\title{Get accepted canonical names and taxonomy for a given species name}
\source{
The initial code of this function was obtained from the `traitdataform` package,
which is also available on GitHub: \url{https://github.com/EcologicalTraitData/traitdataform}.
}
\usage{
get_taxonomy(x, infraspecies = FALSE, preferred_data_sources=11,
fuzzy = TRUE, verbose = TRUE)
}
\arguments{
\item{x}{a character string or vector of species names.}

\item{infraspecies}{logical. If TRUE, the given name is resolved to infraspecies taxon,
i.e. subspecies names will not be pooled (not working!)}

\item{preferred_data_sources}{Select the datasources that should be used for name matching, default is GBIF.}

\item{fuzzy}{logical. If TRUE, function tries fuzzy matching for species requests.
May produce output, if normal matching fails. (not working!)}

\item{verbose}{logical. If FALSE, warnings and messages are suppressed.}
}
\value{
a \code{data.frame} mapping the user supplied names to the accepted taxon names and
higher taxonomic information (kingdom, phylum, class, order, family, genus).
}
\description{
Get accepted canonical names and taxonomy for a given species name
}
\details{
If 'synonym' is returned as TRUE, the user provided name has been identified as a synonym and was mapped to an accepted name.
The field confidence reports the confidence of the matching procedure performed by the function 'get_gbifid_()' of the package 'taxize'.
The taxonID is a globally valid URI that links to the taxon description of the GBIF backbone taxonomy.
}
\examples{
get_taxonomy(c("Chorthippus albomarginatus", "Conocephalus dorsalis", "Tetrix kraussi"))

get_taxonomy("Equus burchellii")

get_taxonomy(x="Aegotheles tatei")

get_taxonomy("Equus quagga")
}
\author{
RS-eco
}
