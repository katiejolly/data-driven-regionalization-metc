library(tidycensus)
library(tidyverse)
library(tigris)
library(sf)
options(tigris_class = "sf")
options(tigris_use_cache = TRUE)


rent <- get_acs(geography = "block group", county = "Hennepin", variables = "B25064_001", state = "MN", geometry = TRUE)

head(rent)

age <- get_acs(geography = "block group", county = "Hennepin", state = "MN", geometry = TRUE, variables = "B01002_001")

metros <- core_based_statistical_areas(cb = TRUE) %>%
  filter(GEOID %in% c("33460")) %>%
  select(metro_name = NAME)

mpls_rent <- st_join(rent, metros, join = st_within, 
                   left = FALSE) 

head(wc_rent)