
#1)	Read in the census dataset and the USArrests and merge them 
State <- State_data
arrests <- USArrests            
arrests
NState <- State[-9, ]
dfmerge <- cbind(NState, arrests)    

#2)	Add the area of each state, and the center of each state, to the merged dataframe, using the 'state.center', 'state.center' and 'state.name' vectors
center_state <- state.center
state_latitude <- center_state[["x"]]                     
state_longitude <- center_state[["y"]]                
statearea <- state.area                             

dfmerge$state_lat <- state_latitude                  
dfmerge$state_lon <- state_longitude
dfmerge$state_area <- statearea

dfmerge
dfmerge$statename <- tolower(dfmerge$statename) 
dfmerge$statename

#Step B: Generate a color coded map
#3)	Create a color coded map, based on the area of the state 
library(ggplot2)
US <- map_data("state")
area_map <- ggplot (dfmerge , aes(map_id = statename))


area_map <- area_map + geom_map (map=US, aes(fill=dfmerge$state_area))     
area_map

area_map <- area_map + expand_limits(x=US$long, y=US$lat)       
area_map

#Step C: Create a color shaded map of the U.S. based on the Murder rate for each state 
#4)	Repeat step B, but color code the map based on the murder rate of each state.

murder_map <- ggplot (dfmerge , aes(map_id = statename))


murder_map <- murder_map + geom_map (map=US, aes(fill=dfmerge$Murder))             


murder_map <- murder_map + expand_limits(x=US$long, y=US$lat)
murder_map

#5)	 Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state

population_map <- murder_map + geom_point (aes(x=dfmerge$state_lat, y=dfmerge$state_lon, size=dfmerge$POPESTIMATE2017), color="green")      
population_map <- murder_map + coord_map()

#Step D: Zoom the map
#6)	Repeat step C, but only show the states in the north east
#Hint: get the lat and lon of new york city
#Hint: set the xlim and ylim to NYC +/- 10
library(ggmap)
nyc_lat_long <- geocode("new york city, ny", source = "dsk")      
north_east_map <- ggplot(dfmerge, aes(map_id=statename)) + geom_map(map=US , aes(fill=Murder)) + expand_limits(x=dfmerge$state_lat , y=dfmerge$state_lon) + coord_map() + ggtitle ("Northeast of US") +geom_point (aes(x=dfmerge$state_lat, y=dfmerge$state_lon, size=dfmerge$POPESTIMATE2017), color="red")     #ploting murder and population in map as before
north_east_map <- north_east_map + xlim(nyc_lat_long$lon-10, nyc_lat_long$lon+10) + ylim (nyc_lat_long$lat-10, nyc_lat_long$lat+10)      


