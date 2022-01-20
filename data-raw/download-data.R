#' Passerine morphology
#' @importFrom readxl "readxlsx"
temp <- tempfile(fileext = ".zip")
download.file("https://esajournals.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fecy.1783&file=ecy1783-sup-0002-DataS1.zip", temp, method = "auto", quiet = TRUE, mode="wb")
unzip(temp, files = "Measurements of passerine birds.xlsx", exdir = ".")
unlink(temp)
passerines <- readxl::read_xlsx("Measurements of passerine birds.xlsx", 
                                na=c("."), sheet = 1)
passerines <- as.data.frame(passerines)
passerines$Sex <- factor(passerines$Sex)
colnames(passerines)[21] <- "Order"
colnames(passerines)[23] <- "Subfamily"
file.remove("Measurements of passerine birds.xlsx")
attr(passerines, 'citeAs') <- bibentry(
  bibtype = "Article",
  title = "Passerine morphology: external measurements of approximately one-quarter of passerine bird species",
  journal = "Ecology",
  volume = 98,
  issue = 5,
  pages = 1472,
  author = c(person(given = "Robert E.", family = "Ricklefs" , email = "ricklefs@umsl.edu")
  ),
  year = 2017,
  doi = "10.1002/ecy.1783"
)
save(passerines, file="data/passerines.rda", compress="xz")
print({cat("loading dataset 'passerines' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(passerines)$citeAs) })

# -------------------------------------------------------------------

#' EltonTraits
elton_birds <- read.csv("https://ndownloader.figshare.com/files/5631081", sep="\t")
birdfuncdatsource <- read.csv("https://ndownloader.figshare.com/files/5631087", sep="\t")
elton_birds <- dplyr::left_join(elton_birds, birdfuncdatsource, by=c("Diet.Source" = "Ref_ID"))
elton_birds <- Filter(function(x)!all(is.na(x)), elton_birds)
elton_birds <- tidyr::drop_na(elton_birds)
rm(birdfuncdatsource)
elton_bib <- bibentry(
  bibtype = "Article",
  title = "EltonTraits 1.0: Species-level foraging attributes of the world's birds and mammals",
  journal = "Ecology",
  volume = 95,
  pages = 2027,
  author = c(as.person("Hamish Wilman, Jonathan Belmaker, Jennifer Simpson, Carolina de la Rosa, Marcelo M. Rivadeneira, Walter Jetz")),
  year = 2015,
  doi = "10.1890/13-1917.1"
)
attr(elton_birds, 'citeAs') <- elton_bib
print({cat("loading dataset 'elton_birds' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(elton_birds)$citeAs) })
elton_birds <- tidyr::separate(elton_birds, Scientific, into=c("Genus", "Species"), remove=TRUE)
elton_birds$Full.Reference <- stringi::stri_trans_general(elton_birds$Full.Reference, "latin-ascii")
elton_birds$English<- stringi::stri_trans_general(elton_birds$English, "latin-ascii")
colnames(elton_birds)[c(3,4)] <- c("Order", "Family")
save(elton_birds, file="data/elton_birds.rda", compress="xz")

elton_mammals <- read.csv("https://ndownloader.figshare.com/files/5631084", sep="\t")
mamfuncdatsource <- read.csv("https://ndownloader.figshare.com/files/5631090", sep="\t")
mamfuncdatsource <- Filter(function(x)!all(is.na(x)), mamfuncdatsource)
mamfuncdatsource <- tidyr::drop_na(mamfuncdatsource)
elton_mammals <- dplyr::left_join(elton_mammals, mamfuncdatsource, by=c("Diet.Source" = "Ref_ID"))
elton_mammals <- Filter(function(x)!all(is.na(x)), elton_mammals)
elton_mammals <- tidyr::drop_na(elton_mammals)
rm(mamfuncdatsource)
attr(elton_mammals, 'citeAs') <- elton_bib
print({cat("loading dataset 'elton_mammals' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(elton_birds)$citeAs) })
elton_mammals <- tidyr::separate(elton_mammals, Scientific, into=c("Genus", "Species"), remove=TRUE, extra="drop")
elton_mammals$Full.Reference <- stringi::stri_trans_general(elton_mammals$Full.Reference, "latin-ascii")
colnames(elton_mammals)[4] <- "Family"
save(elton_mammals, file="data/elton_mammals.rda", compress="xz")

# -------------------------------------------------------------------

#' Amniote life-history traits

temp <- tempfile(fileext = ".zip")
utils::download.file("https://ndownloader.figshare.com/files/8067269", temp, method = "auto", quiet = TRUE, mode="wb")
utils::unzip(temp, files = "Data_Files/Amniote_Database_Aug_2015.csv", exdir = ".")
unlink(temp)
rm(temp)
amniota <- utils::read.csv("Data_Files/Amniote_Database_Aug_2015.csv", fileEncoding = "UTF-8")
amniota[amniota == -999] <- NA
colnames(amniota)[1:6] <- c("Class", "Order", "Family", "Genus", "Species", "Subspecies")
attr(amniota, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "An amniote life-history database to perform comparative analyses with birds, mammals, and reptiles",
  journal = "Ecology",
  volume = 96,
  issue = 5,
  pages = 3109,
  author = c(utils::person(given = "Nathan P.", family = "Myhrvold" , email = "nathanm@intven.com"), 
             utils::as.person(c("Elita Baldridge", "Benjamin Chan", "Dhileep Sivam", "Daniel L. Freeman", 
                                "S. K. Morgan Ernest")) 
  ),
  year = 2015,
  doi = "10.1890/15-0846.1"
)
save(amniota, file="data/amniota.rda", compress="xz")
print({cat("loading dataset 'amniota' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(amniota)$citeAs) })

# -------------------------------------------------------------------

#' AmphiBIO, a global database for amphibian ecological traits
temp <- tempfile(fileext = ".zip")
utils::download.file("https://ndownloader.figshare.com/files/8828578", temp, method = "auto", quiet = TRUE, mode="wb")
utils::unzip(temp, files = "AmphiBIO_v1.csv", exdir = ".")
unlink(temp)
rm(temp)

amphibio <- readr::read_csv("AmphiBIO_v1.csv")
file.remove("AmphiBIO_v1.csv")
amphibio$Species <- sapply(amphibio$Species, FUN=function(x){strsplit(as.character(x), split=" ")[[1]][2]})
attr(amphibio, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "AmphiBIO, a global database for amphibian ecological traits",
  journal = "Scientific Data",
  volume = 4,
  pages = 170123,
  author = utils::as.person("Brunno Freire Oliveira, Vinícius Avelar São-Pedro, Georgina Santos-Barrera, Caterina Penone, and Gabriel C. Costa"),
  year = 2017,
  doi = "10.1038/sdata.2017.123"
)
save(amphibio, file="data/amphibio.rda", compress="xz")
print({cat("loading dataset 'amphibio' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(amphibio)$citeAs) })

# -------------------------------------------------------------------

#' Functional Arthropod Traits
arthropods <- utils::read.csv("https://datadryad.org/stash/downloads/file_stream/41139", 
                              sep = "\t",
                              fileEncoding = "latin1"
)
arthropods <- tidyr::separate(arthropods, SpeciesID, into=c("Genus", "Species"), sep=" ", remove=T, extra="drop")
attr(arthropods, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "A summary of eight traits of Coleoptera, Hemiptera, Orthoptera and Araneae, occurring in grasslands in Germany.",
  journal = "Scientific Data",
  volume = 2,
  pages = 150013,
  author = c(utils::as.person("Martin M Gossner , Nadja K Simons, R Achtziger, T Blick, WHO Dorow, F Dziock, F Köhler, W Rabitsch, Wolfgang W Weisser")
  ),
  year = 2015,
  doi = "10.1038/sdata.2015.13"
)
save(arthropods, file="data/arthropods.rda", compress="xz")
print({cat("loading dataset 'arthropods' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(arthropods)$citeAs) })

# -------------------------------------------------------------------

#' Carabid morphological traits
carabids <- utils::read.table("https://datadryad.org/stash/downloads/file_stream/23901", 
                              sep = "\t", header = TRUE, fileEncoding = "UTF-8")
carabids <- tidyr::separate(carabids, name_correct, into=c("Genus", "Species"), sep="_", remove=T, extra="drop")
attr(carabids, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Sensitivity of functional diversity metrics to sampling intensity",
  journal = "Methods in Ecology and Evolution",
  author = c(utils::as.person("Fons van der Plas, Roel van Klink, Pete Manning, Han Olff, Markus Fischer")
  ),
  year = 2017,
  doi = "10.1111/2041-210x.12728"
)
save(carabids, file="data/carabids.rda", compress="xz")
print({cat("loading dataset 'carabids' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(carabids)$citeAs) })

# -------------------------------------------------------------------

#' Heteroptera morphometry traits
heteroptera <- utils::read.csv("https://ndownloader.figshare.com/files/5633880", 
                               sep = "\t", header = TRUE, 
                               stringsAsFactors=FALSE,
                               fileEncoding = "latin1"
)
heteroptera <- tidyr::separate(heteroptera, SpeciesID, into=c("Genus", "Species"), sep=" ", remove=T, extra="drop")
attr(heteroptera, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Morphometric measures of Heteroptera sampled in grasslands across three regions of Germany",
  journal = "Ecology",
  volume = 96,
  issue = 4,
  pages = 1154,
  author = c(utils::as.person("Martin M. Gossner , Nadja K. Simons, Leonhard Höck, Wolfgang W. Weisser")
  ),
  year = 2015,
  doi = "10.1890/14-2159.1"
)
save(heteroptera, file="data/heteroptera.rda", compress="xz")
print({cat("loading dataset 'heteroptera' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(heteroptera)$citeAs) })

#' Heteroptera morphometry traits
library(dplyr)
heteropteraRaw <- utils::read.csv("https://ndownloader.figshare.com/files/5633883", 
                                  sep = "\t", header = TRUE, 
                                  stringsAsFactors=FALSE,
                                  fileEncoding = "latin1") %>% 
  tidyr::separate(SpeciesID, into=c("Genus", "Species"), 
                  sep=" ", remove=T, extra="drop")
attr(heteropteraRaw, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Morphometric measures of Heteroptera sampled in grasslands across three regions of Germany",
  journal = "Ecology",
  volume = 96,
  issue = 4,
  pages = 1154,
  author = c(utils::as.person("Martin M. Gossner , Nadja K. Simons, Leonhard Höck, Wolfgang W. Weisser")
  ),
  year = 2015,
  doi = "10.1890/14-2159.1"
)
save(heteropteraRaw, file="data/heteropteraRaw.rda", compress="xz")
print({cat("loading dataset 'heteropteraRaw' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(heteropteraRaw)$citeAs)})

# -------------------------------------------------------------------

#' Life-history traits of European birds
eubirds <- utils::read.csv("https://datadryad.org/stash/downloads/file_stream/32736", 
                           sep = "\t", stringsAsFactor=TRUE, fileEncoding="latin1", header = TRUE)
eubirds <- tidyr::drop_na(eubirds, ID)
eubirds <- tidyr::separate(eubirds, Species, into=c("Genus", "Species"), sep=" ", extra="drop")
attr(eubirds, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Life-history characteristics of European birds",
  journal = "Global Ecology and Biogeography",
  volume = "",
  issue = 00,
  pages = 1:7,
  author = c(utils::as.person("Lenka Storchová, Daniel Hořák")
  ),
  year = 2018,
  doi = "10.1111/geb.12709"
)
save(eubirds, file="data/eubirds.rda", compress="xz")
print({cat("loading dataset 'eubirds' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(eubirds)$citeAs) })

# -------------------------------------------------------------------

#' PanTHERIA mammal traits
temp <- tempfile(fileext = ".zip")
utils::download.file("https://ndownloader.figshare.com/files/5604752", temp, method = "auto", quiet = TRUE, mode="wb")
utils::unzip(temp, files = "PanTHERIA_1-0_WR05_Aug2008.txt", exdir = ".")
unlink(temp)
rm(temp)
pantheria <- utils::read.csv("PanTHERIA_1-0_WR05_Aug2008.txt", sep = "\t",
                             fileEncoding = "UTF-8")
names(pantheria) <- sub("X[0-9._]+", "", names(pantheria))
names(pantheria) <- sub("MSW05_", "", names(pantheria))
#names(pantheria) <- gsub("([A-Z])", "_\\L\\1", names(pantheria), perl = TRUE)
#names(pantheria) <- gsub("^_", "", names(pantheria), perl = TRUE)
pantheria[pantheria == -999] <- NA
names(pantheria)[names(pantheria) == "Binomial"] <- "scientificName"
pantheria <- pantheria %>% select(-scientificName)
attr(pantheria, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "PanTHERIA: a species-level database of life history, ecology, and geography of extant and recently extinct mammals",
  journal = "Ecology",
  volume = 90,
  pages = 2648,
  author = c(utils::person(given = "Kate E.", family = "Jones", email = "Kate.Jones@ioz.ac.uk"), utils::as.person("Jon Bielby, Marcel Cardillo, Susanne A. Fritz, Justin O'Dell, C. David L. Orme, Kamran Safi, Wes Sechrest, Elizabeth H. Boakes, Chris Carbone, Christina Connolly, Michael J. Cutts, Janine K. Foster, Richard Grenyer, Michael Habib, Christopher A. Plaster, Samantha A. Price, Elizabeth A. Rigby, Janna Rist, Amber Teacher, Olaf R. P. Bininda-Emonds, John L. Gittleman, Georgina M. Mace, and Andy Purvis")
  ),
  year = 2009,
  doi = "10.1890/08-1494.1"
)
save(pantheria, file="data/pantheria.rda", compress="xz")
print({cat("loading dataset 'pantheria' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(pantheria)$citeAs) })

# -------------------------------------------------------------------

#' Mammal diet database
mammal_diet <- utils::read.csv("https://datadryad.org/stash/downloads/file_stream/21438",
                               sep = "\t",
                               fileEncoding = "UTF-8"
)
attr(mammal_diet, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Establishing macroecological trait datasets: digitalization, extrapolation, and validation of diet preferences in terrestrial mammals worldwide",
  journal = "Ecology and Evolution",
  volume = 4,
  issue = 12,
  pages = 2913-2930,
  author = c(utils::person(given = "Wilm Daniel", family = "Kissling", email = "danielkissling@web.de")
  ),
  year = 2014,
  doi = "10.1002/ece3.1136"
)
save(mammal_diet, file="data/mammal_diet.rda", compress="xz")
print({cat("loading dataset 'mammal_diet' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(mammal_diet)$citeAs) })

# -------------------------------------------------------------------

#' Migratory behaviour in birds
#migbehav_birds <- readr::read_delim("http://141.2.226.7/database/metacat?action=read&qformat=bikf&sessionid=&docid=bikf.10056.1",
#                                  delim = "\t")
# Re-check link before loading data!!!
colnames(migbehav_birds)[c(1:6)] <- c("Binomial", "SpeciesID", "Order", "Family", "Genus", "Species")
migbehav_birds <- migbehav_birds %>% select(-Binomial)
attr(migbehav_birds, 'citeAs') <- utils::bibentry(
  bibtype = "Misc",
  title = "Migratory behaviour in birds: A classification across all living species",
  author = c(utils::person(given = "Alison", family = "Eyres", email = "alison.eyres@senckenberg.de")
  ),
  year = 2017,
  doi = "10.12761/SGN.2017.10058",
  url = "http://141.2.226.7/database/metacat/bikf.10058.1/bikf"
)
save(migbehav_birds, file="data/migbehav_birds.rda", compress="xz")
print({cat("loading dataset 'migbehav_birds' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(migbehav_birds)$citeAs) })

# -------------------------------------------------------------------

#' Foraging behaviour and dietary niches in birds
temp <- tempfile(fileext = ".xlsx")
utils::download.file(url="https://royalsocietypublishing.org/action/downloadSupplement?doi=10.1098%2Frstb.2019.0012&file=rstb20190012suppl2.xlsx", 
                     destfile=temp)
bird_behav <- readxl::read_xlsx(temp)
bird_behav  <- tidyr::separate(bird_behav, Species, into=c("Genus", "Species"), sep="_", extra="drop")
attr(bird_behav, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Integrating behaviour and ecology into global biodiversity conservation strategies",
  journal = "Philosophical Transactions of the Royal Society B",
  volume = 374,
  issue = 1781,
  author = c(utils::person(given = "Joseph A.", family = "Tobias", email = "j.tobias@imperial.ac.uk")
  ),
  year = 2019,
  doi = "10.1098/rstb.2019.0012"
)
save(bird_behav, file="data/bird_behav.rda", compress="xz")
print({cat("loading dataset 'bird_behav' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(bird_behav)$citeAs) })

# -------------------------------------------------------------------

#' Tetrapod population density
temp <- tempfile(fileext = ".xlsx")
utils::download.file(url="https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/11358218/TetraDENSITY.xls", destfile=temp)
tetra_density <- readxl::read_xls(temp, sheet="Dataset")
attr(tetra_density, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "TetraDENSITY: A database of population density estimates in terrestrial vertebrates",
  journal = "Global Ecology and Biogeography",
  volume = 27,
  issue = 7,
  pages = 787-791,
  author = c(utils::person(given = "Luca", family = "Santini", email = "luca.santini.eco@gmail.com")
  ),
  year = 2018,
  doi = "10.1111/geb.12756"
)
save(tetra_density, file="data/tetra_density.rda", compress="xz")
print({cat("loading dataset 'tetra_density' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(tetra_density)$citeAs) })

# -------------------------------------------------------------------

#' Lizard traits
lizard_traits <- readr::read_csv("https://datadryad.org/stash/downloads/file_stream/77989")
lizard_traits <- dplyr::select(lizard_traits, -Binomial)
colnames(lizard_traits)[1:2] <- c("Genus", "Species")
#lizard_meta <- utils::read.csv("https://datadryad.org/stash/downloads/file_stream/77990", sep = ",")
attr(lizard_traits, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Traits of lizards of the world: variation around a successful evolutionary design",
  journal = "Global Ecology and Biogeography",
  volume = 27,
  issue = 10,
  pages = 1168-1182,
  author = c(utils::person(given = "Shai", family = "Meiri", email = "uncshai@post.tau.ac.il")
  ),
  year = 2018,
  doi = "10.1111/geb.12773"
)
save(lizard_traits, file="data/lizard_traits.rda", compress="xz")
print({cat("loading dataset 'lizard_traits' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(lizard_traits)$citeAs) })

# -------------------------------------------------------------------

#' AnAge
temp <- tempfile(fileext = ".zip")
utils::download.file(url="https://genomics.senescence.info/species/dataset.zip", destfile=temp)
temp2 <- tempdir()
unzip(temp, exdir=temp2)
an_age <- utils::read.csv(paste0(temp2, "/anage_data.txt"), sep="\t", dec=".")
attr(an_age, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Human Ageing Genomic Resources: new and updated databases",
  journal = "Nucleic Acids Research",
  volume = 46,
  issue = "D1",
  pages = "D1083-D1090",
  author = c(utils::person(given = "J. P.", family = "de Magalhaes", email = "jp@senescence.info")
  ),
  year = 2018,
  doi = "10.1093/nar/gkx1042"
)
save(an_age, file="data/an_age.rda", compress="xz")
print({cat("loading dataset 'an_age' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(an_age)$citeAs) })

# -------------------------------------------------------------------

# Database for life history traits for European reptiles
temp<- tempfile(fileext = ".zip")
utils::download.file("https://datadryad.org/stash/downloads/download_resource/27730", temp, method = "auto", quiet = TRUE, mode="wb")
unzip(temp, files = "Grimm_etal_Reptile_DB_Update_2015.accdb")
unlink(temp)
library(RODBC)
datab<-file.path("Grimm_etal_Reptile_DB_Update_2015.accdb")
channel<-odbcConnect(datab)
sqlTables(channel)
# act_code <-sqlFetch(channel,"Activity code")
# lookup_who <-sqlFetch(channel,"Lookup Who")
# lookup_loco <-sqlFetch(channel,"Lookup Locomotion")
# lookup_pheno <-sqlFetch(channel,"Lookup Phenology")
# lookup_trait <-sqlFetch(channel,"Lookup Trait")
reptile_sp <-sqlFetch(channel,"Species")
colnames(reptile_sp)[1] <- "Species_ID"
library(dplyr)
reptile_act <-sqlFetch(channel,"Activity, Energy, Habitat") %>% dplyr::select(-ID)
reptile_count <-sqlFetch(channel,"Countries")
reptile_morpho <-sqlFetch(channel,"Morphometry") %>% dplyr::select(-ID)
reptile_loco <-sqlFetch(channel,"Movement") %>% dplyr::select(-ID)
reptile_pheno <-sqlFetch(channel,"Phenology") %>% dplyr::select(-ID)
reptile_maturity <-sqlFetch(channel,"Sexual Maturity") %>% dplyr::select(-ID)

reptile_lifehist <-  dplyr::full_join(reptile_sp, reptile_loco)
colnames(reptile_lifehist)
reptile_lifehist <- dplyr::full_join(reptile_lifehist, reptile_pheno)
reptile_lifehist <- dplyr::left_join(reptile_lifehist, reptile_morpho)
reptile_lifehist <- dplyr::left_join(reptile_lifehist, reptile_act)
reptile_lifehist <- dplyr::left_join(reptile_lifehist, reptile_maturity)
reptile_lifehist <- dplyr::left_join(reptile_lifehist, reptile_count)

# handbook <-sqlFetch(channel,"Handbook")
# refs <-sqlFetch(channel,"References")

reptile_lifehist  <- tidyr::separate(reptile_lifehist, `Current species name`, into=c("Genus", "Species"), sep=" ", extra="drop")
attr(reptile_lifehist, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Life-history trait database of European reptile species",
  journal = "Nature Conservation",
  volume = 9,
  pages = 45-46,
  author = c(utils::person(given = "Annegret", family = "Grimm", email = "annegret.grimm@ufz.de")
  ),
  year = 2014,
  doi = "10.3897/natureconservation.9.8908"
)
save(reptile_lifehist, file="data/reptile_lifehist.rda", compress="xz")
print({cat("loading dataset 'reptile_lifehist' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(reptile_lifehist)$citeAs)})

# -------------------------------------------------------------------

# Database for life history traits for European amphibians
temp <- tempfile(fileext = ".xlsx")
download.file("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4237922/bin/biodiversity_data_journal-2-e4123-s001.xlsx", temp, method = "auto", quiet = TRUE, mode="wb")
amphi_lifehist <- readxl::read_xlsx(temp, sheet = 1, skip=3)
amphi_lifehist <- as.data.frame(amphi_lifehist)
amphi_lifehist  <- tidyr::separate(amphi_lifehist, Species, into=c("Genus", "Species"), 
                                   sep=" ", extra="drop")
#temp <- tempfile(fileext = ".xlsx")
#download.file("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4237922/bin/biodiversity_data_journal-2-e4123-s002.xlsx", temp, method = "auto", quiet = TRUE, mode="wb")
#amphi_lifehist_ref <- readxl::read_xlsx(temp, sheet = 1)
#amphi_lifehist_ref <- as.data.frame(amphi_lifehist_ref)
unlink(temp)
attr(amphi_lifehist, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "A database of life-history traits of European amphibians",
  journal = "Biodiversity data journal",
  volume = 2,
  issue = "e4123",
  author = c(utils::person(given = "Audrey", family = "Trochet", 
                           email = "audrey.trochet@univ-tlse3.fr")
  ),
  year = 2014,
  doi = "10.3897/BDJ.2.e4123"
)
save(amphi_lifehist, file="data/amphi_lifehist.rda", compress="xz")
print({cat("loading dataset 'amphi_lifehist' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(amphi_lifehist)$citeAs) })

# -------------------------------------------------------------------

## GlobTherm
temp <- tempfile(fileext = ".zip")
utils::download.file("https://datadryad.org/stash/downloads/download_resource/2939", destfile=temp, method = "auto", quiet = TRUE, mode="wb")
globTherm <- readr::read_csv(unzip(temp, files = "GlobalTherm_upload_02_11_17.csv", exdir = "."))
#globTherm_xlsx <- readxl::read_xlsx(unzip(temp, files = "GlobalTherm_upload_10_11_17.xlsx", exdir = "."))
#globTherm_ref <- readxl::read_xlsx(unzip(temp, files = "References_1_09_2017.xlsx", exdir = "."), sheet=1)
unlink(temp)
attr(globTherm, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "GlobTherm, a global database on thermal tolerances for aquatic and terrestrial organisms",
  journal = "Scientific Data",
  volume = 5,
  issue = 180022,
  author = c(utils::person(given = "Joanne M.", family = "Bennett", email = "joanne.bennett@idiv.de")
  ),
  year = 2018,
  doi = "10.1038/sdata.2018.22"
)
save(globTherm, file="data/globTherm.rda", compress="xz")
print({cat("loading dataset 'globTherm' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(globTherm)$citeAs) })

# -------------------------------------------------------------------

## CLIMBER
climber <- readr::read_csv2("http://zookeys.pensoft.net//lib/ajax_srv/article_elements_srv.php?action=download_suppl_file&instance_id=31&article_id=3167")
colnames(climber)[1:2] <- c("Species", "FullSpeciesName")
climber  <- tidyr::separate(climber, Species, into=c("Genus", "Species"), sep=" ", extra="drop")
attr(climber, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "CLIMBER: Climatic niche characteristics of the butterflies in Europe",
  journal = "ZooKeys",
  volume = 367,
  pages = 65-84,
  author = c(utils::person(given = "Oliver", family = "Schweiger", email = "oliver.schweiger@ufz.de")
  ),
  year = 2018,
  doi = "10.3897/zookeys.367.6185"
)
save(climber, file="data/climber.rda", compress="xz")
print({cat("loading dataset 'climber' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(climber)$citeAs) })

#Schweiger O, Harpke A, Wiemers M, Settele J (2014) 
#CLIMBER: Climatic niche characteristics of the butterflies in Europe. ZooKeys 367: 65–84. doi: 10.3897/zookeys.367.6185 
#Resource ID: GBIF key: http://www.gbif.org/dataset/e2bcea8c-dfea-475e-a4ae-af282b4ea1c5

# -------------------------------------------------------------------

## MammalDIET_2
temp <- tempfile(fileext = ".zip")
utils::download.file("https://datadryad.org/stash/downloads/download_resource/2985", destfile=temp, method = "auto", quiet = TRUE, mode="wb")
mammal_diet2 <- unzip(temp, files = "Combined MammalDIET and MammalDIET 2 dataset.xlsx")
unlink(temp)
mammal_diet2 <- readxl::read_xlsx(mammal_diet2, sheet=1) %>%
  dplyr::select(-binomial)
attr(mammal_diet2, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "An updated global data set for diet preferences in terrestrial mammals: testing the validity of extrapolation",
  journal = "Mammal Review",
  volume = 48,
  pages = 160-167,
  author = c(utils::person(given = "Alison M.", family = "Gainsbury", email = "alisong@mail.usf.edu")
  ),
  year = 2018,
  doi = "10.1111/mam.12119"
)
save(mammal_diet2, file="data/mammal_diet2.rda", compress="xz")
print({cat("loading dataset 'mammal_diet2' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(mammal_diet2)$citeAs) })

#Gainsbury, Alison M.; Tallowin, Oliver J. S.; Meiri, Shai (2019), 
#Data from: An updated global dataset for diet preferences in terrestrial mammals: testing the validity of extrapolation, 
#Dryad, Dataset, https://doi.org/10.5061/dryad.qd450

# -------------------------------------------------------------------

## Atlantic Bird Traits
temp <- tempfile(fileext = ".zip")
utils::download.file("https://esajournals.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fecy.2647&file=ecy2647-sup-0001-DataS1.zip", destfile=temp, method = "auto", quiet = TRUE, mode="wb")
atlantic_birds <- unzip(temp, files = "ATLANTIC_BIRD_TRAITS_completed_2018_11_d05.csv")
unlink(temp)
atlantic_birds  <- read.csv(atlantic_birds)
colnames(atlantic_birds)
atlantic_birds <- dplyr::select(atlantic_birds, -Binomial)
attr(atlantic_birds, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "ATLANTIC BIRD TRAITS: a data set of bird morphological traits from the Atlantic forests of South America",
  journal = "Ecology",
  volume = 100,
  author = c(utils::person(given = "Rodolpho Credo", family = "Rodrigues", email = "rdprodrigues@gmail.com")
  ),
  year = 2019,
  doi = "10.1002/ecy.2647"
)
save(atlantic_birds, file="data/atlantic_birds.rda", compress="xz")
print({cat("loading dataset 'atlantic_birds' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(atlantic_birds)$citeAs) })

# -------------------------------------------------------------------

#' Insect Change database
#temp <- tempfile(fileext = ".zip")
#utils::download.file("https://esajournals.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fecy.3354&file=ecy3354-sup-0001-DataS1.zip", destfile=temp, method = "auto", quiet = TRUE, mode="wb")
#insect_change <- unzip(temp, files = "InsectAbundanceBiomassData.csv")
#insect_change2 <- unzip(temp, files = "DataSources.csv")
#insect_change3 <- unzip(temp, files = "PlotData.csv")
#insect_change4 <- unzip(temp, files = "SampleData.csv")
#unlink(temp)
#insect_change  <- read.csv(insect_change)
#data_sources  <- read.csv(insect_change2)
#plot_data  <- read.csv(insect_change3)
#sample_data  <- read.csv(insect_change4)
#attr(insect_change, 'citeAs') <- utils::bibentry(
#  bibtype = "Article",
#  title = "InsectChange: a global database of temporal changes in insect and arachnid assemblages",
#  journal = "Ecology",
#  volume = "xx",
#  issue = "xx",
#  pages = "xx",
#  author = c(utils::person(given = "Roel", family = "Van Klink", email = "roel.klink@idiv.de")),
#  year = 2021,
#  doi = "10.1002/ecy.3354"
#)
#save(insect_change, file="data/insect_change.rda", compress="xz")
#print({cat("loading dataset 'insect_change' from original data source! \n When using this data, please cite the original publication: \n") 
#  (attributes(insect_change)$citeAs) })

# -------------------------------------------------------------------

## Australian Birds
australian_birds  <- read.csv("https://ndownloader.figshare.com/files/3417176")
colnames(australian_birds)
australian_birds <- australian_birds %>% rename(Genus = X4_Genus_name_2, Species = X5_Species_name_2)
attr(australian_birds, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Biological, ecological, conservationand legal information for all speciesand subspecies of Australian bird",
  journal = "Scientific Data",
  volume = 2,
  author = c(utils::person(given = "Stephen T.", family = "Garnett", email = "stephen.garnett@cdu.edu.au")
  ),
  year = 2015,
  doi = "10.1038/sdata.2015.61"
)
save(australian_birds, file="data/australian_birds.rda", compress="xz")
print({cat("loading dataset 'australian_birds' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(australian_birds)$citeAs) })

#Garnett, Stephen; E Duursma, Daisy; Ehmke, Glenn; Guay, Patrick-Jean; Stewart, Alistair; K Szabo, Judit; et al. (2015): 
#  Australian Bird Data Version 1i.0 (2015). figshare. Collection. https://doi.org/10.6084/m9.figshare.1499292 

# -------------------------------------------------------------------

## Global Hand-Wing-Index
temp <- tempfile(fileext = ".zip")
utils::download.file("https://zenodo.org/record/3832215/files/catherinesheard/Global-HWI-v1.1.zip?download=1", destfile=temp, method = "auto", quiet = TRUE, mode="wb")
globalHWI <- unzip(temp, files = "catherinesheard-Global-HWI-1533081/Dataset HWI 2020-04-10.xlsx")
unlink(temp)
globalHWI <- readxl::read_xlsx(globalHWI)
colnames(globalHWI)
globalHWI <- dplyr::select(globalHWI, -c(`IUCN name`, `Tree name`))
globalHWI  <- tidyr::separate(globalHWI, `Species name`, into=c("Genus", "Species"), sep=" ", extra="drop")
attr(globalHWI, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Ecological drivers of global gradients in avian dispersal inferred from wing morphology",
  journal = "Nature Communications",
  volume = 11,
  author = c(utils::person(given = "Catherine", family = "Sheard", email = "catherine.sheard@bristol.ac.uk")
  ),
  year = 2020,
  doi = "10.1038/s41467-020-16313-6"
)
save(globalHWI, file="data/globalHWI.rda", compress="xz")
print({cat("loading dataset 'globalHWI' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(globalHWI)$citeAs)})

# -------------------------------------------------------------------

## Anuran morphology data
temp <- tempfile(fileext = ".zip")
utils::download.file("https://esajournals.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fecy.2685&file=ecy2685-sup-0001-DataS1.zip", destfile=temp, method = "auto", quiet = TRUE, mode="wb")
anuran_morpho <- unzip(temp, files = "ColombianAnuranMorphology_individuals.txt")
#anuran_morpho_spec <- unzip(temp, files = "ColombianAnuranMorphology_species.txt")
unlink(temp)
anuran_morpho <- readr::read_delim(anuran_morpho, delim="\t")
#anuran_morpho_spec <- read.delim(anuran_morpho_spec)
colnames(anuran_morpho)
anuran_morpho <- tidyr::separate(anuran_morpho, Species, into=c("Genus", "Species"), sep=" ", extra="drop")
attr(anuran_morpho, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "A morphological database for Colombian anuran species from conservation‐priority ecosystems",
  journal = "Ecology",
  volume = 100,
  author = c(utils::person(given = "Beatriz", family = "Salgado-Negret", email = "bsalgadonegret@gmail.com")
  ),
  year = 2019,
  doi = "10.1002/ecy.2685"
)
save(anuran_morpho, file="data/anuran_morpho.rda", compress="xz")
print({cat("loading dataset 'anuran_morpho' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(anuran_morpho)$citeAs)})

# -------------------------------------------------------------------

## Marsupial life history
marsupials <- rvest::read_html("https://ndownloader.figshare.com/files/5591894")
marsupials <- rvest::html_table(marsupials, fill=TRUE, header=T)[[1]]
colnames(marsupials) <- sapply(1:length(colnames(marsupials)), function(x) paste0(colnames(marsupials)[x], marsupials[1,x], collapse = " "))
marsupials <- marsupials[-c(1,2),]
colnames(marsupials) <- gsub("\n", " ", gsub("\r", "", colnames(marsupials)))
colnames(marsupials)
colnames(marsupials)[3:4] <- c("Genus", "Species")
attr(marsupials, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "THE ECOLOGICAL BASIS OF LIFE HISTORY VARIATION IN MARSUPIALS",
  journal = "Ecology",
  volume = 82,
  author = c(utils::person(given = "Diana O.", family = "Fisher")
  ),
  year = 2001,
  doi = "10.1890/0012-9658(2001)082[3531:TEBOLH]2.0.CO;2"
)
save(marsupials, file="data/marsupials.rda", compress="xz")
print({cat("loading dataset 'marsupials' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(marsupials)$citeAs)})

# -------------------------------------------------------------------

## Ecological traits of the world's primates
BodyMass <- readr::read_csv("https://zenodo.org/record/2600338/files/BodyMass.csv?download=1")
BodyMass$Refs1 <- as.integer(BodyMass$Refs1)
DielActivity <- readr::read_csv("https://zenodo.org/record/2600338/files/DielActivity.csv?download=1")
Habitat <- readr::read_csv("https://zenodo.org/record/2600338/files/Habitat.csv?download=1")
HomeRange <- readr::read_csv("https://zenodo.org/record/2600338/files/HomeRange.csv?download=1")
IUCN_Poptrend_Realm <- readr::read_csv("https://zenodo.org/record/2600338/files/IUCN_Poptrend_Realm.csv?download=1")
Locomotion <- readr::read_csv("https://zenodo.org/record/2600338/files/Locomotion.csv?download=1")
Locomotion$Refs <- as.integer(Locomotion$Refs)
TrophicGuild <- readr::read_csv("https://zenodo.org/record/2600338/files/TrophicGuild.csv?download=1")
TrophicGuild$Refs <- as.integer(TrophicGuild$Refs)
primates <- list(BodyMass, DielActivity, Habitat, HomeRange, IUCN_Poptrend_Realm, Locomotion, TrophicGuild)
primates <- Reduce(function(...) dplyr::full_join(...), primates)
colnames(primates)
#head(primates)
primates <- primates %>% dplyr::select(-c(`Species (ITIS)`))
attr(primates, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Ecological traits of the world’s primates",
  journal = "Scientific Data",
  volume = 6,
  author = c(utils::person(given = "Carmen", family = "Galán-Acedo", email="cgalanac@gmail.com")
  ),
  year = 2020,
  doi = "10.1038/s41597-019-0059-9"
)
save(primates, file="data/primates.rda", compress="xz")
print({cat("loading dataset 'primates' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(primates)$citeAs)})

# -------------------------------------------------------------------

## Avian Body Sizes
AvianBodySize <- read.delim("https://ndownloader.figshare.com/files/5599229")
colnames(AvianBodySize)
AvianBodySize <- tidyr::separate(AvianBodySize, Species_name, into=c("Genus", "Species"), sep=" ", extra="drop")
attr(AvianBodySize, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "AVIAN BODY SIZES IN RELATION TO FECUNDITY, MATING SYSTEM, DISPLAY BEHAVIOR, AND RESOURCE SHARING",
  journal = "Ecology",
  volume = 88,
  author = c(utils::person(given = "Terje", family = "Lislevand")
  ),
  year = 2007,
  doi = "10.1890/06-2054"
)
save(AvianBodySize, file="data/AvianBodySize.rda", compress="xz")
print({cat("loading dataset 'AvianBodySize' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(AvianBodySize)$citeAs)})

# -------------------------------------------------------------------

#' DISPERSE, a trait database to assess the dispersal potential of European aquatic macroinvertebrates

disperse <- readr::read_csv("https://springernature.figshare.com/ndownloader/files/24964340")
disperse$Species <- ""
colnames(disperse)
attr(disperse, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "DISPERSE, a trait database to assess the dispersal 
  potential of European aquatic macroinvertebrates",
  journal = "Scientific Data",
  volume = 7,
  author = c(utils::person(given = "Romain", 
                           family = "Sarremejane")
  ),
  year = 2020,
  doi = "10.1038/s41597-020-00732-7"
)
save(disperse, file="data/disperse.rda", compress="xz")
print({cat("loading dataset 'dispeerse' from original data source! \n When using this data, please cite the original publication: \n") 
  (attributes(disperse)$citeAs)})

#temp <- tempfile(fileext = ".xlsx")
#utils::download.file("https://springernature.figshare.com/ndownloader/files/24964343", destfile=temp, method = "auto", quiet = TRUE, mode="wb")
#dat2 <- readxl::read_xlsx(temp)
# Excel File has 3 sheets: DataKey, Data, Reference List

# -------------------------------------------------------------------

fishmorph <- readr::read_csv2("https://figshare.com/ndownloader/files/28672242") %>%
  tidyr::separate(`Genus species`, into=c("Genus", "Species"), sep=" ", extra="drop")
head(fishmorph)
attr(fishmorph, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "FISHMORPH: A global database on morphological traits of freshwater fishes",
  journal = "Global Ecology and Biogeography",
  volume = 30,
  author = c(utils::person(given = "Sébastien", 
                           family = "Brosse")
  ),
  year = 2020,
  doi = "10.1038/s41597-020-00732-7"
)
save(fishmorph, file="data/fishmorph.rda", compress="xz")
print({
  cat("loading dataset 'fishmorph' from original data source! 
           \n When using this data, please cite the original publication: \n") 
  (attributes(fishmorph)$citeAs)
})

# -------------------------------------------------------------------

epiphytes <- readr::read_delim("https://datadryad.org/stash/downloads/file_stream/1110774", 
                               delim="\t") %>% select(-Genus) %>%
  tidyr::separate(SpeciesName, into=c("Genus", "Species"), 
                  sep=" ", extra="drop")
head(epiphytes)
attr(epiphytes, 'citeAs') <- utils::bibentry(
  bibtype = "Article",
  title = "Putting vascular epiphytes on the traits map",
  journal = "Journal of Ecology",
  volume = 00,
  author = c(utils::person(given = "Peter", 
                           family = "Hietz")
  ),
  year = 2021,
  doi = "10.1111/1365-2745.13802"
)
save(epiphytes, file="data/epiphytes.rda", compress="xz")
print({
  cat("loading dataset 'epiphytes' from original data source! 
           \n When using this data, please cite the original publication: \n") 
  (attributes(epiphytes)$citeAs)
})
