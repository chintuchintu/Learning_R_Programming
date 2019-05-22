#Refer to video GGPlot_Video5.mp4

#####################################
####Making graph with shaded area####
#####################################

library(ggplot2)

data(sunspot.year)

str(sunspot.year)

#here, we have using a dataset sunspot.year which is an in-built time series data.
#so, by time(sunspot.year) function we will get years and simple sunspot.year will return the sunspot values.
#We have used as.numeric() function just to convert our values to numeric.
data_sunspot = data.frame(
  Year = as.numeric(time(sunspot.year)),
  SunSpots = as.numeric(sunspot.year)
)

ggplot(data = data_sunspot, mapping = aes(x = Year, y = SunSpots)) +
  geom_area()

ggplot(data = data_sunspot, mapping = aes(x = Year, y = SunSpots)) +
  geom_area(color = 'black', fill = 'blue', alpha = 0.3)  #alpha will provide transparency


ggplot(data = data_sunspot, mapping = aes(x = Year, y = SunSpots)) +
  geom_area(fill = 'blue', alpha = 0.3) +
  geom_line()


#Refer to video GGPlot_Video6.mp4 from here onwards

#####################################
#####Making a stacked area graph#####
#####################################

library(gcookbook)

uspopage  #this is inbuilt dataset

str(uspopage)

uspop_data = data.frame(
  Year = uspopage$Year,
  AgeGroup = uspopage$AgeGroup,
  Thousands = uspopage$Thousands
)

#here, geom_area() does two following things:
#1. It first keep on adding the y values for each subsequent value of x.
#2. If in any particular group the values are in increasing order than the area will keep on getting bigger and bigger
#   to the right
ggplot(data = uspop_data, mapping = aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area()


#Adding a thin black line between areas of size = 0.2
#making area transparent by 60%
#Adding color palette "Blues"
ggplot(data = uspop_data, mapping = aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(color = 'black', size = 0.2, alpha = 0.4) +
  scale_fill_brewer(palette = 'Blues')

