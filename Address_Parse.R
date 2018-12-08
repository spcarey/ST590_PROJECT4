Parse_Address <- function(df){
   i=1
   x <-   for(i in length(df)){
      paste0(df[i,4]," ",df[i,5]," ",df[i,6]," ",df[i,7]," ",df[i,8]," ",df[i,9]) %>% stringr::str_remove_all(" NA "); i <- i + 1
   }
   
   
   
   
   
}
x <- Parse_Address(LA_Address)
LA_Address[1,4]


i <- 1
Addy <-function (z) { 
   x <- paste0(LA_Address[i,4]," ",LA_Address[i,5]," ",LA_Address[i,6]," ",LA_Address[i,7]," ",LA_Address[i,8]," ",LA_Address[i,9], " ") 
   x <- str_replace_all(x," NA ", " ")
   return(x)
}

