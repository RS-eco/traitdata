#' Get accepted canonical names and taxonomy for a given species name
#'
#' @usage get_taxonomy(x, infraspecies = FALSE, preferred_data_sources=11,
#' fuzzy = TRUE, verbose = TRUE)
#' @param x a character string or vector of species names.
#' @param infraspecies logical. If TRUE, the given name is resolved to infraspecies taxon,
#' i.e. subspecies names will not be pooled (not working!)
#' @param preferred_data_sources Select the datasources that should be used for name matching, default is GBIF.
#' @param fuzzy logical. If TRUE, function tries fuzzy matching for species requests.
#' May produce output, if normal matching fails. (not working!)
#' @param verbose logical. If FALSE, warnings and messages are suppressed.
#'
#' @return a \code{data.frame} mapping the user supplied names to the accepted taxon names and
#' higher taxonomic information (kingdom, phylum, class, order, family, genus).
#'
#' @details If 'synonym' is returned as TRUE, the user provided name has been identified as a synonym and was mapped to an accepted name.
#' The field confidence reports the confidence of the matching procedure performed by the function 'get_gbifid_()' of the package 'taxize'.
#' The taxonID is a globally valid URI that links to the taxon description of the GBIF backbone taxonomy.
#' @source The initial code of this function was obtained from the `traitdataform` package,
#' which is also available on GitHub: \url{https://github.com/EcologicalTraitData/traitdataform}.
#' @author RS-eco
#' @examples
#' get_taxonomy(c("Chorthippus albomarginatus", "Conocephalus dorsalis", "Tetrix kraussi"))
#'
#' get_taxonomy("Equus burchellii")
#'
#' get_taxonomy(x="Aegotheles tatei")
#'
#' get_taxonomy("Equus quagga")
#' @export
get_taxonomy <- function(x, infraspecies = FALSE,
                         preferred_data_sources=11,
                         fuzzy = TRUE, verbose = TRUE) {
  # Install taxize package if not available
  if (!requireNamespace("taxize", quietly = TRUE)) {
    utils::install.packages("taxize")
  }

  if(length(x) > 1) { # recursive wrapping for vectorized input
    out <- lapply(x, FUN=function(x){
      out <- tryCatch(get_taxonomy(x), error=function(e) e) #The GAM model
      if(inherits(out, "error")){
        out <- data.frame(scientificName=x)
      }
      return(out)
    })
    if (!requireNamespace("dplyr", quietly = TRUE)) {
      utils::install.packages("dplyr")
    }
    out <- do.call(dplyr::bind_rows, out) # combine into data.frame
  } else {
    if(nchar(gsub(" ","",x)) <= 1 || is.null(x)) x <- NULL
    # spellchecking: resolve names using data source 11 (GBIF Backbone Taxonomy)
    resolved <- taxize::gnr_resolve(x,
                                    preferred_data_sources = preferred_data_sources,
                                    best_match_only = TRUE,
                                    canonical = TRUE)
    # return NA for unsuccessful matches
    if(is.null(resolved$matched_name2) || nchar(gsub(" ","",resolved$matched_name2)) == 0 ) {
      out <- data.frame(user_supplied_name = x)
      attributes(out)$warning <- paste("No matching species name found!")
      out$warnings <- paste(out$warnings, attributes(out)$warning, sep = "; ")
    } else {
      # get gbif ID and detailled information, e.g. synonym status
      temp <- taxize::get_gbifid_(resolved$matched_name2)[[1]]

      # switch for allowing for fuzzy matching
      if(any(temp$matchtype == "EXACT") || !fuzzy) temp[temp$matchtype == "EXACT",]

      # eliminate infraspecies (!! Needs improvement: this will make the function remove supraspecies taxa, too!)
      if(!infraspecies) temp <- subset(temp, rank == "species") #ask for rank according to name resolution provided

      # if given name is a synonym, do a new request for the accepted species name
      if(all(temp$status == "SYNONYM")) {
        out <- tryCatch(get_taxonomy(temp$species[which.max(temp$confidence)]), error=function(e) e)
        if(inherits(out, "error")){
          out <- data.frame(scientificName=x)
        }
        out$synonym = TRUE
        out$user_supplied_name = x
        attributes(out)$warning <- paste("Synonym provided! Automatically set to accepted species Name!")
        out$warnings <- paste(out$warnings, attributes(out)$warning, sep = "; ")
      } else {  # if given name is an accepted name, return result into 'out'
        if(any(temp$status %in% c("ACCEPTED", "DOUBTFUL") )) {
          temp <- temp[temp$status %in% c("ACCEPTED", "DOUBTFUL"),]
          out <- temp[which.max(temp$confidence),]

          # Install dplyr package if not available
          if (!requireNamespace("dplyr", quietly = TRUE)) {
            utils::install.packages("dplyr")
          }

          # add choice for fuzzy matching which returns warning
          out <- cbind(scientificName = x,
                       synonym = FALSE,
                       scientificNameStd = out$species,
                       author = sub(paste0(out$species," "), "", out$scientificname),
                       taxonRank = out$rank,
                       dplyr::select(out, dplyr::one_of("confidence", "kingdom", "phylum",
                                                        "class", "order", "family", "genus")),
                       taxonomy = "GBIF Backbone Taxonomy",
                       taxonID = paste0("http://www.gbif.org/species/", out$usagekey, ""),
                       warnings = ""
          )
        }
      }
      if(out$synonym[1] & verbose) warning(paste("Synonym provided! Automatically set to accepted species Name!"))
    }
  }
  class(out) <- c("data.frame")
  return(out)
}
