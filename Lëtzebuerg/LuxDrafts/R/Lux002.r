library(raster)
library(sf)
library(tidyverse)
library(osmdata)
library(stars)
library(rayshader)
library(MetBrewer)
library(colorspace)
#to read : https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html


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

# download france level 2 boundaries
fr_level_2 <- getData("GADM", country = "LU", level = 2) |> 
  st_as_sf()

fr_level_2 |> 
  ggplot() +
  geom_sf()



# https://wiki.openstreetmap.org/wiki/Map_features 

luxembourg |> 
  ggplot() +
  geom_sf() +
  geom_sf(data = lux_pop_density,
          alpha = .25)



