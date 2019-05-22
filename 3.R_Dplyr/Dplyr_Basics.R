library(dplyr, data.table)

data = fread("hflights.csv")
class(data)  #it will return the type of data which is data.frame
head(data)

colnames(data) #it will return the column names of data

data = as.data.table(data)  #it will change the type of data to data.table
class(data)

##########################
#   select() function    #
##########################
select_data = select(data, Year, Dest, ArrDelay, DepDelay, Diverted)
#here above, it will select the selected columns from the dataframe. Here, first parameter will be the dataframe and rest
#will be the columns from dataframe

select_type = select(data, Year, AirTime:Distance, Diverted)
#here above, it will select the selected columns like "Year" and "Diverted". Along with these, it will also select all the
#columns from "AirTime" till "Distance". Check in raw data.

select_by_word = select(data, contains("Arr"))
#here above, it will select all the columns which contains the word "Arr"

select_start_with = select(data, starts_with("Arr"))
#here above, it is self-explanatory

select_ends_with = select(data, ends_with("Delay"))
#here above, it is self-explanatory


##########################
#   filter() function    #
##########################

select_filter = select(filter(data, ArrDelay>=500), contains("Arr"))
#here above, it will select only those rows where "ArrDelay" is greater than 500 and which contains "Arr"


#################################
#  chaining operator using %>%  #
#################################
#chaining operator helps us to apply one function after the other

#Arrange in Ascending Order
data %>% arrange(DepDelay) %>% head()
#here above, just withing one line we have ordered the data in ascending order on the basis of "DepDelay" column then in the
#same line, the head() function is applied.

#Arrange in Descending Order
data %>% arrange(desc(DepDelay)) %>% head()
#here above, it is same as earlier except here we are arranging the data in descending order

#use distinct() function to identify unique values
data %>% select(Dest) %>% distinct() %>% head()
#here, it will select only the Dest column with distinct values only

#################################
#      Adding new column        #
#################################
#Here,  we use mutate() function to add new column

data %>% select(ArrDelay, DepDelay) %>% mutate(Total_Delay = ArrDelay+DepDelay) %>% head()
#here above, it will select only "ArrDelay" and "DepDelay" columns and it will create new column "Total_Delay"

#####################################
#  Use group_by() and summarise()   #
#####################################
data %>% select(ArrDelay, DepDelay, Month) %>% mutate(Total_Delay = ArrDelay + DepDelay) %>% filter(!is.na(Total_Delay)) %>% group_by(Month) %>% summarise(mean(Total_Delay)) %>% head()
#here above, it is simple and self-explanatory. Here, we are applying all the functions
#then summarise function is calculating the mean of Total_Delay. Alos, in the end, it 
#will display only that columns which are given in summarise().

data %>% select(ArrDelay, DepDelay, Month, Distance) %>% mutate(Total_Delay = ArrDelay + DepDelay) %>% filter(!is.na(Total_Delay)) %>% group_by(Month) %>% summarise_each(funs(mean), Total_Delay, Distance) %>% head()
#here above, the difference is only that, it will display ll the columns given in summarise_each() function

#####################################
#        Count function             #
#####################################

data %>% group_by(Month) %>% count() %>% head()
#here above, it will count the number of flights moving per month

data %>% group_by(Month) %>% summarise(Count = n()) %>% arrange(desc(Count))%>%head()
#here above, the logic works as: here, inside summarise() function n() function gives
#last row number of each of the grouped months and the last row number is the count
#itself.

#####################################
#        Merging two dataframes     #
#####################################

x = data.frame(name = c("Joey", "Jane", "Danny"), age = c(22, 23, 27))
y = data.frame(name = c("Joey", "Jane", "Lizza"), Gender = c("Male", "Male", "Female"))
x
y

inner_join(x, y)

full_join(x, y)

left_join(x, y)

right_join(x, y)
