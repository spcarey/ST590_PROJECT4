Parse_Address <- function(df){
   i=1
   x <-   for(i in length(df)){
      paste0(df[i,4]," ",df[i,5]," ",df[i,6]," ",df[i,7]," ",df[i,8]," ",df[i,9]) %>% stringr::str_remove_all(" NA "); i <- i + 1
   }
   
   
   
   
   
}
x <- Parse_Address(LA_Address)
LA_Address[1,4]



Addy <-function (z) { 
  DF <- setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("address"))
   i <- i
   
    while(i <= nrow(z)){
   x <- paste0(z[i,4]," ",z[i,5]," ",z[i,6]," ",z[i,7]," ",z[i,8]," ",z[i,9], " ") 
   x <- str_replace_all(x," NA ", " "); 
   DF[i,1] <-x; i <- i+1
   
    }  
return(DF[ ,1 ])
}

TEST <- Addy(LA_Address[1:100, ])

TEST
