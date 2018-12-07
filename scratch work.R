library(ZillowR)
library(tidyverse)
library(xml2)


ZILL1 <- GetDeepSearchResults(address = '14706 W SUNNY DR', citystatezip = "Los Angeles, CA", zws_id = "X1-ZWz1gsahvqczkb_376md")



dat <- unlist(ZILL1)
dat <- as.data.frame(dat)
dat$dat <- as.character(dat$dat)

DF <- setNames(data.frame(matrix(ncol = 14, nrow = 0)), c("street", "zip", "city","Use_Code", "Tax_Year", "Tax_Value","year_built", "lot_size", "finished_sq_feet", "bathrooms","bedrooms", "zestimate", "region_name","region_type"))




DF[1,1] <- dat[27,1]
DF[1,2] <- dat[30,1]
DF[1,3] <- dat[33,1]
DF[1,4] <- dat[48,1]
DF[1,5] <- dat[51,1]
DF[1,6] <- dat[54,1]
DF[1,7] <- dat[57,1]
DF[1,8] <- dat[60,1]
DF[1,9] <- dat[63,1]
DF[1,10] <- dat[66,1]
DF[1,11] <- dat[69,1]
DF[1,12] <- dat[74,1]
DF[1,13] <- dat[99,1]
DF[1,14] <- dat[101,1]
