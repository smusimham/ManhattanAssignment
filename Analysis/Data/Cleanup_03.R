# Author: Gino 
# Live Assignment 06
# Part 3


#required Cleanup_02.R
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/Data/Cleanup_02.R",echo=FALSE)

#Cleanng up manhattan file and setting the data for analysis "Cleanup_03.R"

#plot gross sqft to price
plot(mn.sale$gross.sqft, mn.sale$sale.price.n)
plot(log10(mn.sale$gross.sqft), log10(mn.sale$sale.price.n))


#Analysis on the data 
hist(log10(mn.sale$sale.price.n))
qqplot(log10(mn.sale$gross.sqft), log10(mn.sale$sale.price.n))


#Creating a new data set, limiting to family homes from the list.
mn.homes <- mn.sale[which(grepl("FAMILY",mn.sale$building.class.category)),]
mn.homes$Price.per.gross.sqft <- mn.homes$sale.price.n/mn.homes$gross.sqft
mn.homes$Price.per.land.sqft <- mn.homes$sale.price.n/mn.homes$land.sqft
mn.homes$Price.per.gross.sqft <- replace(mn.homes$Price.per.gross.sqft, which(is.na(mn.homes$Price.per.gross.sqft)),0)
mn.homes$Price.per.land.sqft <- replace(mn.homes$Price.per.land.sqft, which(is.na(mn.homes$Price.per.land.sqft)),0)
dim(mn.homes)

#reviewed the data set and it contained outliers, 
plot(log10(mn.homes$gross.sqft), log10(mn.homes$sale.price.n))
hist(log10(mn.homes$sale.price.n))
summary(mn.homes[which(mn.homes$sale.price.n<100000),])

#removed outliers that are lesser than and equal to 5.
mn.homes$outliers <- (log10(mn.homes$sale.price.n) <= 5) + 0
mn.homes <- mn.homes[which(mn.homes$outliers == 0),]

#reviweing data prior to analysis
plot(mn.homes$gross.sqft, mn.homes$sale.price.n)
  #writing out to clean file

#writing out intermediate cleanedup file with family home
write.csv(mn.homes,file="rollingsales_manhattan_familyhome.csv")
  