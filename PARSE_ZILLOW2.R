

Parse_Zillow_2 <- function(x){
   
   X <- setNames(as.data.frame(matrix(ncol = 12, nrow = 1)), c("street","zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate"))
   
   reply = RCurl::getForm("http://www.zillow.com/webservice/GetDeepSearchResults.htm", 'zws-id' = "X1-ZWz1gsgmv6z4sr_7kib9",
                   address = x,
                   citystatezip = "Los Angeles, CA")
   y <- xmlTreeParse(reply,asText = TRUE, useInternalNodes = TRUE)
   code <-xmlValue(y[["//code"]])
   
   if(code == "508")  X[1,1:12] <- "NA"
      
      
      
          X[1,1] <- xpathCheck(y, "//street")
          X[1,2] <- xpathCheck(y,"//zipcode") 
          X[1,3] <-   xpathCheck(y,"//city")
          X[1,4] <-  xpathCheck(y,"//UseCode")
          X[1,5] <- xpathCheck(y,"//taxAssessmentYear")
          X[1,6] <- xpathCheck(y,"//taxAssessment")
          X[1,7] <- xpathCheck(y,"//yearBuilt")
          X[1,8] <- xpathCheck(y,"//lotSizeSqFt")
          X[1,9] <- xpathCheck(y,"//finishedSqFt")
          X[1,10] <- xpathCheck(y,"//bathrooms")
          X[1,11] <- xpathCheck(y,"//bedrooms")
          X[1,12] <- xpathCheck(y,"//amount")
          
   
  return(X)
}

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

LA_SMALL <- LA_SAMPLE_VECTOR[1:5, ]

XX <- Parse_Zillow_2(LA_SMALL)

XX <- lapply(as.list(LA_SMALL), Parse_Zillow_2)

TEST_FRAME <- apply(as.data.frame(LA_SMALL) ,MARGIN = 1,Parse_Zillow_2 )

TEST_FRAME <- map_df(LA_SMALL, Parse_Zillow_2)


TEST_DF <- Parse_Zillow_2(LA_SAMPLE_FULL_SMALL[3,])
doc

xmlValue(ZILLOW_XML[["//taxAssessment"]])
