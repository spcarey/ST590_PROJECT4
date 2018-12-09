



PARSE_ZLIST <- function(x) {
   
ZLIST <-  xmlToList(x$response[["results"]])

street <- ZLIST[[3]]$street
zip <- ZLIST[[3]]$zipcode 
city<- ZLIST[[3]]$city 
use_code <- ZLIST[[5]] 
tax_year <- ZLIST[[6]] 
tax_assesment <- ZLIST[[7]] 
year_built <- ZLIST[[8]] 
lot_size <- ZLIST[[9]] 
finished_sqft <- ZLIST[[10]] 
bathrooms <- ZLIST[[11]] 
bedrooms <- ZLIST[[12]] 
zest <- ifelse("text" %in% names(unlist(ZLIST[[(nrow(ZLIST)-1)]][1])),unlist(ZLIST[[(nrow(ZLIST)-1)]][1][1]), "na") 
region <- ZLIST[[length(ZLIST)]][[3]][[1]] 
region_type <-ZLIST[[length(ZLIST)]][[3]][[3]]


DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street", "zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))



DF[1,1] <- street
DF[1,2] <- zip
DF[1,3] <- city
DF[1,4] <- use_code
DF[1,5] <- tax_year
DF[1,6] <- tax_assesment
DF[1,7] <- year_built
DF[1,8] <- lot_size
DF[1,9] <- finished_sqft
DF[1,10] <- bathrooms
DF[1,11] <- bedrooms
DF[1,12] <- zest
DF[1,13] <- region
DF[1,14] <- region_type

return(DF[1, ])
}



Parse_Zillow <- function(y){
  
   x <- GetDeepSearchResults(y , citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsgmv6z4sr_7kib9")
   if(!is.null(x$response)) 
      return(PARSE_ZLIST(x))
   else( return("NULL"))
}

YY2 <- apply(LA_SAMPLE_FULL_SMALL ,MARGIN = 1, Parse_Zillow_2)

LA_SAMPLE_FULL_SMALL <- as.data.frame(LA_SAMPLE_FULL[1:5, 1 ]) 

length(YY2)

YY2_FRAME <- rbind(YY2[[1:length(YY2)]])

ZILLOW_TO_DATA_FRAME <- function(x){
   
   #Apply Parse Zillow Recursivly thru x
   y <- apply(x,MARGIN = 1,Parse_Zillow)
   
   DF <- plyr::ldply(y,data.frame)
   
   
}

TEST <- ZILLOW_TO_DATA_FRAME(LA_SAMPLE_FULL_SMALL)

LA_SAMPLE_FULL_SMALL <- data.frame(LA_SAMPLE_FULL[1:100, ]) 



test5 <- ifelse("text" %in% names(unlist(ZLIST[[(nrow(ZLIST)-1)]]$amount)),unlist(ZLIST[[(nrow(ZLIST)-1)]]$amount$text), "na") 
   