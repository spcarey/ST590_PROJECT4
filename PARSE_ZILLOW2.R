

Parse_Zillow_2 <- function(x){
   
   DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street","zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))
   
   reply = getForm("http://www.zillow.com/webservice/GetDeepSearchResults.htm", 'zws-id' = "X1-ZWz1gsgmv6z4sr_7kib9",
                   address = x,
                   citystatezip = "Los Angeles, CA")
   doc <- xmlTreeParse(reply,asText = TRUE, useInternalNodes = TRUE)
   code <-xmlValue(doc[["//code"]])
   if(code == "508") 
      return("NULL")
   else( 
   DF[1,1] <- xmlValue(doc[["//street"]])+
   DF[1,2] <- xmlValue(doc[["//zipcode"]])+
   DF[1,3] <- xmlValue(doc[["//city"]])+
   DF[1,4] <- xmlValue(doc[["//useCode"]])+
   DF[1,5] <- xmlValue(doc[["//taxAssesmentYear"]])+
   DF[1,6] <- xmlValue(doc[["//taxAssesment"]])+
   DF[1,7] <- xmlValue((doc[["//yearBuilt"]]))+
   DF[1,8] <- xmlValue(doc[["//lotSizeSqFt"]])+
   DF[1,9] <- xmlValue(doc[["//finishedSqFt"]])+
   DF[1,10] <- xmlValue(doc[["//bathrooms"]])+
   DF[1,11] <- xmlValue(doc[["//bedrooms"]])+ 
   DF[1,12] <- xmlValue(doc[["//amount"]])+
   DF[1,13] <- "null"+
   DF[1,14] <- "null"+
   
   return(DF[1, ]))
}
