#Refer to "GGPlot_Video12.mp4" video

##################
####Facetting#####
##################

#Facetting is a techniquw for displaying additional 
#categorical variables on a plot

#Facetting split the data into subsets and display same plot for each data subsets

#There are three ways one can do facetting

#####facet_null()######
#this is a default single plot

#####facet_wrap()#####
#This generates a long ribbon of panels produced by any number of variables 
#and this wraps it into 2d useful for single variables with many levels
#control is available with ncol, nrow

#####facet_grid()#####
#This provides plot in 2d grid.
#~x: spreads values of x across the columns
#x~: spreads values of x down the rows
#while x~y spreads x across rows and y down columns
#it is recommended to put variable across column which has mnay levels

library(ggplot2)
data(package = "ggplot2")

myData= mpg

plot1 = ggplot(data = myData, mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point()
plot1

plot1 + facet_wrap(~drv, ncol = 3)

plot1 + facet_wrap(~drv+class, ncol = 3)

plot1 + facet_grid(class~drv)

plot1 + facet_grid(class~drv, scales = "free_x")

plot1 + facet_grid(class~drv, scales = "free_y")
