## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
#' First we load our Data
library(traitdata)
data(passerines)

#' Secondly, we need to load the dplyr library
library(dplyr)

#' Now, we can calculate the indices using the mutate function from the dplyr package
passerines <- passerines %>% 
  mutate(tail_wing_index = Tail / Wing, 
         bill_height_index = `Bill D` / `Bill L`, 
         bill_width_index =  `Bill W` / `Bill L`)
#kipp_index = kipp / Wing,
#lateral_tarsus_index = lateral.tarsus.diameter / tarsus.length
#sagittal_tarsus_index = sagittal.tarsus.diamter / tarsus.length

## ---- fig.width=7, fig.height=3-----------------------------------------------
#' Load the ggplot2 library
library(ggplot2); library(patchwork)

#' Plot a histogram of the 3 indices
p1 <- passerines %>% ggplot() + geom_histogram(aes(x=tail_wing_index)) +
  scale_y_continuous(expand=expansion(add=c(0,10))) + 
  labs(x="Tail wing index", y="Frequency") + theme_bw()
p2 <- passerines %>% ggplot() + geom_histogram(aes(x=bill_height_index)) +
  scale_y_continuous(expand=expansion(add=c(0,10))) + 
  labs(x="Bill height index", y="") + theme_bw()
p3 <- passerines %>% ggplot() + geom_histogram(aes(x=bill_width_index)) +
  scale_y_continuous(expand=expansion(add=c(0,10))) + 
  labs(x="Bill width index", y="") + theme_bw()
p1 + p2 + p3

