# Author: Gino 
# Live Assignment 06
# Analysis of the condos home data set

#required Cleanup_05.R
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/Data/Cleanup_05.R", echo=FALSE)
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/getmode.R",echo = FALSE)

#get diminsions of the CONDOS dataset 
dim(mn.condos)

#Returns no gross.sqft as expected
count(is.na(mn.condos$gross.sqft))

#Returns no land.sqft as expected
count(is.na(mn.condos$land.sqft))

# 5 number summary of price
summary(mn.condos$sale.price.n)

# the frequent price for home price is 13,000,000
getmode(mn.condos$sale.price.n)

#plotting the data set, to see if its normally distributed
hist(log10(mn.condos$sale.price.n))
#price data looks almost normally distributed




