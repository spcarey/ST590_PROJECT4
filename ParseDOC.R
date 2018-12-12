Parse_DOC <- function(x) {
   
   street <- xmlValue(x[["//street"]])
   zip <- ifelse(xmlValue(x[["//zipcode"]]), )
   city <- xmlValue(x[["//city"]])
   use_code <- xmlValue(x[["//useCode"]])
   tax_year <- xmlValue(x[["//taxAssessmentYear"]])
   tax_assesment <- xmlValue(x[["//taxAssessment"]])
   year_built <- xmlValue((x[["//yearBuilt"]]))
   lot_size <- xmlValue(x[["//lotSizeSqFt"]])
   finished_sqft <- xmlValue(x[["//finishedSqFt"]])
   bathrooms <- xmlValue(x[["//bathrooms"]])
   bedrooms <- xmlValue(x[["//bedrooms"]]) 
   zest <- xmlValue(x[["//amount"]])
   

 X <- setNames(as.data.frame(matrix(ncol = 12, nrow = 1)), c("street","zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate"))


X[1,1] <- street
X[1,2] <- zip
X[1,3] <- city
X[1,4]<- use_code
X[1,5]<- tax_year
X[1,6] <- tax_assesment
X[1,7] <- year_built
X[1,8] <- lot_size
X[1,9]<- finished_sqft
X[1,10] <- bathrooms
X[1,11] <- bedrooms
X[1,12] <- zest




return(data.frame(X[1, ]))
}


LA_SAMPLE_FULL_SMALL$`LA_SAMPLE_FULL[1:5, 1]` <-  as.character(LA_SAMPLE_FULL_SMALL$`LA_SAMPLE_FULL[1:5, 1]`)
