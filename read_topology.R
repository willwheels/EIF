library(sp)

if (!file.exists(here::here("data", "eif_grid_topology.rda"))) {
  
  download.file("https://www2.census.gov/ces/gridded_eif/eif_grid_topology.rda",
                destfile = here::here("data", "eif_grid_topology.rda"))
  
}

load(here::here("data", "eif_grid_topology.rda"))

tidytable::inv_gc()


race_income_23 <- read_parquet(here::here("data", "eif_public", "gridded_eif_pop_raceincome2023.parquet"))


## the join maybe works but there are mostly NAs after the join
eif_grid_topology@data <- eif_grid_topology@data |>
  left_join(race_income_23)

summary(eif_grid_topology@data)

# these error out

spplot(eif_grid_topology, "income_decile")
spplot(eif_grid_topology, c("n_noise"))

## link w/ data to limit to 
