library(sf)
library(tidyverse)
library(ggspatial)
library(tigris)


counties <- st_read("tl_2025_us_county") |>
  filter(STATEFP == "24" & COUNTYFP %in% c("031","033")) |>
  st_transform(crs = 4326)
# moco <- st_read("Montgomery County Boundary_20260326")
alerts_csv <- read.csv("wssc_alerts_geocoded.csv") |>
  filter(!is.na(longitude) & !is.na(latitude))

alerts_sf <- st_as_sf(x = alerts_csv, coords = c("longitude", "latitude"), crs = 4326) |> 
  st_join(counties, join=st_intersects, left = TRUE) |>
  mutate(county_name = NAME) |>
  select(-colnames(counties))


tmp <- st_read("Utility_Water_and_Sewer_Categories/Utility_Water_and_Sewer_Categories.gdb")

pg_cnty_zoning <- st_read("../Datasets/Zoning_Py.gdb")
mc_zoning <- st_read("../Datasets/Planning_Landuse_and_Zoning_Zoning.gdb")

tmp <- st_read("Environment_Tree_Canopy_Rasters/Tree_Canopy_2023_rasters.gdb")

