# Read in data

#library(tidyverse)

library(curl)
library(httr)

if(!dir.exists(here::here("data", "eif_public"))) {
  
  dir.create(here::here("data", "eif_public"), recursive = TRUE)
  
}

## EIF pollutants

for (i in 1999:2023) { 
  
  # URL of the Parquet file
  url <- paste0("https://www2.census.gov/ces/gridded_eif/gridded_eif_pollutants_", i, ".parquet")
  
  # destination 
  destfile <- paste0("data/eif_public/gridded_eif_pollutant", i, ".parquet")
  
  if(!file.exists(destfile)) {
    
    GET(url, write_disk(destfile, overwrite = TRUE)) # download and save parquet
    
  }

}



## eif population by age, race and sex

for (i in 1999:2023) { 
  
  # URL of the Parquet file
  url <- paste0("https://www2.census.gov/ces/gridded_eif/gridded_eif_pop_ageracesex_", i, ".parquet")
  
  # destination 
  destfile <- paste0("data/eif_public/gridded_eif_ageracesex", i, ".parquet")
  
  if(!file.exists(destfile)) {
  
    GET(url, write_disk(destfile, overwrite = TRUE)) # download and save parquet

  }
      
}

# 
  
for (i in 1999:2023) { 
  
  # URL of the Parquet file
  url <- paste0("https://www2.census.gov/ces/gridded_eif/gridded_eif_pop_raceincome_", i, ".parquet")
  
  # destination 
  destfile <- paste0("data/eif_public/gridded_eif_pop_raceincome", i, ".parquet")
  
  if(!file.exists(destfile)) {
  
    GET(url, write_disk(destfile, overwrite = TRUE)) # download and save parquet

  }
}
