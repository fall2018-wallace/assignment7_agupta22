
#1)	Read in the census dataset and the USArrests and merge them 
State <- State_data
arrests <- USArrests            
arrests
NState <- State[-9, ]
dfmerge <- cbind(NState, arrests)    
dfmerge
#2)	Add the area of each state, and the center of each state, to the merged dataframe, using the 'state.center', 'state.center' and 'state.name' vectors
state.center
