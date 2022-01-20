#' Standardize scientific names of species
#'
#' @description Adds columns to a traitdata object containing accepted species
#'   names and relates to globally unique taxon identifiers via URI.
#' @usage standardize_taxonomy(x, preferred_data_sources=c(11:15), fuzzy = TRUE, verbose = TRUE,
#' return=c("kingdom", "phylum", "class", "order", "family", "scientificNameStd"))
#' @param x a \code{data.frame} containing at least the column scientificName.
#' @param preferred_data_sources Select the datasources that should be used for name matching, default is GBIF.
#' @param fuzzy if set to `FALSE` (default mode), this disables fuzzy matching
#'   if problems with ambiguous species names arise.
#' @param verbose has currently no effect.
#' @param return a character vector containing the informatoin that should be
#' extracted into the output. Valid entries are the column names returned by
#' function `get_taxonomy()`. See 'Details'.
#'
#' @details Taxonomic standardisation is an enormous challenge, as
#' species names constantly change and phylogenetic trees are regularly refined.
#'
#' As a consequence, there is not one reference for accepted species names, as it often
#' depends on the field of research and taxonomic focus.
#'
#' For reasons of simplicity and because of its high coverage of taxa, the
#' function `standardize_taxonomy()` by default uses the GBIF Backbone Taxonomy as its
#' reference system and resolves all provided species names to the accepted
#' name according to GBIF (resolving misspellings and synonyms in the
#' process).
#'
#' @source The initial code from this function was obtained from the `traitdataform` package,
#' which is available on GitHub: \url{https://github.com/EcologicalTraitData/traitdataform}.
#' @author RS-eco
#' @examples
#' \dontrun{
#' standardize_taxonomy(x=data.frame(scientificName="Equus burchellii"))
#'
#' standardize_taxonomy(x=data.frame(scientificName=c("Equus quagga")),
#' return=c("kingdom", "phylum", "class", "order", "family", "scientificNameStd"))
#' }
#' @export
standardize_taxonomy <- function(x, preferred_data_sources=c(11:15),
                                 fuzzy = TRUE, verbose = TRUE, 
                                 return=c("kingdom", "phylum", "class",
                                          "order", "family", "scientificNameStd")) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    utils::install.packages("dplyr")
  }
  temp <- get_taxonomy(x=levels(droplevels(factor(x$scientificName))),
                       preferred_data_sources=preferred_data_sources,
                       fuzzy = fuzzy, verbose = verbose)
  if("scientificName" %in% colnames(temp)){
    temp$scientificName <- levels(droplevels(factor(x$scientificName)))
  } else{
    temp <- data.frame(cbind(levels(droplevels(factor(x$scientificName))), temp))
    colnames(temp)[1] <- "scientificName"
  }
  temp <- dplyr::select(temp, "scientificName", dplyr::one_of(return))
  out <- dplyr::left_join(x, temp, by="scientificName")
  out <- dplyr::distinct(out)

  # sort columns according to terms
  out <- out[, order(match(names(out), c("scientificNameStd")))]
  return(out)
}
