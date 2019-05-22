##########################
#########tidyr############
##########################

#The goal of tidyr is to help you create tidy data.
#Tidy data means following:
# 1. Where each variable is a column
# 2. Where each observation is a row
# 3. Each value is a cell

library(tidyr, dplyr, ggplot2)

table4a #this is inbuilt dataset in R

tidy4a = table4a %>%
  gather("1999", "2000", key = "year", value = "cases")
tidy4a

table4b  #this is inbuilt dataset in R

tidy4b = table4b %>%
  gather("1999", "2000", key = "year", value = "population")
tidy4b

left_join_data = left_join(tidy4a, tidy4b)  #here, left_join is a dplyr package function
left_join_data

str(left_join_data)

left_join_data$country = factor(left_join_data$country)  #this is converted to a categorical variable
left_join_data$year = factor(left_join_data$year)  #this is converted to a categorical variable

ggplot(data = left_join_data, mapping = aes(x = country, y = cases, fill = year)) + 
  geom_bar(stat = 'identity', position = 'dodge') + 
  scale_fill_manual(values = c('red', 'blue')) +
  geom_text(aes(label = cases), vjust = -0.5, color= 'black', position = position_dodge(0.9), size = 4.5) +
  ylim(0, max(left_join_data$cases)*1.1)
 

##############
###spread()###
##############
table2

#convert table2 to a wider data format
spread(table2, key = type, value = count)

################
###separate()###
################

#separate pulls aprat one column into multiple column, by splitting whatever the separator character is encountered

#syntax:

#separate(column_name, into = c('column1', 'column2'))

table3

tab3separate = table3 %>% 
  separate(rate, into = c('cases', 'population'), sep = "/")
tab3separate

tab4separate = table3 %>% 
  separate(rate, into = c('cases', 'population'), convert = TRUE)  #it changes separated columns into integers
tab4separate

#################
####unite()######
#################

#unite() is opposite of separate
table5

table5 %>%
  unite(new_column, century, year)

stocks = tibble(
  year = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr = c(1, 2, 3, 4, 2, 3, 4),
  return = c(1.88, 0.59, 0.35, NA, 0.92, .017, 2.66)
)
stocks

stocks %>%
  spread(year, value = return)

stocks %>%
  complete(year, qtr)
