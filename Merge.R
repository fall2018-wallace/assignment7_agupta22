
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
#dfmerge$NAME <- tolower(dfmerge$NAME) 
#dfmerge$NAME

#Step B: Generate a color coded map
#3)	Create a color coded map, based on the area of the state 
library(ggplot2)
US <- map_data("state")
area_map <- ggplot (dfmerge , aes(map_id = NAME))


area_map <- area_map + geom_map (map=US, aes(fill=dfmerge$state_area))     #mapping according to the area of each state
area_map

area_map <- area_map + expand_limits(x=US$long, y=us$lat)       #stating the map locations borders
area_map
