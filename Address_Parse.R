
Parse_Address <-function (z) { 
  DF <- setNames(data.frame(matrix(ncol = 1, nrow = 0)), c("address"))
   i <- 1
   
    while(i <= nrow(z)){
   x <- paste0(z[i,4]," ",z[i,5]," ",z[i,6]," ",z[i,7]," ",z[i,8]," ",z[i,9], " ") 
   x <- str_replace_all(x," NA ", " "); 
   DF[i,1] <-x; i <- i+1
   
    }  
return(as.data.frame(DF))
}

LA_SAMPLE <- LA_Address[sample(nrow(LA_Address),5000), ]


LA_SAMPLE_FULL <- Parse_Address(LA_SAMPLE)


 TEST <- Parse_Address(LA_Address)
 
 
