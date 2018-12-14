

Parse_Zillow <- function(x){
   
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
          X[1,4] <-  xpathCheck(y,"//useCode")
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



TEST_FRAME <-    map_df(LA_SAMPLE_VECTOR[1:999, ],  Parse_Zillow_2)
TEST_FRAME_2 <-  map_df(LA_SAMPLE_VECTOR[1000:1999, ],  Parse_Zillow_2)
Test_FRAME_3 <-  map_df(LA_SAMPLE_VECTOR[2000:2999,],  Parse_Zillow_2)

TEST_FRAME_4 <- map_df(LA_SAMPLE_VECTOR[3000:3999, ],  Parse_Zillow_2)
TEST_FRAME_5 <-  map_df(LA_SAMPLE_VECTOR[4000:4950, ],  Parse_Zillow_2)



TEST_FRAME <- TEST_FRAME %>% filter(!is.na(zestimate)) %>% as.tibble()

TEST_FRAME

ZILLOW_XML

NoMISS <- MODEL_TRAIN %>% na.omit()
