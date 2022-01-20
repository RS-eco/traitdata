#'
#' @name traitdata
#' @docType package
#' @title traitdata: Easy access to various animal trait data
#' @description R package to access 32 different trait datasets covering numerous taxa.
#' @details traitdata provides an easy way to access 32 publicly available trait datasets 
#' (Amniota, Amphibian life-history traits, AmphiBio, Arthropods, Bird behaviour, Carabids, CLIMBER, EltonTraits, 
#' Eubirds, Heteroptera, Lizard traits, mammal_diet, mammal_diet2, Migratory behaviour of birds, PanTHERIA, 
#' Passerines, life history traits of reptiles and TetraDensity), 
#' which contain information on numerous taxonomic groups.
#'
#' It has three main utilities:
#'
#' \itemize{
#' \item Easy access to various trait datasets
#' \item Standardised taxonomic information for all data records, based on species level only
#' \item Standardised glossary of all datasets
#' \item Simple joining of multiple data sources based on their standardised taxonomic information
#' }
#'
#' To learn more about traitdata, start with the \code{vignette("access-data")} vignette.
#' 
#' @author RS-eco
#' @keywords package
#'
NULL
#'
#'#' @docType data
#' @name amniota
#' @title Amniote life-history traits
#' @description An amniote life-history database to perform comparative analyses
#'   with birds, mammals, and reptiles.
#' @usage data(amniota)
#' @details Studying life-history traits within and across taxonomic
#'   classifications has revealed many interesting and important patterns, but
#'   this approach to life history requires access to large compilations of data
#'   containing many different life-history parameters. Currently, life-history
#'   data for amniotes (birds, mammals, and reptiles) is split among a variety
#'   of publicly available databases, data tables embedded in individual papers
#'   and books, and species-specific studies by experts. Using data from this
#'   wide range of sources is a challenge for conducting macroecological studies
#'   because of a lack of standardization in taxonomic classifications,
#'   parameter values, and even in which parameters are reported. In order to
#'   facilitate comparative analyses between amniote life-history data, we
#'   created a database compiled from peer-reviewed studies on individual
#'   species, macroecological studies of multiple species, existing life-history
#'   databases, and other aggregated sources as well as published books and
#'   other compilations. First, we extracted and aggregated the raw data from
#'   the aforementioned sources. Next, we resolved spelling errors and other
#'   formatting inconsistencies in species names through a number of
#'   computational and manual methods. Once this was completed, subspecies-level
#'   data and species-level data were shared via a data-sharing algorithm to
#'   accommodate the variety of species transformations (taxonomic promotions,
#'   demotions, merges, divergences, etc.) that have occurred over time.
#'   Finally, in species where multiple raw data points were identified for a
#'   given parameter, we report the median value. Here, we report a normalized
#'   and consolidated database of up to 29 life-history parameters, containing
#'   at least one life-history parameter for 21 322 species of birds, mammals,
#'   and reptiles.
#' @format A \code{data.frame} with 21330 observations and 37 variables.
#' @section Measures:
#' 
#' \itemize{ 
#'     \item Class, Order, Family, Genus, Species, Subspecies, common_name, 
#'     \item female_maturity_d, litter_or_clutch_size_n, litters_or_clutches_per_y, adult_body_mass_g, 
#'     \item maximum_longevity_y, gestation_d, weaning_d, birth_or_hatching_weight_g, weaning_weight_g,
#'     \item egg_mass_g, incubation_d, fledging_age_d, longevity_y, male_maturity_d, inter_litter_or_interbirth_interval_y,
#'     \item female_body_mass_g, male_body_mass_g, no_sex_body_mass_g, egg_width_mm, egg_length_mm,
#'     \item adult_svl_cm, male_svl_cm, female_svl_cm, birth_or_hatching_svl_cm,
#'     \item female_svl_at_maturity_cm, female_body_mass_at_maturity_g, no_sex_svl_cm, no_sex_maturity_d,
#'     \item scientificNameStd
#'   }
#' @source Cite this dataset as: \itemize{ \item P. Myhrvold, Nathan; Baldridge,
#'   Elita; Chan, Benjamin; Sivam, Dhileep; L. Freeman, Daniel; Ernest, S. K.
#'   Morgan (2016): An amniote life-history database to perform comparative
#'   analyses with birds, mammals, and reptiles. \url{http://esapubs.org/archive/ecol/E096/269/}.}
#'   
#'   \href{http://creativecommons.org/publicdomain/zero/1.0/}{Creative Commons 
#'   0}. To the extent possible under law, the authors have waived all copyright
#'   and related or neighboring rights to this data.
#'   
NULL
#'
#' @docType data
#' @name amphi_lifehist
#' @title Life-history traits of European amphibians
#' @description A database of life-history traits of European amphibians
#' @usage data(amphi_lifehist)
#' @details In the current context of climate change and landscape fragmentation, efficient
#' conservation strategies require the explicit consideration of life history traits. This is 
#' particularly true for amphibians, which are highly threatened worldwide, composed by more 
#' than 7400 species, which is constitute one of the most species-rich vertebrate groups. The
#' collection of information on life history traits is difficult due to the ecology of species and
#' remoteness of their habitats. It is therefore not surprising that our knowledge is limited, and
#' missing information on certain life history traits are common for in this species group. We
#' compiled data on amphibian life history traits from literature in an extensive database with
#' morphological and behavioral traits, habitat preferences and movement abilities for 86
#' European amphibian species (50 Anuran and 36 Urodela species). When it were available,
#' we reported data for males, females, juveniles and tadpoles. Our database may serve as
#' an important starting point for further analyses regarding amphibian conservation.
#' @format A \code{data.frame} with 86 observations and 256 variables.
#' @source Cite this dataset as: \itemize{\item Trochet A, Moulherat S, Calvez O, Stevens V, Clobert J, Schmeller D (2014) A database of life-history
#' traits of European amphibians. Biodiversity Data Journal 2: e4123. \href{http://doi.org/10.3897/BDJ.2.e4123}{10.3897/BDJ.2.e4123}.}
#' 
NULL
#'
#' @docType data
#' @name amphibio
#' @title A global database for amphibian ecological traits
#' @description A comprehensive database of natural history traits for amphibians worldwide.
#' @usage data(amphibio)
#' @details Current ecological and evolutionary research are increasingly moving from species- to trait-based approaches
#' because traits provide a stronger link to organism's function and fitness. Trait databases covering a large number of species
#' are becoming available, but such data remains scarce for certain groups. Amphibians are among the most diverse vertebrate groups
#' on Earth, and constitute an abundant component of major terrestrial and freshwater ecosystems. They are also facing rapid population
#' declines worldwide, which is likely to affect trait composition in local communities, thereby impacting ecosystem processes
#' and services. In this context, we introduce AmphiBIO, a comprehensive database of natural history traits for amphibians worldwide.
#' The database releases information on 17 traits related to ecology, morphology and reproduction features of amphibians. We compiled data
#' from more than 1500 literature sources, and for more than 6500 species of all orders, 61 families and 531 genera. 
#' This database has the potential to allow unprecedented large-scale analyses in ecology, evolution and conservation of amphibians.
#' @format A \code{data.frame} with 6776 observations and 39 variables.
#' @section Measures:
#' \itemize{
#'     \item id, Order, Family, Genus, Species,
#'     \item Fos, Ter, Aqu, Arb, Leaves, Flowers, Seeds, Fruits,
#'     \item Arthro, Vert, Diu, Noc, Crepu, Wet_warm, Wet_cold, Dry_warm, Dry_cold,
#'     \item Body_mass_g, Age_at_maturity_min_y, Age_at_maturity_max_y, Body_size_mm,
#'     \item Size_at_maturity_min_mm, Size_at_maturity_max_mm, Longevity_max_y, Litter_size_min_n, Litter_size_max_n,
#'     \item Reproductive_output_y, Offspring_size_min_mm, Offspring_size_max_mm, Dir, Lar, Viv, OBS,
#'     \item scientificNameStd
#'   }
#' @source Cite this dataset as: \itemize{\item Oliveira, B.F., Sao-Pedro, V.A., Santos-Barrera, G., Penone,
#' C. & Costa, G.C. (2017). AmphiBIO, a global database for amphibian ecological traits.
#' Scientific Data. \href{https://www.nature.com/articles/sdata2017123}{10.1038/sdata.2017.123}.}
#'
#' Please also cite the data repository on figshare: \itemize{\item Oliveira, Brunno Freire; Sao-Pedro, 
#' Vinicius Avelar; Santos-Barrera, Georgina; Penone, Caterina; C. Costa, Gabriel (2017):
#' AmphiBIO_v1. \href{https://doi.org/10.6084/m9.figshare.4644424.v5}{10.6084/m9.figshare.4644424.v5}.}
#' 
NULL
#'
#'@docType data
#' @name an_age
#' @title Database of Animal Ageing and Longevity
#' @description Data on animal ageing and longevity
#' @usage data(an_age)
#' @format A \code{data.frame} with 4219 observations and 32 variables.
#' @details The data set comprises data on the age and longevity of multiple animal species
#' @source When using this data, please cite the original publication:
#'   \itemize{\item  Tacutu, R., Craig, T., Budovsky, A., Wuttke, D., Lehmann, G., Taranukha, D., Costa, J., Fraifeld, V. E., de Magalhaes, J. P. (2013)
#'   "Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing." 
#'   Nucleic Acids Research 41(D1):D1027-D1033.}
#'   
NULL
#'
#'@docType data
#' @name anuran_morpho
#' @title Database of Animal Ageing and Longevity
#' @description Data on animal ageing and longevity
#' @usage data(anuran_morpho)
#' @format A \code{data.frame} with 4623 observations and 29 variables.
#' @details The data set comprises morphological data for Colombian anuran species.
#' @source When using this data, please cite the original publication:
#'    \itemize{\item  Mendoza-Henao et al. (2019) 
#'    "A morphological database for Colombian anuran species from conservation‐priority ecosystems." 
#'    Ecology 100.}
#'   
NULL
#'
#' @docType data
#' @name arthropods
#' @title Functional Arthropod Traits
#' @description A summary of eight traits of Coleoptera, Hemiptera, Orthoptera and Araneae, occurring in grasslands in Germany.
#' @usage data(arthropods)
#' @format A \code{data.frame} with 1230 observations and 19 variables.
#' @section Measures:
#'
#' \itemize{ 
#'     \item Order, Suborder, Family, SpeciesID, Genus, Species, Author
#'     \item Body_Size, Dispersal_ability,
#'     \item Feeding_guild, Feeding_guild_short, Feeding_mode, Feeding_specialization, Feeding_tissue, Feeding_plant_part,
#'     \item Endophagous_lifestyle, Stratum_use, Stratum_use_short, Remark,
#'     \item scientificNameStd
#'     }
#' @details The data set comprises literature trait data of species that were sampled and 
#' measured in a project within the Biodiversity Exploratories which focuses on the effect of land use 
#' on arthropod community composition and related processes in three regions of Germany
#' @source When using this data, please cite the original publication:
#' 
#'   \itemize{\item  Gossner MM, Simons NK, Achtziger R, Blick T, Dorow WHO,
#'   Dziock F, Koehler F, Rabitsch W, Weisser WW (2015) A summary of eight traits
#'   of Coleoptera, Hemiptera, Orthoptera and Araneae, occurring in grasslands
#'   in Germany. Scientific Data. \url{http://dx.doi.org/10.1038/sdata.2015.13}.}
#'   
#'   Additionally, please cite the Dryad data package:
#'   
#'   \itemize{\item  Gossner MM, Simons NK, Achtziger R, Blick T, Dorow WHO, Dziock F, Koehler F, 
#'   Rabitsch W, Weisser WW (2015) Data from: A summary of eight traits of Coleoptera, 
#'   Hemiptera, Orthoptera and Araneae, occurring in grasslands in Germany. 
#'   Dryad Digital Repository. \url{http://dx.doi.org/10.5061/dryad.53ds2}.}
#'   
NULL
#'
#'@docType data
#' @name atlantic_birds
#' @title Database of Atlantic bird morphological traits
#' @description Data on morphological traits of Atlantic forest birds
#' @usage data(atlantic_birds)
#' @format A \code{data.frame} with 72483 observations and 83 variables.
#' @details The data set comprises morphological traits of birds from the Atlantic forests of South America
#' @source When using this data, please cite the original publication:
#'   \itemize{\item  Rodrigues et al. (2019) 
#'   "ATLANTIC BIRD TRAITS: a data set of bird morphological traits from the Atlantic forests of South America." 
#'   Ecology 100.}
#'   
NULL
#'
#'@docType data
#' @name australian_birds
#' @title Database of Australian birds
#' @description Data on Australian bird traits
#' @usage data(australian_birds)
#' @format A \code{data.frame} with 2056 observations and 230 variables.
#' @details The data set comprises biological, ecological, conservation and legal information 
#' for every species and subspecies of Australian birds
#' @source When using this data, please cite the original publication:
#'   \itemize{\item  Garnett et al. (2015)
#'   Biological, ecological, conservation and legal information for all species and subspecies of Australian bird. 
#'   Scientific Data.}
#'   
NULL
#'
#'@docType data
#' @name AvianBodySize
#' @title Database on Avian body sizes
#' @description Data on Avian bod sizes
#' @usage data(AvianBodySize)
#' @format A \code{data.frame} with 3802 observations and 46 variables.
#' @details Species‐specific measurements on male and female body mass, wing length, 
#' tarsus length, bill length, and tail length from major ornithological text books and 
#' some other sources covering bird species of Africa, Australia, New Zealand, 
#' Antarctica, North America, and the western Palearctic. These measurements were 
#' matched with measures of egg and clutch sizes, and scores of mating system, 
#' sexual display agility, and the degree of intersexual resource division. We present 
#' morphometric data ranging from 2350 species (minimum, tail length) to 2979 species (maximum, wing length) 
#' where measurements for both sexes are known, some additional data where only one sex or unsexed birds 
#' have been measured, and explanatory data ranging from 1218 species (minimum, display agility) 
#' to 2603 species (maximum, egg mass). In total, 3769 species from 125 of 146 different bird families are included.
#' @source When using this data, please cite the original publication:
#' \itemize{\item  Lislevand et al. 2007 AVIAN BODY SIZES IN RELATION TO FECUNDITY, 
#' MATING SYSTEM, DISPLAY BEHAVIOR, AND RESOURCE SHARING Ecology.}.
#'   
NULL
#'
#' @docType data
#' @name bird_behav
#' @title Foraging behaviour and dietary niche of birds
#' @description Foraging behaviour and dietary niche of birds
#' @usage data(bird_behav)
#' @format A \code{data.frame} with 9658 observations and 19 variables.
#' @details A dataset for 9658 bird species describing IUCN Red List and Threat category, range size and body mass, 
#' foraging behaviour and diet, ... 
#' @section Measures:
#'
#' \itemize{
#'   \item Genus, Species, Family
#'   \item RedlistCategory, Threat, LogRangeSize, LogBodyMass, Diet, Foraging, Migration, MatingSystem, NestPlacement, Territoriality, Habitat, 
#'   IslandDwelling, LogClutchSize, LogNightLights, LogHumanPopulationDensity
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{\item Tobias J. A., Pigot, A. L. (2019)
#' Integrating behaviour and ecology into global biodiversity conservation strategies. Phil. Trans. R. Soc. B, 374, 1781.
#' \url{http://doi.org/10.1098/rstb.2019.0012}.}
#' 
NULL
#'
#' @docType data
#' @name carabids
#' @title Carabid morphological traits
#' @description Average body measures of 120 Carabid species occuring in the Netherlands.
#' @usage data(carabids)
#' @details Carabid morphological traits. Column names are described below.
#' @format A \code{data.frame} with 121 observations and 12 variables.
#' @section Measures:
#' \itemize{
#'     \item name_correct = species name,
#'     \item source_measurement = researcher who performed measurement,
#'     \item body_length = body length in mm,
#'     \item antenna_length = antenna length in mm,
#'     \item metafemur_length = length metafemur in mm,
#'     \item eyewith_corr = eye width in mm,
#'     \item note = note,
#'     \item resid_femur = residual femur length in mm (i.e. residual from 
#'        linear model in which femur length is explained by body length),
#'     \item resid_eye = residual eye length in mm (i.e. residual from linear 
#'        model in which eye length is explained by body length),
#'     \item resid_antenna = residual antenna length in mm (i.e. residual 
#'        from linear model in which antenna length is explained by body length),
#'     \item scientificNameStd
#'   }
#' @source When using this data, please cite the original publication:
#'
#'   \itemize{ \item van der Plas F, van Klink R, Manning P, Olff H, Fischer M
#'   (2017) Sensitivity of functional diversity metrics to sampling intensity.
#'   Methods in Ecology and Evolution 8(9): 1072-1080.
#'   \url{https://doi.org/10.1111/2041-210x.12728}.}
#'
#'   Additionally, please cite the Dryad data package:
#'
#'   \itemize{ \item van der Plas F, van Klink R, Manning P, Olff H, Fischer M
#'   (2017) Data from: Sensitivity of functional diversity metrics to sampling
#'   intensity. Dryad Digital Repository. \url{https://doi.org/10.5061/dryad.1fn46}.}
#'   
NULL
#'
#' @docType data
#' @name climber
#' @title Climatic niche characteristics of European butterflies
#' @description Climatic niche characteristics of the butterflies in Europe
#' @usage data(climber)
#' @format A \code{data.frame} with 397 observations and 69 variables.
#' @details Detailed information on species' ecological niche characteristics that can be related to declines and 
#' extinctions is indispensable for a better understanding of the relationship between the occurrence and 
#' performance of wild species and their environment and, moreover, for an improved assessment of the impacts of
#' global change. Knowledge on species characteristics such as habitat requirements is already available in the
#' ecological literature for butterflies, but information about their climatic requirements is still lacking. Here
#' we present a unique dataset on the climatic niche characteristics of 397 European butterflies representing
#' 91% of the European species. These characteristics were obtained by combining detailed information on 
#' butterfly distributions in Europe and the corresponding climatic conditions. The presented dataset comprises information for
#' the position and breadth of the following climatic niche characteristics: mean annual temperature, range
#' in annual temperature, growing degree days, annual precipitation sum, range in annual precipitation and
#' soil water content. The climatic niche position is indicated by the median and mean value for each climate
#' variable across a species' range, accompanied by the 95% confidence interval for the mean and the number
#' of grid cells used for calculations. Climatic niche breadth is indicated by the standard deviation and the
#' minimum and maximum values for each climatic variable across a species' range. Database compilation
#' was based on high quality standards and the data are ready to use for a broad range of applications.
#' It is already evident that the information provided in this dataset is of great relevance for basic and applied ecology. 
#' Based on the species temperature index (STI, i.e. the mean temperature value per species),
#' the community temperature index (CTI, i.e. the average STI value across the species in a community) was
#' recently adopted as an indicator of climate change impact on biodiversity by the pan-European framework
#' supporting the Convention on Biological Diversity (Streamlining European Biodiversity Indicators 2010)
#' and has already been used in several scientific publications. The application potential of this database
#' ranges from theoretical aspects such as assessments of past niche evolution or analyses of trait interdependencies 
#' to the very applied aspects of measuring, monitoring and projecting historical, ongoing and
#' potential future responses to climate change using butterflies as an indicator.
#' @source Cite this dataset as \itemize{ \item Schweiger O, Harpke A, Wiemers M, Settele J (2014) 
#' CLIMBER: Climatic niche characteristics of the butterflies in Europe. ZooKeys 367:65-84. 
#' \url{http://dx.doi.org/10.3897/zookeys.367.6185}.}
#' 
NULL
#'
#' @docType data
#' @name disperse
#' @title Dispersal potential of European aquatic macroinvertebrates
#' @description Dataset on the dispersal potential of European aquatic macroinvertebrates
#' @usage data(disperse)
#' @format A \code{data.frame} with 482 observations and 46 variables.
#' @details This dataset contains information about the dispersal potential of 
#' European aquatic macroinvertebrates
#' @section Measures:
#'  
#' \itemize{
#'   \item Group, Family, Genus, Species, Synonyms
#'   \item Maximum body size (s1 - s7, Ref_s), Life cycle duration (cd1, cd2, Ref_cd), 
#'   Potential number of reproductive cycles per year (cy1, cy2, cy3, Ref_cy),
#'   Dispersal strategy (dis1 - dis4, Ref_dis), Adult life span (life1 - life4, Ref_life),
#'   Female wing length (mm) (fwl1 - fwl8, fwl_info, Ref_fwl),
#'   Wing pair type (wnb1 - wnb5, Ref_wnb), 
#'   Lifelong fecundity (number of eggs per female) (egg1 - egg4, Ref_egg),
#'   Propensity to drift (drift1, drift2, drift3, Ref_drift)
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as \itemize{ \item Sarremejane, R., Cid, N., Stubbington, R. et al. 
#' DISPERSE, a trait database to assess the dispersal potential of European aquatic macroinvertebrates. 
#' Sci Data 7, 386 (2020). \url{https://doi.org/10.1038/s41597-020-00732-7}.}
#'   
NULL
#'
#' @docType data
#' @name elton_birds
#' @title Foraging attributes of birds
#' @description Dataset on the foraging attributes of birds
#' @usage data(elton_birds)
#' @format A \code{data.frame} with 9760 observations and 43 variables.
#' @details This csv file contains information about the foraging attributes of
#'   birds from the EltonTraits dataset.
#' @section Measures:
#'  
#' \itemize{
#'   \item SpecID, PassNonPass, Order, Family, BLFamilyEnglish, BLFamSequID, Taxo, Genus, Species, English,
#'   \item Diet.Inv, Diet.Vend, Diet.Vect, Diet.Vfish, Diet.Vunk, Diet.Scav, Diet.Fruit, Diet.Nect, Diet.Seed, 
#'   Diet.PlantO, Diet.5Cat, Diet.Source, Diet.Certainty, Diet.EnteredBy, ForStrat.watbelowsurf, ForStrat.wataroundsurf, 
#'   ForStrat.ground, ForStrat.understory, ForStrat.midhigh, ForStrat.canopy, ForStrat.aerial, PelagicSpecialist, ForStrat.Source,
#'   ForStrat.SpecLevel, ForStrat.EnteredBy, Nocturnal, BodyMass.Value, BodyMass.Source, BodyMass.SpecLevel, BodyMass.Comment, 
#'   Record.Comment, Full.Reference,
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as \itemize{ \item Hamish Wilman, Jonathan Belmaker, Jennifer Simpson, 
#'   Carolina de la Rosa, Marcelo M. Rivadeneira, and Walter Jetz. (2014). EltonTraits 1.0: Species-level 
#'   foraging attributes of the world's birds and mammals. Ecology 95:2027. \url{http://dx.doi.org/10.1890/13-1917.1}.}
#'   
NULL
#'
#' @docType data
#' @name elton_mammals
#' @title Foraging attributes of mammals
#' @description Dataset on the foraging attributes of mammals
#' @usage data(elton_mammals)
#' @format A \code{data.frame} with 5400 observations and 29 variables.
#' @details This csv file contains information about the foraging attributes of
#'   mammals from the EltonTraits dataset.
#' @section Measures:
#'  
#' \itemize{
#'   \item MSW3_ID, Genus, Species, Family, 
#'   \item Diet.Inv, Diet.Vend, Diet.Vect, Diet.Vfish, Diet.Vunk, Diet.Scav, Diet.Fruit, Diet.Nect, Diet.Seed, Diet.PlantO, Diet.Source,
#'   Diet.Certainty, ForStrat.Value, ForStrat.Certainty, ForStrat.Comment, Activity.Nocturnal, Activity.Crepuscular, Activity.Diurnal, 
#'   Activity.Source, Activity.Certainty, BodyMass.Value, BodyMass.Source, BodyMass.SpecLevel, Full.Reference,
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as \itemize{ \item Hamish Wilman, Jonathan Belmaker, Jennifer Simpson, 
#'   Carolina de la Rosa, Marcelo M. Rivadeneira, and Walter Jetz. (2014). EltonTraits 1.0: Species-level 
#'   foraging attributes of the world's birds and mammals. Ecology 95:2027. \url{http://dx.doi.org/10.1890/13-1917.1}.}
#'   
NULL
#'
#' @docType data
#' @name epiphytes
#' @title Vascular epiphytes traits
#' @description Vascular epiphytes traits
#' @usage data(epiphytes)
#' @format A \code{data.frame} with 84109 observations and 9 variables.
#' @details A dataset of 76,561 trait observations for 2,882 species of vascular epiphytes. 
#' @section Measures:
#'
#' \itemize{
#'   \item Contributor, siteID, Individual, Genus, Species
#'   \item trait, trait_value, unit
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{\item Hietz, P., Wagner, K., Nunes Ramos, F., 
#' Cabral, J. S., Agudelo, C., Benavides, A. M., Cach-Pérez, M. J., Cardelús, C. L., 
#' Chilpa Galván, N., Erickson Nascimento da Costa, L., de Paula Oliveira, R., 
#' Einzmann, H. J. R., de Paiva Farias, R., Guzmán Jacob, V., Kattge, J., 
#' Kessler, M., Kirby, C., Kreft, H., Krömer, T., ... Zotz, G. (2021). 
#' Putting vascular epiphytes on the traits map. Journal of Ecology, 00, 1–19.
#' \url{https://doi.org/10.1111/1365-2745.13802}.}
#'
#' Additionally, please cite the Dryad data package: \itemize{\item Hietz, Peter (2021)
#' Data from: Putting vascular epiphytes on the traits map.
#' Dryad Digital Repository. \url{https://doi.org/10.5061/dryad.7wm37pvtf}.}
#' 
NULL
#'
#' @docType data
#' @name eubirds
#' @title Life-history of European birds
#' @description Life-history of European birds
#' @usage data(eubirds)
#' @format A \code{data.frame} with 499 observations and 85 variables.
#' @details A dataset for 499 bird species breeding in Europe and 34 key life-history traits 
#' represented in 85 variables. As a primary source of information we used the comprehensive 
#' handbook The birds of the Western Palearctic. The traits provide information about 
#' species-specific mean values. We did not record values for different geographical subspecies.
#' We chose several types of avian traits, such as morphological, reproductive 
#' and behavioural traits, dietary and habitat preferences.
#' @section Measures:
#'
#' \itemize{
#'   \item ID, Order, Family, Genus, Species,
#'   \item LengthU_MEAN , WingU_MEAN, WingM_MEAN, WingF_MEAN, TailU_MEAN, TailM_MEAN, TailF_MEAN, BillU_MEAN,
#'   BillM_MEAN, BillF_MEAN, TarsusU_MEAN, TarsusM_MEAN, TarsusF_MEAN, WeightU_MEAN, WeightM_MEAN, WeightF_MEAN,
#'   Sexual.dimorphism, Clutch_MIN, Clutch_MAX, Clutch_MEAN, Broods.per.year, EggL_MEAN, EggW_MEAN, Egg_MASS, Young,
#'   Association.during.nesting, Nest.type, Nest.building, Mating.system, Incubation.period, Incubation.sex,
#'   Hatching, Eggshells, Nestling.period, Fledging.period, Parental.feeding, Age.of.independence, Feeding.independence,
#'   Age.of.first.breeding, Life.span, Post.fledging.mortality, Mortality.of.adults, Association.outside.the.breeding.season,
#'   Territoriality, Sedentary, Facultative.migrant, Short.distance.migrant, Long.distance.migrant, Deciduous.forest,
#'   Coniferous.forest, Woodland, Shrub, Savanna, Tundra, Grassland, Mountain.meadows, Reed, Swamps, Desert, Freshwater,
#'   Marine, Rocks, Human.settlements, Folivore_Y, Frugivore_Y, Granivore_Y, Arthropods_Y, Other.invertebrates_Y, Fish_Y,
#'   Other.vertebrates_Y, Carrion_Y, Omnivore_Y, Folivore_B, Frugivore_B, Granivore_B, Arthropods_B, Other.invertebrates_B,
#'   Fish_B, Other.vertebrates_B, Carrion_B, Omnivore_B, Data.source,
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{\item Storchova L, Horak D (2018)
#' Life-history characteristics of European birds. Global Ecology and Biogeography, 00, 1-7.
#' \url{https://doi.org/10.1111/geb.12709}.}
#'
#' Additionally, please cite the Dryad data package: \itemize{\item Storchova L, Horak D (2018)
#' Data from: Life-history characteristics of European birds.
#' Dryad Digital Repository. \url{https://doi.org/10.5061/dryad.n6k3n}.}
#' 
NULL
#'
#'@docType data
#' @name fishmorph
#' @title Morphological traits of freshwater fishes
#' @description Morphological traits of freshwater fishes
#' @usage data(fishmorph)
#' @format A \code{data.frame} with 8342 observations and 19 variables.
#' @details The database includes ten morphological traits measured on 
#' 10230 freshwater fish species, covering 59.71% of the world freshwater fish fauna.
#' @section Measures:
#' \itemize{
#'   \item Variable name, SpecCode, Superorder, Order, 
#'   Family, Genus species,
#'   \item MBI (Maximum body length), BEl (Body elongation), 
#'   VEp (Vertical eye position), REs (Relative eye size), 
#'   OGp (Oral gape position), RMl (Relative maxillary length), 
#'   BLs (Body lateral shape), PFv (Pectoral fin vertical position), 
#'   PFs (Pectoral fin size), CPt (Caudal peduncle throttling), 
#'   Type of illustration, Reference
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{\item Brosse, S., Charpin, N., Su, G., 
#' Toussaint, A., Herrera, G., Tedesco, P.A., Villeger, S. (2021)
#' FISHMORPH: a global database on morphological traits of freshwater fishes. 
#' Global Ecology and Biogeography"", \url{https://doi.org/10.1111/geb.13395}.}
#' 
NULL
#'
#'@docType data
#' @name globalHWI
#' @title Avian hand-wing index data
#' @description A global database on Avian wing morphology
#' @usage data(globalHWI)
#' @format A \code{data.frame} with 10338 observations and 23 variables.
#' @details A global dataset of avian hand-wing index (HWI), 
#' an estimate of wing shape widely adopted as a proxy for dispersal ability in birds
#' @source Cite this dataset as: \itemize{\item Sheard et al. (2020) Ecological drivers of global 
#' gradients in avian dispersal inferred from wing morphology. Nature Communications.}
#' 
NULL
#'
#'@docType data
#' @name globTherm
#' @title Thermal tolerances for aquatic and terrestrial organisms
#' @description A global database on thermal tolerance for aquatic and terrestrial organisms
#' @usage data(globTherm)
#' @format A \code{data.frame} with 2134 observations and 47 variables.
#' @details How climate affects species distributions is a longstanding question receiving renewed interest owing to the
#' need to predict the impacts of global warming on biodiversity. Is climate change forcing species to live near
#' their critical thermal limits? Are these limits likely to change through natural selection? These and other
#' important questions can be addressed with models relating geographical distributions of species with
#' climate data, but inferences made with these models are highly contingent on non-climatic factors such as
#' biotic interactions. Improved understanding of climate change effects on species will require extensive
#' analysis of thermal physiological traits, but such data are both scarce and scattered. To overcome current
#' limitations, we created the GlobTherm database. The database contains experimentally derived species'
#' thermal tolerance data currently comprising over 2000 species of terrestrial, freshwater, intertidal and
#' marine multicellular algae, plants, fungi, and animals. The GlobTherm database will be maintained and
#' curated by iDiv with the aim to keep expanding it, and enable further investigations on the effects of
#' climate on the distribution of life on Earth.
#' @source Cite this dataset as: \itemize{\item Bennett, J. M. et al. (2018) GlobTherm, a global database on thermal tolerances for
#' aquatic and terrestrial organisms. Scientific Data. \url{https://doi.org/10.1038/sdata.2018.22}.}
#' 
NULL
#'
#' @docType data
#' @name heteroptera
#' @title Heteroptera morphometry traits
#' @description Morphometric measures of Heteroptera sampled in grasslands across three
#' regions of Germany.
#' @usage data(heteroptera)
#' @format A \code{data.frame} with 179 observations and 20 variables.
#' @details The data sets comprises measured morphometric traits of a total of 179 Heteroptera species that were 
#' sampled by sweep-netting on a total of 150 managed grassland plots across three regions in Germany between 2008 and 2012. 
#' These plots represent the whole range of grassland management intensities from extensively used pastures to mown pastures 
#' to intensively managed and fertilized meadows. In this paper we provide a database of mean values of 23 morphometric measures 
#' across sex and morphotypes for each sampled Heteroptera species. 
#' 
#' Morphological traits are assumed to be related to their adaptation and function in the environment. 
#' Thus the relative morphometric traits can be used as proxies for ecological features of a species 
#' that may affect its performance or fitness. Our database can be used by future trait-based studies 
#' for developing and testing hypotheses of the functional significance of these traits. 
#' 
#' Examples include studying the functional responses of insect communities to environmental drivers or 
#' studying how the change in trait composition affects ecosystem processes. 
#' @section Measures:
#'  
#' \itemize{
#'   \item Order, Suborder, Family, SpeciesID, Genus, Species, Author,
#'   \item Body_length, Body_volume, Rel_wing_length, 
#'   \item Hind.Femur_shape, Rel_Hind.Femur_length, Rel_Rostrum_length, Front.Femur_shape, 
#'   \item Body_shape, Rel_eye_size, Rel_Antenna_length, Schwaebische_Alb, Hainich, Schorfheide.Chorin,
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{\item M. Gossner, Martin; K. Simons,
#'   Nadja; Hoeck, Leonhard; W. Weisser, Wolfgang (2016): Morphometric measures
#'   of Heteroptera sampled in grasslands across three regions of Germany. 
#'   \url{https://doi.org/10.6084/m9.figshare.c.3307611.v1}.}
#'   
#'   \url{https://figshare.com/articles/Data_Paper_Data_Paper/3561936}.
#'   
NULL
#'
#' @docType data
#' @name heteropteraRaw
#' @title Heteroptera morphometry traits
#' @description Morphometric measures of Heteroptera sampled in grasslands across three
#' regions of Germany.
#' @usage data(heteropteraRaw)
#' @format A \code{data.frame} with 425 observations and 36 variables.
#' @details The data sets comprises measured morphometric traits of a total of 179 Heteroptera species that were 
#' sampled by sweep-netting on a total of 150 managed grassland plots across three regions in Germany between 2008 and 2012. 
#' These plots represent the whole range of grassland management intensities from extensively used pastures to mown pastures 
#' to intensively managed and fertilized meadows. In this paper we provide a database of mean values of 23 morphometric measures 
#' across sex and morphotypes for each sampled Heteroptera species. 
#' Morphological traits are assumed to be related to their adaptation and function in the environment. 
#' Thus the relative morphometric traits can be used as proxies for ecological features of a species 
#' that may affect its performance or fitness. Our database can be used by future trait-based studies 
#' for developing and testing hypotheses of the functional significance of these traits. 
#' Examples include studying the functional responses of insect communities to environmental drivers or 
#' studying how the change in trait composition affects ecosystem processes. 
#' @section Measures:
#'  
#' \itemize{
#'   \item Order, Suborder, Family, SpeciesID, Genus, Species, Author,
#'   \item Body_length, Body_volume, Rel_wing_length, 
#'   \item Hind.Femur_shape, Rel_Hind.Femur_length, Rel_Rostrum_length, Front.Femur_shape, 
#'   \item Body_shape, Rel_eye_size, Rel_Antenna_length, Schwaebische_Alb, Hainich, Schorfheide.Chorin,
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{\item M. Gossner, Martin; K. Simons,
#'   Nadja; Hoeck, Leonhard; W. Weisser, Wolfgang (2016): Morphometric measures
#'   of Heteroptera sampled in grasslands across three regions of Germany. 
#'   \url{https://doi.org/10.6084/m9.figshare.c.3307611.v1}.}
#'   
#'   \url{https://figshare.com/articles/Data_Paper_Data_Paper/3561936}.
#'   
NULL
#'
#' @docType data
#' @name lizard_traits
#' @title Traits of lizards of the world
#' @description Geographical, morphological, ecological, physiological and life history traits for lizards of the world.
#' @usage data(lizard_traits)
#' @format A \code{data.frame} with 2692 observations and 50 variables.
#' @details The data sets comprises geographical, morphological, ecological, physiological and life history traits of 
#'   a total of 6657 known species of lizards.  
#' @source Cite this dataset as: \itemize{\item Meiri S. (2018) Traits of lizards of the world:
#' Variation around a successful evolutionary design. Global Ecol Biogeogr. \url{https://doi.org/10.1111/geb.12773}.}
#'   
#'  Additionally, please cite the Dryad data package: 
#' 
#' \itemize{ \item Meiri, Shai (2019), Data from: Traits of lizards of the world: 
#' variation around a successful evolutionary design, Dryad, Dataset, \url{https://doi.org/10.5061/dryad.f6t39kj}.}
#' 
NULL
#'
#' @docType data
#' @name mammal_diet
#' @title Mammal diet database
#' @description A comprehensive global dataset of diet preferences of mammals. 
#' Diet information was digitized from the literature and 
#' extrapolated for species with missing information. The original and 
#' extrapolated data cover species-level diet information for >99% of all 
#' terrestrial mammals.
#' @author [Kissling, W.D.](danielkissling@web.de), Dalby, L., Flojgaard, C.,
#'   Lenoir, J., Sandel, B., Sandom, C., Trojelsgaard, K., Svenning, J.
#' @usage data(mammal_diet)
#' @format A \code{data.frame} with 5374 observations and 31 variables.
#' @details Ecological trait data are essential for understanding the 
#'   broad-scale distribution of biodiversity and its response to global change.
#'   For animals, diet represents a fundamental aspect of species' evolutionary 
#'   adaptations, ecological and functional roles, and trophic interactions. 
#'   However, the importance of diet for macroevolutionary and macroecological 
#'   dynamics remains little explored, partly because of the lack of 
#'   comprehensive trait datasets. We compiled and evaluated a comprehensive 
#'   global dataset of diet preferences of mammals. Diet 
#'   information was digitized from two global and cladewide data sources and 
#'   errors of data entry by multiple data recorders were assessed. We then 
#'   developed a hierarchical extrapolation procedure to fill-in diet 
#'   information for species with missing information. Missing data were 
#'   extrapolated with information from other taxonomic levels (genus, other 
#'   species within the same genus, or family) and this extrapolation was 
#'   subsequently validated both internally (with a jack-knife approach applied 
#'   to the compiled species-level diet data) and externally (using independent 
#'   species-level diet information from a comprehensive continentwide data 
#'   source). Finally, we grouped mammal species into trophic levels and dietary
#'   guilds, and their species richness as well as their proportion of total 
#'   richness were mapped at a global scale for those diet categories with good 
#'   validation results. The success rate of correctly digitizing data was 94%, 
#'   indicating that the consistency in data entry among multiple recorders was 
#'   high. Data sources provided species-level diet information for a total of 
#'   2033 species (38% of all 5364 terrestrial mammal species, based on the IUCN
#'   taxonomy). For the remaining 3331 species, diet information was mostly 
#'   extrapolated from genus-level diet information (48% of all terrestrial 
#'   mammal species), and only rarely from other species within the same genus 
#'   (6%) or from family level (8%). Internal and external validation showed 
#'   that: (1) extrapolations were most reliable for primary food items; (2) 
#'   several diet categories had high proportions of correctly predicted 
#'   diet ranks; and (3) the potential of correctly extrapolating specific diet 
#'   categories varied both within and among clades. Global maps of species 
#'   richness and proportion showed congruence among trophic levels, but also 
#'   substantial discrepancies between dietary guilds. MammalDIET provides a 
#'   comprehensive, unique and freely available dataset on diet preferences for 
#'   all terrestrial mammals worldwide. It enables broad-scale analyses for 
#'   specific trophic levels and dietary guilds, and a first assessment of trait
#'   conservatism in mammalian diet preferences at a global scale. The 
#'   digitalization, extrapolation and validation procedures could be 
#'   transferable to other trait data and taxa.
#' @section Measures:
#'  
#' \itemize{
#'   \item TaxonID, Order, Family, Genus, Species,
#'   \item Animal, Vertebrate, Mammal, Bird, Herptile, Fish, Invertebrate,
#'   \item Plant, Seed, Fruit, Nectar, Root, Leaf, Woody, Herbaceous, Other,
#'   \item TaxonomicNote, FillCode, TrophicLevel,
#'   \item MammalEater, Insectivore, Frugivore, Granivore, Folivore, DataSource,
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: 
#' 
#' \itemize{ \item Kissling, W.D., Dalby, L., Flojgaard, C., Lenoir, J., Sandel, B., 
#'   Sandom, C., Trojelsgaard, K., Svenning, J. (2014). Establishing macroecological 
#'   trait datasets: digitalization, extrapolation, and validation of diet 
#'   preferences in terrestrial mammals worldwide. Ecol Evol, 4, 2913-2930. 
#'   \url{http://onlinelibrary.wiley.com/doi/10.1002/ece3.1136/}.}
#'   
#' Additionally, please cite the Dryad data package: 
#' 
#' \itemize{ \item Kissling WD, Dalby L, Flojgaard C, Lenoir J, 
#' Sandel B, Sandom C, Trojelsgaard K, Svenning J-C (2014) Data from: Establishing macroecological
#' trait datasets: digitalization, extrapolation, and validation of diet preferences in terrestrial 
#' mammals worldwide. Dryad Digital Repository. \url{https://doi.org/10.5061/dryad.6cd0v}.}
#' 
NULL
#'
#' @docType data
#' @name mammal_diet2
#' @title Mammal diet database
#' @description Combined mammal dietary dataset from Kissling et al. (2014) and the updated collected dietary information for 1261 mammalian species.
#' @author Gainsbury, Alison M., Tallowin, Oliver J. S., Meiri, Shai
#' @usage data(mammal_diet2)
#' @format A \code{data.frame} with 6625 observations and 31 variables.
#' @details 1. Diet is a key trait of an organism's life history that influences a broad spectrum of
#' ecological and evolutionary processes. Kissling et al. (2014) compiled a species-specific
#' dataset of diet preferences of mammals for 38% of a total of 5364 terrestrial mammalian
#' species assessed for the International Union for Conservation of Nature's Red List, to
#' facilitate future studies. The authors imputed dietary data for the remaining 62% by using
#' extrapolation from phylogenetic relatives. 2. We collected dietary information for 1261
#' mammalian species for which data were extrapolated by Kissling et al. (2014), in order to
#' evaluate the success with which such extrapolation can predict true diets. 3. The
#' extrapolation method devised by Kissling et al. (2014) performed well for broad dietary
#' categories (consumers of plants and animals). However, the method performed
#' inconsistently, and sometimes poorly, for finer dietary categories, varying in accuracy in both
#' dietary categories and mammalian orders. 4. The results of the extrapolation performance
#' serve as a cautionary tale. Given the large variation in extrapolation performance, we
#' recommend a more conservative approach for inferring mammalian diets, whereby dietary
#' extrapolation is implemented only when there is a high degree of phylogenetic conservatism
#' for dietary traits. Phylogenetic comparative methods can be used to detect and measure
#' phylogenetic signal in diet. If data for species are needed, then only the broadest feeding
#' categories should be used. This would ensure a greater level of accuracy and provide a more
#' robust dataset for further ecological and evolutionary analysis.
#' @source Cite this dataset as: 
#' 
#' \itemize{ \item Gainsbury, Alison M.; Tallowin, Oliver J. S.; Meiri, Shai (2019), 
#' An updated global dataset for diet preferences in terrestrial mammals: testing the validity of extrapolation. 
#' Mammal Review, 48, 160-167. \url{http://doi.org/10.1111/mam.12119}.}
#' 
NULL
#'
#'@docType data
#' @name marsupials
#' @title Life-history trait data of marsupials
#' @description Life-history traits of marsupials
#' @usage data(marsupials)
#' @format A \code{data.frame} with 161 observations and 77 variables.
#' @details Variation in life history and six candidate ecological variables: type of diet, extent of intraspecific competition, 
#' risk of juvenile mortality, diurnal pattern of activity, arboreality, and rainfall pattern of metatherian mammals
#' @source Cite this dataset as: \itemize{\item Fisher et al. (2001) 
#' THE ECOLOGICAL BASIS OF LIFE HISTORY VARIATION IN MARSUPIALS. Ecology 82.}
#' 
NULL
#'
#' @docType data
#' @name migbehav_birds
#' @title Migratory behaviour in birds
#' @description Dataset on the timing of bird migrations
#' @usage data(migbehav_birds)
#' @format A \code{data.frame} with 10596 observations and 31 variables.
#' @details The dataset focuses on seasonal migration, i.e. movements causing an individual 
#' adult bird to be found in different locations over the course of one year, 
#' excluding everyday routine movements (e.g. foraging movements) 
#' and one-way dispersal movements by juveniles (natal dispersal) or adults (Newton 2008). 
#' Types or categories of migratory behaviour and different subcategories were recorded and 
#' classified with the Handbook of the Birds of the World (del Hoyo 1992-2013 and 
#' updates on the Handbook of the Birds of the World Alive website www.hbw.com, 
#' accessed until September 2016).
#' @section Measures:
#'  
#' \itemize{
#'   \item IOC3_1_Order, IOC3_1_Family, Genus, Species 
#'   \item Extinct_full, Extinct_partial, Marine_full, Marine_partial, 
#'   \item Migr_dir_full, Migr_dir_partial Migr_dir_local
#'   \item Migratory_status: directional migratory: 1609 species, 
#'   dispersive migratory: 482 species, nomadic: 102 species, 
#'   resident: 8325 species, unknown: 78 species
#'   \item Migratory_status_2: full directional migrant: 531 species, partial directional migrant: 1078 species, 
#'   full dispersive migrant: 84 species, partial dispersive migrant: 398 species, full nomad: 33 species, 
#'   partial nomad: 69 species, full resident: 7912 species, partial resident: 413 species, unknown: 78 species
#'   \item Migratory_status_3: extinct: 155 species, marine: 247 species, full directional migrant: 526 species, 
#'   partial directional migrant: 1019 species, full dispersive migrant: 8 species, partial dispersive migrant: 319 species, 
#'   full nomad: 33 species, partial nomad: 68 species, full resident: 7793 species, partial resident: 409 species, 
#'   unknown: 19 species
#' }
#' @author [Alison Eyres](alison.eyres@senckenberg.de), K. Boehning-Gaese, S.A. Fritz
#' @source Cite this dataset as: 
#' 
#' \itemize{ \item Eyres, A., Boehning-Gaese, K., Fritz, S.A. (2017). Quantification of climatic niches in birds: 
#' adding temporal dimension. Journal of Avian Biology, 000, 001-015. 
#'   \url{https://onlinelibrary.wiley.com/doi/10.1111/jav.01308}.}
#'   
#' Additionally, please refer to the database description at:
#' \url{http://dataportal-senckenberg.de/database/metacat/bikf.10058.1/bikf}.
#' 
NULL
#'
#' @docType data
#' @name pantheria
#' @title PanTHERIA mammal traits
#' @author Kate E. Jones, Jon Bielby, Marcel Cardillo, Susanne A. Fritz, Justin
#'   O'Dell, C. David L. Orme, Kamran Safi, Wes Sechrest, Elizabeth H. Boakes,
#'   Chris Carbone, Christina Connolly, Michael J. Cutts, Janine K. Foster,
#'   Richard Grenyer, Michael Habib, Christopher A. Plaster, Samantha A. Price,
#'   Elizabeth A. Rigby, Janna Rist, Amber Teacher, Olaf R. P. Bininda-Emonds,
#'   John L. Gittleman, Georgina M. Mace, and Andy Purvis.
#' @description Here we describe a global species-level data set of key
#'   life-history, ecological and geographical traits of all known extant and
#'   recently extinct mammals (PanTHERIA) developed for a number of
#'   macroecological and macroevolutionary research projects.
#' @usage data(pantheria)
#' @format A \code{data.frame} with 5426 observations and 55 variables.
#' @details Data were gathered from the literature for 25 types of ecological
#'   and life history information for any extant or recently extinct species
#'   within class Mammalia (100740 data lines): 
#'   
#'   1. Activity Cycle; 2. Age at Eye Opening; 3. Age at First Birth; 4. Average
#'   Lifespan; 5. Body Mass; 6. Diet; 7. Dispersal Age; 8. Adult Limb Length; 9.
#'   Gestation Length; 10. Group Composition & Size; 11. Growth Data; 12.
#'   Habitat Layer; 13. Head-Body Length; 14. Interbirth Interval; 15. Litter
#'   size; 16. Litters Per Year; 17. Maximum Longevity; 18. Metabolic Rate; 19.
#'   Migratory Behaviour; 20. Mortality Data;  21. Population Density; 22.
#'   Ranging Behaviour; 23. Sexual
#'   Maturity Age; 24. Teat Number; and 25. Weaning Age.
#'   
#'   30 specific variables (see Class IV, Table 1) were extracted from the above
#'   data types for PanTHERIA from a total of 94729 data lines (before error
#'   checking). Additionally, 4 variables were derived from extracted variables
#'   within PanTHERIA and 19 variables were calculated from other spatial data
#'   sources (see Class V, Section C).
#'   
#'   see \url{http://esapubs.org/archive/ecol/E090/184/metadata.htm} for further
#'   information.
#' @section Measures:
#'  
#' \itemize{
#'   \item Order, Family, Genus, Species, Binomial, 
#'   \item ActivityCycle, AdultBodyMass_g, AdultForearmLen_mm, AdultHeadBodyLen_mm, AgeatEyeOpening_d, AgeatFirstBirth_d, 
#'   BasalMetRate_mLO2hr, BasalMetRateMass_g, DietBreadth, DispersalAge_d, GestationLen_d, HabitatBreadth, HomeRange_km2, 
#'   HomeRange_Indiv_km2, InterbirthInterval_d, LitterSize, LittersPerYear, MaxLongevity_m, NeonateBodyMass_g, NeonateHeadBodyLen_mm, 
#'   PopulationDensity_n.km2, PopulationGrpSize, SexualMaturityAge_d, SocialGrpSize, TeatNumber, Terrestriality, TrophicLevel, 
#'   WeaningAge_d, WeaningBodyMass_g, WeaningHeadBodyLen_mm, References, AdultBodyMass_g_EXT, LittersPerYear_EXT, NeonateBodyMass_g_EXT,
#'   WeaningBodyMass_g_EXT, GR_Area_km2, GR_MaxLat_dd, GR_MinLat_dd, GR_MidRangeLat_dd, GR_MaxLong_dd, GR_MinLong_dd, 
#'   GR_MidRangeLong_dd, HuPopDen_Min_n.km2, HuPopDen_Mean_n.km2, HuPopDen_5p_n.km2, HuPopDen_Change, Precip_Mean_mm, 
#'   Temp_Mean_01degC, AET_Mean_mm, PET_Mean_mm,  
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: 
#' 
#' \itemize{ \item E. Jones, Kate; Bielby, Jon; Cardillo, Marcel; A. Fritz, Susanne; 
#'   O'Dell, Justin; David L. Orme, C.; Safi, Kamran; Sechrest, Wes; H. Boakes, Elizabeth; Carbone, Chris; Connolly, 
#'   Christina; Cutts, Michael J.; Foster, Janine K.; Grenyer, Richard; Habib, Michael; Plaster, Christopher A.; 
#'   Price, Samantha A.; Rigby, Elizabeth A.; Rist, Janna; Teacher, Amber; Bininda-Emonds, Olaf R. P.; 
#'   Gittleman, John L.; M. Mace, Georgina; Purvis, Andy (2009): PanTHERIA: a species-level database of life history, 
#'   ecology, and geography of extant and recently extinct mammals. \url{http://esapubs.org/archive/ecol/E090/184/metadata.htm}.}
#'   
NULL
#'
#' @docType data
#' @name passerines
#' @title Passerine morphology
#' @author [Robert E. Ricklefs](ricklefs@umsl.edu)
#' @description External measurements of approximately one-quarter of passerine bird species taken from Ricklefs 2017
#' @usage data(passerines)
#' @format A \code{data.frame} with 2374 observations and 28 variables
#' @details The data set includes eight measurements of the external morphology of 1642 species,
#' roughly one-quarter of all passerine birds (Aves: Order Passeriformes), from all parts of the world, 
#' characterizing the relative proportions of the wing, tail, legs, and beak. 
#' Specimens were measured opportunistically over the past 40 years in museums in the United States and Europe.
#' Numbers of individuals measured per species vary from one to dozens in some cases.
#' Measurements for males and females of sexually size-dimorphic species are presented separately.
#' The measurements include total length, the lengths of the wing, tail, tarsus, and middle toe,
#' and the length, breadth, and depth of the beak. Particular attention was paid to obtaining a
#' broad representation of passerine higher taxa, with special interest in small families and subfamilies of passerines, 
#' as well as species produced by evolutionary radiations of birds in archipelagoes, including the Galapagos, Hawaii, and the Lesser Antilles.
#' 
#' Geographic distributions are summarized from Edwards's Coded List of Birds of the World.
#' North American and South American species are particularly well represented in the sample, 
#' as well as species belonging to the families  Tyrannidae, Furnariidae, Thamnophilidae, Mimidae, 
#' Sturnidae, Fringillidae, Parulidae, Icteridae, Cardinalidae, and Thraupidae.
#' 
#' The following measurement techniques, paraphrased from Ricklefs and Travis (1980) were used: 
#' (1) total length was measured with a plastic ruler from the tip of the bill to the tip of tail; 
#' (2) we measured the length of the folded wing, which was flattened along a stiff ruler, 
#' from the wrist to the tip of the longest primary; 
#' (3) length of the tail was measured from the base of the feathers in the center of the tail 
#' to the tip of the longest rectrix. 
#' We used dial calipers to measure (0.1 mm) the lengths of the 
#' (4) tarsus, 
#' (5) middle toe (to the base of the claw), and 
#' (6) culmen from the tip of the upper mandible to its kinetic hinge at the front of the skull, and the 
#' (7) depth and
#' (8) width of the beak at the kinetic hinge.
#' #' @section Measures:
#'  
#' \itemize{
#'   \item Length, Wing, Tail, Tarsus, Toe, `Bill L`, `Bill W`, `Bill D`,
#'   \item HN, N, NI, HP, E, EI, O, OI, AU, AZ, AI, Sex,
#'   \item Order, Family, Subfamily, Genus, Species, `TIF No.`, `IOC NO.`,
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{ \item E. Ricklefs, Robert (2017): 
#'   Passerine morphology: external measurements of approximately one-quarter of passerine 
#'   bird species. Ecology, 98:1472. \href{http://doi.org/10.1002/ecy.1783}{10.1002/ecy.1783}.}
#'   
#'  The paper can be accessed, through: \url{http://onlinelibrary.wiley.com/doi/10.1002/ecy.1783/full}.
#'  
NULL
#'
#' @docType data
#' @name primates
#' @title Ecological traits of the world's primates
#' @description Ecological traits of the world's primates
#' @usage data(primates)
#' @format A \code{data.frame} with 2213 observations and 49 variables.
#' @details A database on some important ecological traits of the world’s primates (504 species), 
#' including home range size, locomotion type, diel activity, trophic guild, body mass, habitat type, 
#' current conservation status, population trend, and geographic realm. We compiled this information 
#' through a careful review of 1,216 studies published between 1941 and 2018, resulting 
#' in a comprehensive, easily accessible and user-friendly database. 
#' @source Cite this dataset as: \itemize{\item Galan-Acedo et al. (2019) Ecological traits 
#' of the world’s primates. Scientific Data 6.}
#' 
NULL
#' 
#' @docType data
#' @name reptile_lifehist
#' @title Life-history trait database of European reptile species
#' @description Life-history traits of European reptile species
#' @usage data(reptile_lifehist)
#' @format A \code{data.frame} with 1223 observations and 40 variables.
#' @details Life-history data are essential for providing answers to a wide range of questions in evolution, ecology, and
#' conservation biology. While life history data for many species, especially plants, are available online, life
#' history traits of European reptiles are available only widely scattered in different languages and primarily in printed media. 
#' For this reason, we generated a comprehensive trait database covering all European
#' reptile species. Data were compiled by searching the peer-reviewed and non-peer-reviewed literature. The
#' database covers the whole of Europe and neighbouring Asian and African countries. 
#' Traits were categorised under five main headings: Activity / Energy / Habitat; Phenology; Movement; Sexual Maturity; and
#' Morphometry. To ensure that the data were standardised, we defined trait data categories before we started
#' compiling data. All entries were checked by at least one other person. The dataset provides a unique source
#' for meta-analyses and modelling in ecology and conservation biology.
#' @source Cite this dataset as: \itemize{\item Grimm A, Ramirez AMP, Moulherat S, Reynaud J, Henle K (2014) 
#' Life-history trait database of European reptile species. Nature Conservation 9:45-67. 
#' \url{https://doi.org/10.3897/natureconservation.9.8908}.}
#' 
NULL
#' 
#' @docType data
#' @name tetra_density
#' @title Population density estimates in terrestrial vertebrates
#' @description Population density estimates in terrestrial vertebrates
#' @usage data(tetra_density)
#' @format A \code{data.frame} with 18246 observations and 22 variables.
#' @details A dataset for 2101 tetrapod species describing its population density at 1 degree from 1926 to 2017.
#' @section Measures:
#' 
#' \itemize{
#'   \item Class, Order, Family, Genus, Species, Subspecies
#'   \item Longitude, Latitude, Locality, Country, Year, Season/Month, Habitat, Sampling_Area, Sampling_Area_unit
#'   \item Density, Density_unit, Sampling_Method, Method_info, Notes, Ref_N
#'   \item scientificNameStd
#' }
#' @source Cite this dataset as: \itemize{\item Santini L., Isaac, N. J. B., Ficetola, G. F. (2018)
#' TetraDENSITY: A database of population density estimates in terrestrial vertebrates. Global Ecology and Biogeography, 27(7), 787-791.
#' \url{https://doi.org/10.1111/geb.12756}.}
#' 
NULL
#'
#' @docType data
#' @name synonyms
#' @title Synonym names for non-standardised species
#' @description Contains standardised names for species names, which could not be resolved 
#'by the `get_taxonomy` function.
#' @usage data(synonyms)
#' @format A \code{data.frame} with 726 observations and 3 variables 
#' (Genus, Species and Synonym).
#' @details This csv file contains all species names which could originally not be standardised using 
#' the `get_taxonomy` function, as species names were misspelled or old, and which were than manually corrected 
#' and checked and standardised again using the `get_taxonomy` function.
#' 
NULL
#'
#' @docType data
#' @name names_nonStd
#' @title Names of non-standardised species
#' @description Contains non-standardised names of species, which could not be resolved 
#'by the `get_taxonomy` function.
#' @usage data(names_nonStd)
#' @format A \code{data.frame} with 8231 observations and 3 variables 
#' (Genus, Species and scientificName).
#' @details This csv file contains all species names which could not be standardised using 
#' the `get_taxonomy` function, as species names were misspelled or old, and for which also no synonym was provided.
#' These species thus have an NA value for the scientificNameStd column in the respective dataset.
#' 
NULL
#'
#' @docType data
#' @name taxonomyStd
#' @title Standardised species names
#' @description Genus and species of all names contained within the dataset and their standardised scientific Name.
#' @usage data(taxonomyStd)
#' @format A \code{data.frame} with 35052 observations and 9 variables.
#' @details This csv file contains the genus and species of all species included in any of the datasets and
#'   their derived standardised scientific Name.
#' @section Measures:
#'  
#' \itemize{
#'   \item scientificName,
#'   \item Genus,
#'   \item Species,
#'   \item kingdom, phylum, order, class, family,
#'   \item scientificNameStd
#' }
#' 
NULL
#'
#' @docType data
#' @name trait_glossary
#' @title Trait glossary
#' @description Overview of the different trait variables contained in the trait datasets
#' @usage data(trait_glossary)
#' @format A \code{data.frame} with 354 observations and 8 variables.
#' @details This csv file contains information about all trait variables 
#'   contained within this package.
#' @section Measures:
#'  
#' \itemize{
#'   \item datasetName
#'   \item columnName
#'   \item valueType
#'   \item Classes
#'   \item Unit 
#'   \item Description
#'   \item Comment
#'   \item Reference
#'   }
#'   
NULL