
# For data manipulation and tidying
library(dplyr)
library(lubridate)
library(tidyr)

# For mapping
library(ggmap)
library(mapproj)

# For data visualizations
library(ggplot2)

# For modeling and machine learning
library(caret)

station <- read.csv(file = "station.csv", header = TRUE, 
                    stringsAsFactors = FALSE)

trip <- read.csv(file = "trip.csv", header = TRUE, 
                 stringsAsFactors = FALSE)

weather <- read.csv(file = "weather.csv", header = TRUE, 
                    stringsAsFactors = FALSE)

# Station
station %>% summarise(n_distinct(station_id))

# Locations
station_locs <- station %>% group_by(station_id) %>% select(1:4, 
                                                            -2)
station_locs

# Map of Seattle Stations
mymap <- get_map(location = "Seattle", maptype = "roadmap", zoom = 12)
ggmap(mymap) + geom_point(aes(x = long, y = lat), data = station_locs, 
                          alpha = 0.7, color = "darkred", size = 2)








