# Author: Gino 
# Live Assignment 06
# Analysis of the family (1 to 3 bedrooms) home data set

#required Cleanup_05.R
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/Data/Cleanup_05.R", echo=FALSE)
source("~/Github/DataScienceLiveSessionAssignment06/Analysis/getmode.R",echo = FALSE)

# 5 number summary of gross sqft
summary(mn.homes$gross.sqft)

# 5 number summary of land sqft
summary(mn.homes$land.sqft)

# 5 number summary of price
summary(mn.homes$sale.price.n)


# the frequent price for home price is 13,000,000
getmode(mn.homes$sale.price.n)

# the frequent gross sqft for home is 3000 sqft
getmode(mn.homes$gross.sqft)

# the frequent land sqft for home is 1699 sqft
getmode(mn.homes$land.sqft)


#plotting the data set, to see if its normally distributed
hist(log10(mn.homes$sale.price.n))
#price data looks almost normally distributed

#plotting the data set, to see if its normally distributed
hist(log10(mn.homes$gross.sqft))
#gross sqft data looks normally distributed

#plotting the data set, to see if its normally distributed
hist(log10(mn.homes$land.sqft))
#land sqft data does not look  normally distributed, it still has outliers

#qqplot gross.sqft vs. salesprice
qqplot(mn.homes$gross.sqft, mn.homes$sale.price.n)
# the plot amlost looks linear, almost normalyy distributed

#qqplot gross.sqft vs. salesprice
qqplot(mn.homes$land.sqft, mn.homes$sale.price.n)
# the plot shows that the data is not normally distributed


#boxplot(log10(mn.homes$sale.price.n)*log10(mn.homes$gross.sqft),log10(mn.homes$sale.price.n)*log10(mn.homes$land.sqft),  data=mn.homes)
#plotting the data set to analyse the data and make a educated decision on
#cost per gross square feet to price in borough manhattan
plot(mn.homes$gross.sqft, mn.homes$sale.price.n)


#plotting the data set to analyse the data and make a educated decision on
#cost per land square feet to price in borough manhattan
#from the graph we can understand that majority of home sold between 2015 Aug to 2016 Aug,
#have land sqft between 1000 to 4000, price varied, however the mean price was 6,028,000 
#median price was 4,300,000.

plot(mn.homes$land.sqft, mn.homes$sale.price.n/10000, type="p")
summary(mn.homes$sale.price.n)


#plotting the data set to analyse the data and make a educated decision on
#cost per gross square feet to price in borough manhattan
plot(mn.homes$gross.sqft, mn.homes$sale.price.n/100000, type="p")






