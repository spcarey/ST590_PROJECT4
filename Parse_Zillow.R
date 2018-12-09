



PARSE_ZLIST <- function(x) {
   
ZLIST <-  xmlToList(x$response[["results"]])

street <- ZLIST[[3]]$street
zip <- ZLIST[[3]]$zipcode 
city<- ZLIST[[3]]$city 
use_code <- unlist(ZLIST[[5]]) 
tax_year <- unlist(ZLIST[[6]]) 
tax_assesment <- unlist(ZLIST[[7]]) 
year_built <- unlist(ZLIST[[8]]) 
lot_size <- unlist(ZLIST[[9]]) 
finished_sqft <- unlist(ZLIST[[10]]) 
bathrooms <- unlist(ZLIST[[11]]) 
bedrooms <- unlist(ZLIST[[12]]) 
zest <- unlist(ZLIST[[(length(ZLIST)-1)]]$amount$text) 
region <- unlist(ZLIST[[length(ZLIST)]][[3]][[1]]) 
region_type <- unlist(ZLIST[[length(ZLIST)]][[3]][[3]])


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
   
   x <- GetDeepSearchResults(address = y , citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")
   if(!is.null(x)) 
      return(PARSE_ZLIST(x))
   else(return(""))
   

   
}

TEST_PZ <- Parse_Zillow('14706 W SUNNY DR')
