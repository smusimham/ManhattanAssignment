# Author: Gino 
# Live Assignment 06
# Part 1

#Cleanng up manhattan file and setting the data for analysis "Cleanup_01.R"
# Load necessary librarys, to help with further analysis of data
# install plyr and gdata and loaded into R
library(plyr)
library(gdata)

# System summary
sessionInfo()

#set workspace
setwd("~/Github/DataScienceLiveSessionAssignment06/Analysis/Data")

#reading the csv file, skipping 4 rows, the 5th row is read as header 
#and loading file into a variable
mn <- read.csv("rollingsales_manhattan.csv",skip=4,header=TRUE)

#review the loaded file
#head returns the first 6 rows of the loaded file
head(mn)

#summary returns a quick summary of the loaded file, if the column is numeric, 
#function returns a five number summary of the column
summary(mn)

#str returns all the columns and the first few rows of the loaded file
str(mn)

#Creating a new column sale.price.n from sale.price, 
#which contains a clean version of sale.price column
#empty cells are returned as NA, thousand separators "," are removed from numeric
mn$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","",mn$SALE.PRICE))


#writing out intermediate cleanedup file
write.csv(mn,file="rollingsales_manhattan_salespriceN.csv")

#before converting to lower case
str(mn)

