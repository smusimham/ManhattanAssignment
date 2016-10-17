# Author: Gino 
# Live Assignment 06
# Part 04

#required Cleanup_03.R
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/Data/Cleanup_03.R",echo=FALSE)


#Cleanng up manhattan file and setting the data for analysis "Cleanup_04.R"

#plot gross sqft to price
plot(mn.sale$gross.sqft, mn.sale$sale.price.n)
plot(log10(mn.sale$gross.sqft), log10(mn.sale$sale.price.n))


#Analysis on the data 
hist(log10(mn.sale$sale.price.n))
qqplot(log10(mn.sale$gross.sqft), log10(mn.sale$sale.price.n))


#Creating a new data set, limiting to family homes from the list.
mn.condos <- mn.sale[which(grepl("CONDOS",mn.sale$building.class.category)),]


dim(mn.condos)

#reviewed the data set and it contained outliers, 
plot(log10(mn.condos$gross.sqft), log10(mn.condos$sale.price.n))
hist(log10(mn.condos$sale.price.n))
summary(mn.condos[which(mn.condos$sale.price.n<100000),])

#removed outliers that are lesser than and equal to 5.
mn.condos$outliers <- (log10(mn.condos$sale.price.n) <= 5) + 0
mn.condos <- mn.condos[which(mn.condos$outliers == 0),]

#reviweing data prior to analysis
plot(mn.condos$gross.sqft, mn.condos$sale.price.n)
#writing out to clean file

#writing out intermediate cleanedup file with family home
write.csv(mn.condos,file="rollingsales_manhattan_condos.csv")
