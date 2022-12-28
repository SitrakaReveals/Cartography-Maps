#https://geocompr.robinlovelace.net/adv-map.html 

library(sf)
library(terra)
library(dplyr)
library(spData)
library(spDataLarge)


library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps
library(ggplot2) # tidyverse data visualization package

nz_elev = rast(system.file("raster/nz_elev.tif", package = "spDataLarge"))

