library(ZillowR)
library(tidyverse)
library(xml2)
library(XML)

ZILL1 <- GetDeepSearchResults(address = '14707 W SUNNY DR', citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")


str(ZILL1)

DF2 <- xmlToList(ZILL1$response[["results"]])

DF2[[3]]$street

dat <- unlist(ZILL1)
dat$dat <- as.character(dat$dat)
dat <- as.data.frame(dat)




DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street", "zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))


Parse_Zillow <- function (x){
   
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

Dstreet <- ZLIST[[3]]$street
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

x <- GetDeepSearchResults(address = '14707 W SUNNY DR',, citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")

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

i=1
DF[i,1] <- dat[27,1]
DF[i,2] <- dat[30,1]
DF[i,3] <- dat[33,1]
DF[i,4] <- dat[48,1]
DF[i,5] <- dat[51,1]
DF[i,6] <- dat[54,1]
DF[i,7] <- dat[57,1]
DF[i,8] <- dat[60,1]
DF[i,9] <- dat[63,1]
DF[i,10] <- dat[66,1]
DF[i,11] <- dat[69,1]
DF[i,12] <- dat[74,1]
DF[i,13] <- dat[99,1]
DF[i,14] <- dat[101,1]

return(DF[i,])


}


DF2[3,] <- Parse_Zillow(LA_Address[1,4])










