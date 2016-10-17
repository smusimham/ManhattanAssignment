# Author: Gino 
# Live Assignment 06
# Part 04

#required Cleanup_04.R
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/Data/Cleanup_04.R",echo=FALSE)


#Cleanng up manhattan file and setting the data for analysis "Cleanup_04.R"

#plot gross sqft to price
#plot(mn.sale$gross.sqft, mn.sale$sale.price.n)
#plot(log10(mn.sale$gross.sqft), log10(mn.sale$sale.price.n))


#Analysis on the data 
#hist(log10(mn.sale$sale.price.n))
#qqplot(log10(mn.sale$gross.sqft), log10(mn.sale$sale.price.n))


#Creating a new data set, limiting to family homes from the list.
mn.rentals <- mn.sale[which(grepl("RENTALS",mn.sale$building.class.category)),]
mn.rentals$Price.per.gross.sqft <- mn.rentals$sale.price.n/mn.rentals$gross.sqft
mn.rentals$Price.per.land.sqft <- mn.rentals$sale.price.n/mn.rentals$land.sqft
mn.rentals$Price.per.gross.sqft <- replace(mn.rentals$Price.per.gross.sqft, which(is.na(mn.rentals$Price.per.gross.sqft)),0)
mn.rentals$Price.per.land.sqft <- replace(mn.rentals$Price.per.land.sqft, which(is.na(mn.rentals$Price.per.land.sqft)),0)

dim(mn.rentals)

#reviewed the data set and it contained outliers, 
#plot(log10(mn.rentlas$gross.sqft), log10(mn.rentals$sale.price.n))
hist(log10(mn.rentals$sale.price.n))
summary(mn.rentals[which(mn.rentals$sale.price.n<100000),])

#removed outliers that are lesser than and equal to 5.
mn.rentals$outliers <- (log10(mn.rentals$sale.price.n) <= 5) + 0
mn.rentals <- mn.rentals[which(mn.rentals$outliers == 0),]

#reviweing data prior to analysis
plot(log10(mn.rentals$gross.sqft), log10(mn.rentals$sale.price.n), xlim = c(3,7), ylab = "Log of Sales price", xlab = "Log of gross sqft", main = "Rental Price vs Gross Square feet")
#writing out to clean file

#writing out intermediate cleanedup file with family home
write.csv(mn.rentals,file="rollingsales_manhattan_rentals.csv")