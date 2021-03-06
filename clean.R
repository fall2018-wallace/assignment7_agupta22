
uncleaned_data <- raw_data


clean <- function(states)
{
    last_row <- nrow(states)
    last_row
    # clean the rows and columns
    states <- states[ -c(1,last_row), -c(1:4)]
    colnames(states) <- c("statename","population","popOver18","percentOver18")
    
    return(states)
    
}

Final_data <- clean(uncleaned_data)
Final_data
