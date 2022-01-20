## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- message=FALSE-----------------------------------------------------------
library(traitdata)
library(dplyr, quiet=TRUE)
library(ggplot2)

## -----------------------------------------------------------------------------
data(passerines)

## -----------------------------------------------------------------------------
class(passerines)
head(passerines)

## -----------------------------------------------------------------------------
data(passerines)
select(passerines, Genus, Species, Wing) %>% head()

## -----------------------------------------------------------------------------
passerines %>% select(scientificNameStd, Genus, Species, Family, Wing) %>% 
  filter(Family == "Cardinalidae") %>% head()

## -----------------------------------------------------------------------------
passerines %>% select(scientificNameStd, Genus, Species, Family, Wing) %>% 
  arrange(Family) %>% head()

## -----------------------------------------------------------------------------
passerines %>% select(scientificNameStd, Family, Genus, Species) %>% group_by(Family) %>% 
summarise(n_family = n())

## -----------------------------------------------------------------------------
# Get passerine data
data(passerines)

# Run queries on data
passerines %>% filter(Sex == 1) %>% 
  select(`Bill L`, `Bill W`, `Bill D`) %>% 
  arrange(`Bill L`) %>% head()

## -----------------------------------------------------------------------------
by_family <- group_by(passerines, Family)
count <- summarise(by_family, n = n_distinct(scientificNameStd))
count <- filter(count, n > 10)
count

## -----------------------------------------------------------------------------
passerines %>% group_by(Family) %>% summarize(n=n_distinct(scientificNameStd)) %>% 
  arrange(desc(n)) %>% head(10)

## ----fig.width=6, fig.height=4------------------------------------------------
passerines %>% group_by(Family) %>% tidyr::drop_na(Family) %>% 
  summarize(n=n_distinct(scientificNameStd)) %>% 
  arrange(desc(n)) %>% head(15) %>% collect() %>% ggplot(aes(x=Family, y=n)) +
  geom_bar(stat='identity',color='skyblue',fill='#b35900') + xlab("") + 
  ggtitle('Top ten families with highest number of species') + coord_flip() + ylab('Total number of species')

## -----------------------------------------------------------------------------
#Get passerines data
data(passerines)

#Get mean wing length and sample size per species and sex
passerines %>% group_by(scientificNameStd, Sex) %>% filter(Sex %in% c(1,2)) %>% 
  summarise(wing_length = mean(Wing), 
            sample_size = n()) %>% head(5)

## ----fig.width=6, fig.height=4------------------------------------------------
passerines %>% group_by(scientificNameStd, Sex) %>% filter(Sex %in% c(1,2)) %>% 
  head(15) %>% collect() %>% ggplot(aes(x=as.factor(`scientificNameStd`), y=Wing, fill=Sex)) + geom_boxplot() + coord_flip() + 
  xlab("") + ylab("Wing length")

## -----------------------------------------------------------------------------
migbehav_passerines <- inner_join(passerines, migbehav_birds, by="scientificNameStd", copy = TRUE) 

## -----------------------------------------------------------------------------
migbehav_passerines %>% arrange(desc(`Bill L`)) %>% select(scientificNameStd, `Bill L`, Migratory_status) %>% unique() %>% head(10)

## -----------------------------------------------------------------------------
data(elton_birds); data(elton_mammals)
eltontraits <- full_join(elton_mammals, elton_birds)
eltontraits %>% select(scientificNameStd, BodyMass.Value) %>% 
  arrange(desc(BodyMass.Value)) %>% head(10)

