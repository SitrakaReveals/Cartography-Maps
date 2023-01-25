library(tigris)
library(ggplot2)

manhattan_roads <- roads("NY", "New York")

ggplot(manhattan_roads) + 
  geom_sf() + 
  theme_void()
