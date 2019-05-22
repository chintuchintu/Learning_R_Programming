library(data.table)

data = fread("hflights.csv")
class(data)  #it will return the type of data which is data.frame
head(data)

colnames(data) #it will return the column names of data

data = as.data.table(data)  #it will change the type of data to data.table
class(data)

##########################
#     Data Selection     #
##########################
data_2 = data[1:3, c('AirTime','DepDelay')]  #it will give 1 to 3 rows and 'AirTime' and 'DepDelay' columns(A data frame way)
data_2 = data[1:3, list('AirTime','DepDelay')] #it will give 1 to 3 rows and 'AirTime' and 'DepDelay' columns(A data table way)
data_2 = data[1:3, .('AirTime','DepDelay')] #it will give 1 to 3 rows and 'AirTime' and 'DepDelay' columns(using dot operator)


##########################
#   Data filteration     #
##########################
head(data[data$ArrDelay>=45, Origin])  #it will return the Origin where ArrDelay is greater than 45 (data.frame way)
head(data[ArrDelay>=45, Origin]) #it will return the Origin where ArrDelay is greater than 45 (data.table way)


##########################
# remove/omit NA values  #
##########################
head(data[!is.na(data$ArrDelay), ArrDelay])  #it will return first six rows of ArrDelay where there is no NaN values (data.frame way)
head(data[, na.omit(ArrDelay)]) #it will return first six rows of ArrDelay where there is no NaN values (data.table way)


##########################
#     Add new column     #
##########################
data_totalDelay = data[, total_delay:= ArrDelay+DepDelay]
head(data_totalDelay[total_delay>=80, ],5)  #head() function by-default shows only 6 rows, but here we specified 5
                                            #means that it will show only 5 rows where total_delay>=80

##########################
#     Remove column      #
##########################
data_totalDelay[, total_delay:= NULL]  #it will remove total delay column


##########################
#   Copy Entire Table    #
##########################
copied_table = copy(data_totalDelay)
class(copied_table)


##########################
#   Select last row      #
##########################
data[.N, ]


##########################
#   Data aggregation     #
##########################
# df[i, j, by]
# i = row
# j = col
# by = groupby

#Mean arrival delay by month
data[, mean(na.omit(ArrDelay)), by = Month]

#Mean delay at unique carriers by month. It will calculate the mean_delay by Month and the length of uniqueCarrier by Month
meanDelayByMonth = data[,.(mean_delay=mean(na.omit((ArrDelay+DepDelay))), N_Unique_Carrier = length(unique(UniqueCarrier))), by = Month]


##########################
#   Sorting Dataframe    #
##########################

meanDelayByMonth_sortAsc = meanDelayByMonth[order(mean_delay)]  #sorting in ascending order

meanDelayByMonth_sortDes = meanDelayByMonth[order(-mean_delay)]   #sorting in descending order


##########################
#   left and right join  #
##########################
df1 = data.table(color = c("red", "green", "black"), num=1:3)
df2 = data.table(color = c("red", "green", "orange"), size=c("small", "medium", "large"))
left_join = merge(df1, df2, by="color", all.x = TRUE) #join df1 and df2 by a common column color by keeping all the 
                                                      #values of df1 (x here refers to df1). Now since black color is 
                                                      #not present in df2 so it will give na value in joined table in    
                                                      #corresponding row.

right_join = merge(df1, df2, by="color", all.y = TRUE) #join df1 and df2 by a common column color by keeping all the 
                                                       #values of df2 (y here refers to df2). Now since black color is 
                                                       #not present in df2 so it will give na value in joined table in    
                                                       #corresponding row.

full_outer_join = merge(df1, df2, by="color", all = TRUE)
