

reply = getForm("http://www.zillow.com/webservice/GetDeepSearchResults.htm", 'zws-id' = "X1-ZWz1gsgmv6z4sr_7kib9",
                address = "123 dumb st",
                citystatezip = "Los Angeles, CA")
doc <- xmlTreeParse(reply,asText = TRUE, useInternalNodes = TRUE)
code <-xmlValue(doc[["//code"]])
 ifelse(code == "508","NULL", Parse_XMLtoDF(doc))
      
      
      
Parse_XMLtoDF <- function(x) {

   DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street","zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))
   
   DF[1,1] <- xmlValue(x[["//street"]])
DF[1,2] <- xmlValue(x[["//zipcode"]])
DF[1,3] <- xmlValue(x[["//city"]])
DF[1,4] <- xmlValue(x[["//useCode"]])
DF[1,5] <- xmlValue(x[["//taxAssessmentYear"]])
DF[1,6] <- xmlValue(x[["//taxAssessment"]])
DF[1,7] <- xmlValue((x[["//yearBuilt"]]))
DF[1,8] <- xmlValue(x[["//lotSizeSqFt"]])
DF[1,9] <- xmlValue(x[["//finishedSqFt"]])
DF[1,10] <- xmlValue(x[["//bathrooms"]])
DF[1,11] <- xmlValue(x[["//bedrooms"]]) 
DF[1,12] <- xmlValue(x[["//amount"]])
DF[1,13] <- "null"
DF[1,14] <- "null"

return(DF[1, ])
}


xmlValue(doc[["//localRealEstate"]])


DF <- Parse_DOC(doc)
