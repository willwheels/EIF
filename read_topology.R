library(sp)

if (!file.exists(here::here("data", "eif_grid_topology.rda"))) {
  
  download.file("https://www2.census.gov/ces/gridded_eif/eif_grid_topology.rda",
                destfile = here::here("data", "eif_grid_topology.rda"))
  
}

load(here::here("data", "eif_grid_topology.rda"))

tidytable::inv_gc()

#spplot(eif_grid_topology)

## only plot one of lat/long
## link w/ data to limit to 
