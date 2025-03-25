library(arrow)
library(tidytable)



pollutants_23 <- read_parquet(here::here("data", "eif_public", "gridded_eif_pollutant2023.parquet"))


pollutants_22 <- read_parquet(here::here("data", "eif_public", "gridded_eif_pollutant2022.parquet"))



pollutants_16 <- read_parquet(here::here("data", "eif_public", "gridded_eif_pollutant2016.parquet"))

