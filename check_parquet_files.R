library(arrow)

try_reading_parquet_arrow <- function(filename) {
  
  print(filename)
  print(try(nrow(read_parquet(filename, as_tibble =T))))
  
  tidytable::inv_gc()
}

all_parquet_files <- list.files(here::here("data", "eif_public"), full.names = TRUE)

purrr::walk(all_parquet_files, try_reading_parquet_arrow)
