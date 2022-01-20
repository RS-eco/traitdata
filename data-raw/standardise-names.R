#' # Merge taxon names

#' Check how old the taxonomyStd file is and
#' if it is older than 90 days, delete it!
if(file.exists("data/taxonomyStd.rda")){
  current_date <- Sys.Date()
  file_date <- as.Date(tail(file.info("data/taxonomyStd.rda")$ctime))
  if(as.numeric(current_date - file_date) > 90){
    file.remove("data/taxonomyStd.rda")
  }
}

#' Read data files
datafiles <- list.files("data", pattern=".rda", full.names=T)
datafiles <- datafiles[!datafiles %in% c("data/taxonomyStd.rda", "data/synonyms.rda", 
                                         "data/trait_glossary.rda", "data/names_nonStd.rda")]
length(datafiles)
data <- lapply(datafiles, FUN=function(x) get(load(x)))

#' Subspecies names, are not considered for name matching

#' Merge data files and create species name vector
library(dplyr)
data <- lapply(data, FUN=function(x) select(x, "Genus", "Species"))
data_names <- Reduce(function(x,y) full_join(x,y, by=c("Genus", "Species")), data); rm(data)
library(magrittr)
data_names %<>% unique() %>%
  tidyr::unite(Genus, Species, col="scientificName", sep=" ", remove=F)

# Remove subspecies
data_names$scientificName <- gsub(x=data_names$scientificName, pattern="_", replacement=" ")
data_names$scientificName[data_names$scientificName == "Acrocephalus familiaris kingi"] <-
  "Acrocephalus familiaris"

# Change wrong scientificNames to their synonyms
load("data/synonyms.rda")
colnames(synonyms) <- c("Genus", "Species", "scientificName")
data_names <- anti_join(data_names, synonyms, by=c("Genus", "Species")) %>%
  bind_rows(synonyms)

# Get standardised species names
source("R/get_taxonomy.R")
source("R/standardize_taxonomy.R")
if(!file.exists("data/taxonomyStd.rda")){
  data_names$scientificName <- factor(data_names$scientificName)
  taxonomyStd <- standardize_taxonomy(x=data_names,
                                                 return=c("kingdom",
                                                          "phylum",
                                                          "class",
                                                          "order",
                                                          "family",
                                                          "scientificNameStd")); rm(data_names)
  taxonomyStd %<>% select("scientificName", "Genus", "Species", "kingdom",
                          "phylum", "class", "order", "family", "scientificNameStd")
  taxonomyStd$scientificName <- iconv(taxonomyStd$scientificName, "latin1", "UTF-8")
  taxonomyStd$Genus <- iconv(taxonomyStd$Genus, "latin1", "UTF-8")
  taxonomyStd$Species <- iconv(taxonomyStd$Species, "latin1", "UTF-8")
  taxonomyStd$scientificNameStd <- iconv(taxonomyStd$scientificNameStd, "latin1", "UTF-8")
  names_nonStd <- taxonomyStd[is.na(taxonomyStd$scientificNameStd),] %>% select(Genus, Species, scientificName)
  taxonomyStd <- taxonomyStd[!is.na(taxonomyStd$scientificNameStd),]
  save(taxonomyStd, file="data/taxonomyStd.rda", compress="xz")
  if(file.exists("data/names_nonStd.rda")){
    names_non_std_old <- get(load("data/names_nonStd.rda"))
    names_nonStd <- rbind(names_non_std_old, names_nonStd); rm(names_non_std_old)
    distinct(names_nonStd)
  }
  if(length(names_nonStd)){
    save(names_nonStd, file="data/names_nonStd.rda", compress="xz")
    print()
  }
} else{
  load("data/taxonomyStd.rda")
  
  # Only keep standardised names that are within the datasets
  taxonomyStd <- taxonomyStd[taxonomyStd$scientificName %in% data_names$scientificName,]
  
  # Get missing names
  names_new <- data_names[!data_names$scientificName %in% taxonomyStd$scientificName,]
  
  if(nrow(names_new) > 0){
    library(magrittr)
    #' Get new standardised species names
    names_new$scientificName <- factor(names_new$scientificName)
    names_new <- standardize_taxonomy(x=names_new,
                                                 return=c("kingdom", "phylum",
                                                          "class", "order",
                                                          "family", "scientificNameStd"))
    colnames(names_new)
    
    #' Merge the two standardised name files
    taxonomyStd <- plyr::rbind.fill(taxonomyStd, names_new)
    taxonomyStd$scientificName <- iconv(taxonomyStd$scientificName, "latin1", "UTF-8")
    taxonomyStd$kingdom <- iconv(taxonomyStd$kingdom, "latin1", "UTF-8")
    taxonomyStd$phylum <- iconv(taxonomyStd$phylum, "latin1", "UTF-8")
    taxonomyStd$class <- iconv(taxonomyStd$class, "latin1", "UTF-8")
    taxonomyStd$order <- iconv(taxonomyStd$order, "latin1", "UTF-8")
    taxonomyStd$family <- iconv(taxonomyStd$family, "latin1", "UTF-8")
    taxonomyStd$Genus <- iconv(taxonomyStd$Genus, "latin1", "UTF-8")
    taxonomyStd$Species <- iconv(taxonomyStd$Species, "latin1", "UTF-8")
    taxonomyStd$scientificNameStd <- iconv(taxonomyStd$scientificNameStd, "latin1", "UTF-8")
    
    #' Check non-standardised files with synonyms file
    names_nonStd <- taxonomyStd[is.na(taxonomyStd$scientificNameStd),]
    names_nonStd <- names_nonStd[,c("Genus", "Species", "scientificName")]
    
    #' Save non-standardised names to file
    if(nrow(names_nonStd) > 0){
      save(names_nonStd, file="data/names_nonStd.rda", compress="xz")
      message("There are still non-standardised names present!!!")
    } else{
      file.remove("data/names_nonStd.rda")
    }
    
    #' Save standardised names
    taxonomyStd <- taxonomyStd[!is.na(taxonomyStd$scientificNameStd),]
    save(taxonomyStd, file="data/taxonomyStd.rda", compress="xz")
  }
}

#' Add scientifcNameStd to original data files
data <- lapply(datafiles, FUN=function(x) get(load(x)) %>% left_join(taxonomyStd) %>%
                 select(-scientificName, -kingdom, -phylum, -order, -class, -family) %>%
                 droplevels())
names(data) <- sub(basename(datafiles), pattern=".rda", replacement="")

#' Save data files
for(i in 1:length(data)){
  assign(names(data)[[i]], data[[i]])
  save(list=ls(pattern=names(data)[[i]]), file = datafiles[i], compress="xz")
}

# Update synonyms file to only keep standardised Names
load("data/synonyms.rda")
colnames(synonyms) <- c("Genus", "Species", "scientificName")
load("data/taxonomyStd.rda")
taxon_sub <- taxonomyStd %>% distinct(scientificName, scientificNameStd)
synonyms <- inner_join(synonyms, taxon_sub, by="scientificName") %>% 
  select(-scientificNameStd)
save(synonyms, file="data/synonyms.rda", compress="xz")

#' Remove files from environment
rm(list=ls())
