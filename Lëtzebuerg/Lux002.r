library(raster)
library(sf)
library(tidyverse)
library(osmdata)
library(stars)
library(rayshader)
library(MetBrewer)
library(colorspace)
# download Lux Pop density 
lux_pop_density <- st_read("Data/map/kontur_population_LU_20220630.gpkg")

# download Luxembourg country boundaries
luxembourg <- getData("GADM", country = "LU", level = 0) |> 
  st_as_sf()

luxembourg |> 
  ggplot() +
  geom_sf()

luxembourg_bb <- st_bbox(luxembourg)

luxembourg_bb |> 
  st_as_sfc() |> 
  ggplot() +
  geom_sf() +
  geom_sf(data = luxembourg, color = "red", fill = "red")


