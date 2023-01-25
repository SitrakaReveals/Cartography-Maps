#https://geocompr.robinlovelace.net/adv-map.html 
#The first example.

library(sf)
library(terra)
library(dplyr)
library(spData)
library(spDataLarge)


library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps
library(ggplot2) # tidyverse data visualization package

nz_elev = rast(system.file("raster/nz_elev.tif", package = "spDataLarge"))

# Add fill layer to nz shape
tm_shape(nz) +
  tm_fill() 
# Add border layer to nz shape
tm_shape(nz) +
  tm_borders() 
# Add fill and border layers to nz shape
tm_shape(nz) +
  tm_fill() +
  tm_borders() 
