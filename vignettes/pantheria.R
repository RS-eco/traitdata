## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(traitdata)
data(pantheria)

## -----------------------------------------------------------------------------
library(dplyr)

## -----------------------------------------------------------------------------
tbl_df(pantheria)

## ---- eval=F------------------------------------------------------------------
#  glimpse(pantheria)

## -----------------------------------------------------------------------------
select(pantheria, AdultHeadBodyLen_mm:LitterSize) %>% head()

## -----------------------------------------------------------------------------
filter(pantheria, Order == "Carnivora" & AdultBodyMass_g < 200) %>% head()

## -----------------------------------------------------------------------------
arrange(pantheria, AdultBodyMass_g)[ , 1:3] %>% head()

## -----------------------------------------------------------------------------
head(mutate(pantheria, 
    g_per_mm = AdultBodyMass_g / AdultHeadBodyLen_mm))

## -----------------------------------------------------------------------------
head(summarise(group_by(pantheria, Order),
  mean_mass = mean(AdultBodyMass_g, na.rm = TRUE)))

## -----------------------------------------------------------------------------
pantheria %>% arrange(AdultBodyMass_g) %>% head()

## -----------------------------------------------------------------------------
pantheria %>%
  mutate(mass_to_length = AdultBodyMass_g / AdultHeadBodyLen_mm) %>%
  arrange(desc(mass_to_length)) %>%
  select(scientificNameStd, mass_to_length) %>% head()

## -----------------------------------------------------------------------------
pantheria %>% group_by(Order) %>%
  summarise(median_litter = median(LitterSize, na.rm = TRUE)) %>%
  filter(median_litter > 3) %>%
  arrange(desc(median_litter)) %>%
  select(Order, median_litter)

