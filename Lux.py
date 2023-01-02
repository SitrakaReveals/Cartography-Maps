# First, install and load the necessary libraries
#pip install geopandas matplotlib
import geopandas as gpd
import matplotlib.pyplot as plt

# Next, use the geopandas.read_file function to read in a shapefile of Luxembourg
luxembourg = gpd.read_file("luxembourg.shp")

# Now, create a plot using the geopandas.plot function and customize the appearance
# of the map by setting additional options such as the fill color or line color
luxembourg.plot(color="gray")

# Finally, use the matplotlib.pyplot.show function to display the plot
plt.show()
