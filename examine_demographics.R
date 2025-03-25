library(arrow)
library(tidytable)



race_income_23 <- read_parquet(here::here("data", "eif_public", "gridded_eif_pop_raceincome2023.parquet"))

race_income_23 <- race_income_23 |>
  as_tidytable() |>
  arrange(n_noise)

tidytable::inv_gc()

race_income_23 <- race_income_23 |>
  arrange(n_noise_postprocessed)

race_income_23 <- race_income_23 |>
  arrange(grid_lon, grid_lat, income_decile)

tidytable::inv_gc()


rm(race_income_23)
tidytable::inv_gc()


age_race_sex_23 <- read_parquet(here::here("data", "eif_public", "gridded_eif_ageracesex2023.parquet"))

age_race_sex_23 |>
  as_tidytable() |>
  group_by(grid_lon, grid_lat) |>
  summarise(total_n_noise_post = sum(n_noise_postprocessed)) |>
  ungroup() |>
  summarise(total = sum(total_n_noise_post))

age_race_sex_23_ns <- age_race_sex_23 |>
  as_tidytable() |>
  group_by(grid_lon, grid_lat) |>
  count(sort = TRUE)
