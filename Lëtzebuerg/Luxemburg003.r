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


# Check the CRS of the two objects
luxembourg_crs <- st_crs(luxembourg)
lux_pop_density_crs <- st_crs(lux_pop_density)

# If the CRS of the two objects are different, transform one of them to match the other
if (!identical(luxembourg_crs, lux_pop_density_crs)) {
  lux_pop_density <- st_transform(lux_pop_density, crs = st_crs(luxembourg))
}

# Now the CRS of the two objects should be the same and you can use st_intersects
result <- st_intersects(luxembourg, lux_pop_density)



int <- st_intersects(luxembourg ,lux_pop_density)

int <- st_intersects(lux_pop_density ,luxembourg)


#Trying to change it manually .... 
lux_pop_density_3857 <- st_transform(lux_pop_density, 3857)
int <- st_intersects(lux_pop_density_3857,luxembourg)

#Trying to transfom it then... 
y_transformed <- st_transform(luxembourg, crs = st_crs(lux_pop_density))
st_intersects(lux_pop_density, y_transformed)
#https://github.com/Pecners/youtube_tutorials/blob/main/tutorials/join_summarise_spatial_data/join_and_summarise_spatial_data.R

joined <- st_join(y_transformed, fr_level_2, left = FALSE)

sum_joined <- joined |> 
  group_by(GID_2) |> 
  count()



st_dd <- map_dbl(int, function(i) {
  if (length(i) > 0) {
    return(i)
  } else {
    return(0)
  }
})


