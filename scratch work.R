library(ZillowR)
library(tidyverse)
library(xml2)
library(XML)
library(purrr)

ZILL1 <- GetDeepSearchResults(address = '14706 E SUNNY DR', citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")
ZILL1 <- xmlToList(ZILL1$response[["results"]])

ZILL1[["result"]]

ZZstr(ZILL1)

DF2 <- xmlToList(ZILL1$response[["results"]])
DF2

DF2[[3]]$street

dat <- unlist(ZILL1)
dat$dat <- as.character(dat$dat)
dat <- as.data.frame(dat)

dat['response.children.results.children.result.children.localRealEstate.children.region.attributes.type',
]



DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street", "zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))


Parse_Zillow <- function (x)
   
z <- Addy(x)   
   
ZILL1 <- GetDeepSearchResults(address = z, citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")

dat <- unlist(ZILL1)
dat <- as.data.frame(dat)
dat$dat <- as.character(dat$dat)

DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street", "zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))


Parse_Zillow <- function(x){
   
x <- GetDeepSearchResults(address = x , citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")

DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street", "zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))

for(i in length(x))

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
zest <- unlist(ZLIST[[15]]$amount$text)
region <- unlist(ZLIST[[16]][[3]][[1]])
region_type <- unlist(ZLIST[[16]][[3]][[3]])



}


YYY <- Parse_Zillow('14707 W SUNNY DR')


# working on function args
Parse_Zillow <- function(y){

   x <- GetDeepSearchResults(address = y , citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")



   ZLIST <- xmlToList(x$response[["results"]])



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
 zest <- unlist(ZLIST[[15]]$amount$text)
 region <- unlist(ZLIST[[16]][[3]][[1]])
 region_type <- unlist(ZLIST[[16]][[3]][[3]])


 DF[i,1] <- street
 DF[i,2] <- zip
 DF[i,3] <- city
 DF[i,4] <- use_code
 DF[i,5] <- tax_year
 DF[i,6] <- tax_assesment
 DF[i,7] <- year_built
 DF[i,8] <- lot_size
 DF[i,9] <- finished_sqft
 DF[i,10] <- bathrooms
 DF[i,11] <- bedrooms
 DF[i,12] <- zest
 DF[i,13] <- region
 DF[i,14] <- region_type

 return(DF)

 }


ZillowRep = getForm("http://www.zillow.com/webservice/GetDeepSearchResults.htm", 'zws-id' = "X1-ZWz1gsgmv6z4sr_7kib9",
                address = LA_SMALL[5],
                citystatezip = "Los Angeles, CA")
ZILLOW_XML <- xmlTreeParse(ZillowRep,asText = TRUE, useInternalNodes = TRUE)
Parse_DOC(ZILLOW_XML)


xmlValue(ZILLOW_XML[["//taxAssessmentYear"]])
xmlValue(ZILLOW_XML[["//lotSizeSqFt"]],recursive = TRUE)

Parse_Zillow_2("315 S BURLINGTON AVE")

TEST_FRAME <- map_df(LA_SMALL[3:5], Parse_Zillow_2)

Test_List <- lapply(as.list(LA_SMALL), Parse_Zillow_2)


xpathCheck <-function(x, path, fun = xmlValue, ...){
   y <- xpathSApply(x, path, fun, ...)
   ifelse(length(y) == 0, NA,
          ifelse(length(y) > 1, paste(y[[1]][1], collapse=", "), y))
}

xmlValue(ZILLOW_XML[["region name="]])

xpathApply(ZILLOW_XML, "//lotSizeSqFt", xmlValue)

xpath2(ZILLOW_XML, "//street")
