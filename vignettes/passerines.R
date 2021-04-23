## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(traitdata)
data(passerines)

## -----------------------------------------------------------------------------
library(dplyr)

## -----------------------------------------------------------------------------
tbl_df(passerines)

## -----------------------------------------------------------------------------
glimpse(passerines)

## -----------------------------------------------------------------------------
select(passerines, Length, Wing, Tail) %>% head()

select(passerines, HN:AI) %>% head()

select(passerines, 1:3) %>% head()

## -----------------------------------------------------------------------------
filter(passerines, Length > 30)[ , 1:3] %>% head()

filter(passerines, scientificNameStd == "Passer domesticus") %>% head()

filter(passerines, Length > 30 & AU == 1) %>% head()

## -----------------------------------------------------------------------------
arrange(passerines, Length)[ , 1:3] %>% head()

arrange(passerines, desc(Length))[ , 1:3] %>% head()

arrange(passerines, Length, Wing, Tail)[, 1:3] %>% head()

## ---- eval=F------------------------------------------------------------------
#  # Find meaningful example
#  #glimpse(mutate(passerines,
#  #    g_per_mm = AdultBodyMass_g / AdultHeadBodyLen_mm))

## -----------------------------------------------------------------------------
summarise(passerines, mean_length = mean(Length, na.rm = TRUE))

head(summarise(group_by(passerines, Family),
  mean_length = mean(Length, na.rm = TRUE)))

