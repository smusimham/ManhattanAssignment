# Author: Gino 
# Live Assignment 06
# Part 2

#required Cleanup_01.R
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/Data/Cleanup_01.R",echo=FALSE)

#Cleanng up manhattan file and setting the data for analysis "Cleanup_02.R"

#covering all variable names to lower case
names(mn) <- tolower(names(mn))

#after converting to lower case
str(mn)

#get rid of the leading digits from gross square feet
mn$gross.sqft <- as.numeric(gsub("[^[:digit:]]","",mn$gross.square.feet))

#Counting the number of NA cells in GROSS.SQUARE.FEET column
count(is.na(mn$gross.sqft))

#get rid of the leading digits from land square feet
mn$land.sqft <- as.numeric(gsub("[^[:digit:]]","",mn$land.square.feet))

#Counting the number of NA cells in LAND.SQUARE.FEET column
count(is.na(mn$land.sqft))

#get rid of the leading digits from year
mn$year.built <- as.numeric(gsub("[^[:digit:]]","",mn$year.built))

#Counting the number of NA cells in yearcolumn
count(is.na(mn$year.built))

#histogram 
hist(mn$sale.price.n)

#Sale variable 
mn.sale <- mn[mn$year.built!=0,]

#writing out intermediate file mn.sale for safe keeping
write.csv(mn.sale,file="rollingsales_manhattan_salespriceNotZero.csv")

