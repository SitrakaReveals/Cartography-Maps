library(tidyverse)
library(sf)
library(rnaturalearth)
library(MetBrewer)
lux_pop_density <- st_read("Data/map/kontur_population_LU_20220630.gpkg")

map <- "lux"
#lux_pop_density_df <- as.data.frame(lux_pop_density)


#glimpse(countries110)
#st_as_sf(countries110)
lx <- st_as_sf(countries110) |> 
  filter(admin == "Luxembourg") 

geom_sf(data = lx)



library(tmap)
tm_shape(lux_boundary) + tm_borders() + tm_style_classic()

