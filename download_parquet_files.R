# Read in data

library(tidyverse)
library(arrow)
library(curl)
library(httr)
# library(nanoparquet)


dir.create("data", showWarnings = FALSE)

#create empty data frames that will be added together 

parquet_file <- data.frame() 
df <- data.frame()

## EIF pollutants

for (i in 1999:2023) { 
  
  # URL of the Parquet file
  url <- paste0("https://www2.census.gov/ces/gridded_eif/gridded_eif_pollutants_", i, ".parquet")
  
  # destination 
  destfile <- paste0("data/eif_public/gridded_eif_pollutant", i, ".parquet")
  
  GET(url, write_disk(destfile, overwrite = TRUE)) # download and save parquet

  parquet_file <- read_parquet(destfile, as_tibble =T)

  # Write the downloaded file as csv

  write.csv(parquet_file, paste0("data/eif_public/gridded_eif_pollutant", i,".csv"), row.names =F)
  
}

## NOTE There is something wrong with 2011, 2016


  # i = 1999
  # # URL of the Parquet file
  # url <- paste0("https://www2.census.gov/ces/gridded_eif/gridded_eif_pollutants_", i, ".parquet")
  # 
  # # destination 
  # destfile <- paste0("data/eif_public/gridded_eif_pollutant", i, ".parquet")
  # 
  # GET(url, write_disk(destfile, overwrite = TRUE)) # download and save parquet
  # 
  # parquet_file <- arrow::read_parquet(destfile, as_tibble =T)
  # 
  # # Write the downloaded file as csv
  # 
  # write.csv(parquet_file, paste0("data/eif_public/gridded_eif_pollutant", i,".csv"), row.names = F)
  



## eif population by age, race and sex

for (i in 1999:2023) { 
  
  # URL of the Parquet file
  url <- paste0("https://www2.census.gov/ces/gridded_eif/gridded_eif_pop_ageracesex_", i, ".parquet")
  
  # destination 
  destfile <- paste0("data/eif_public/gridded_eif_ageracesex", i, ".parquet")
  
  GET(url, write_disk(destfile, overwrite = TRUE)) # download and save parquet
  
  parquet_file <- read_parquet(destfile, as_tibble =T)  
  
  # Write the downloaded file as csv
  
  write.csv(parquet_file, paste0("data/eif_public/gridded_eif_pop_ageracesex", i,".csv"), row.names =F)
  
}

# 
  
for (i in 1999:2023) { 
  
  # URL of the Parquet file
  url <- paste0("https://www2.census.gov/ces/gridded_eif/gridded_eif_pop_raceincome", i, ".parquet")
  
  # destination 
  destfile <- paste0("data/eif_public/gridded_eif_pop_raceincome", i, ".parquet")
  
  GET(url, write_disk(destfile, overwrite = TRUE)) # download and save parquet
  
  parquet_file <- read_parquet(destfile, as_tibble =T)  
  
  # Write the downloaded file as csv
  
  write.csv(parquet_file, paste0("data/eif_public/gridded_eif_pop_raceincome", i,".csv"), row.names =F)
  
}