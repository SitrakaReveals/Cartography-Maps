# First, install and load the necessary libraries
install.packages(c("ggplot2", "sf", "rnaturalearth"))
library(ggplot2)
library(sf)
library(rnaturalearth)

# Next, use the ne_countries function from the rnaturalearth package to
# download a shapefile of Luxembourg
luxembourg <- ne_countries(scale = "medium", country = "Luxembourg", returnclass = "sf")