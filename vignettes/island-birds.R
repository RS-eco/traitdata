## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval=F)

## -----------------------------------------------------------------------------
#  # Load islands data
#  data(largeislands, package="ggmap2")

## -----------------------------------------------------------------------------
#  # Read bird data
#  data(ter_birds_dist, package="rasterSp")
#  
#  # Add presence column
#  ter_birds_dist$presence <- 1
#  
#  # Calulate bird SR
#  library(dplyr)
#  sr_birds <- ter_birds_dist %>% group_by(x, y) %>%
#    summarise(sum = sum(presence))
#  library(ggmap2)
#  ggmap2(data=sr_birds, name="SR")

## -----------------------------------------------------------------------------
#  # Convert bird data to a spatial object
#  sp::coordinates(sr_birds) <- ~x+y
#  
#  # Make sure both files have the same projection
#  library(sp)
#  proj4string(sr_birds) <- sf::st_crs(largeislands)$proj4string

## -----------------------------------------------------------------------------
#  sr_birds <- raster::rasterFromXYZ(sr_birds)
#  sr_islands <- raster::extract(sr_birds, largeislands, fun=sum, na.rm=FALSE, sp=TRUE)
#  sr_islands <- sr_islands@data

## ---- eval=F------------------------------------------------------------------
#  write.csv(sr_islands, "sr_islands.csv", row.names=F)

## -----------------------------------------------------------------------------
#  library(dplyr)
#  arrange(sr_islands, sum) %>% head(10) %>% select(NAME_ENGLI, Island) %>% unique()

## ----eval=F-------------------------------------------------------------------
#  # Convert bird data to a spatial object
#  sp::coordinates(ter_birds_dist) <- ~x+y
#  
#  # Make sure both files have the same projection
#  proj4string(ter_birds_dist) <- sf::st_crs(largeislands)$proj4string
#  
#  # SF approach
#  
#  # Turn ter_birds into sf object
#  library(sf)
#  ter_birds_dist <- st_as_sf(ter_birds_dist)
#  island_birds <- ter_birds_dist[sf::st_within(ter_birds_dist, largeislands),]
#  
#  # Spatial approach
#  
#  # Turn large islands into an sp object
#  #largeislands <- as(largeislands, "Spatial")
#  
#  # Extract bird names occuring on islands
#  #island_birds <- sp::over(ter_birds_dist, largeislands)
#  #island_birds_all <- cbind(ter_birds_dist@data, island_birds)
#  #island_birds <- tidyr::drop_na(island_birds_all)
#  
#  # Only want to have unique names
#  island_birds <- unique(island_birds$species)
#  head(island_birds)

## ---- eval=F------------------------------------------------------------------
#  write.csv(island_birds, "island_birds.csv", row.names=F)

## -----------------------------------------------------------------------------
#  library(traitdata)
#  data(globTherm)

## ---- eval=F------------------------------------------------------------------
#  # Read island birds
#  island_birds <- read.csv("island_birds.csv")
#  
#  # Load standardised taxonomy
#  load("data/taxonomyStd.rda")
#  
#  # Change species column of island birds
#  colnames(island_birds) <- "scientificName"
#  
#  # Check which species have already a standardised taxonomy
#  island_birds %>% left_join(taxonomyStd)
#  
#  # Add standardised taxonomy of remaining species
#  #island_species <- traitdata::standardize_taxonomy(island_species,
#  #                                                      return="scientificNameStd")

## ---- eval=F------------------------------------------------------------------
#  #Merge data
#  island_birds_traits <- dplyr::full_join(island_species, globTherm, by="scientificNameStd")

## ---- eval=F------------------------------------------------------------------
#  # number of unique species
#  species_num <- length(unique(island_birds_traits$taxonomyStd))
#  
#  # island species with maximum thermal tolerance
#  species_tmax <- length(unique(island_birds_traits$taxonomyStd[which(!is.na(island_birds_traits$Tmax))]))

