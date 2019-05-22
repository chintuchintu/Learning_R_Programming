#refer to videos: "GGPlot_Video7.mp4", "GGPlot_Video8.mp4", "GGPlot_Video9.mp4", "GGPlot_Video10.mp4", "GGPlot_Video11.mp4"

########################
######Scatter Plot######
########################

library(ggplot2)

mtcars

str(mtcars)

data_cars = mtcars

ggplot(data = data_cars, mapping = aes(x = wt, y = mpg)) +
  geom_point()


#change points shape and size
ggplot(data = data_cars, mapping = aes(x = wt, y = mpg)) +
  geom_point(shape = 17, size = 3)


#here points shapes will be different based on 'am' column
ggplot(data = data_cars, mapping = aes(x = wt, y = mpg, shape = factor(am))) +
  geom_point(size = 3)

#here points color will be different based on 'am' column. Here, 'am' is categorical. 
ggplot(data = data_cars, mapping = aes(x = wt, y = mpg, color = factor(am))) +
  geom_point(shape = 11, size = 3)

#here points color will be different based on 'hp' column. Now here 'hp' is continuous
ggplot(data = data_cars, mapping = aes(x = wt, y = mpg, color = hp)) +
  geom_point(shape = 18, size = 3)

#here points size will be different based on 'hp' column. Now here 'hp' is continuous
ggplot(data = data_cars, mapping = aes(x = wt, y = mpg, size = hp)) +
  geom_point(shape = 10)


#here color of points will be darker or lighter based on the value of 'hp'
ggplot(data = data_cars, mapping = aes(x = wt, y = mpg, fill = hp)) +
  geom_point(shape = 22, size = 5) +
  scale_fill_gradient(low = 'red', high = 'white')

#here, below the size of the points will be based on 'hp' and color of the points will be based on number of gears
ggplot(data = data_cars, mapping = aes(x = wt, y = mpg, size = hp, color = factor(gear))) +
  geom_point(shape = 20, alpha = 0.8) +
  scale_color_manual(values = c('red', 'blue', 'green'))

###############################
######Over-plotting issue######
###############################
#Refer video: "GGPlot_Video9.mp4" here onwards

#Over-plotting is a issue when there are many points in the data and they are over-lapped onto one another.
#This issue can be solved by using a jitter() function. Jitter() function separates the over-lapping points and show
#all the points clearly with separation.

new_plot = ggplot(data = data_cars, mapping = aes(x = factor(gear), y = mpg, color = factor(am)))

new_plot + geom_point(size = 3)

new_plot + geom_point(size = 3, position = 'jitter')

new_plot + geom_point(size = 3, position = position_jitter(width = 0.1, height = 3))

###############################
##########Box Plots############
###############################
#Refer video: "GGPlot_Video10.mp4" here onwards

ggplot(data = data_cars, mapping = aes(x = factor(gear), y = mpg)) +
  geom_boxplot()

ggplot(data = data_cars, mapping = aes(x = factor(gear), y = mpg)) +
  geom_boxplot(aes(color = factor(am)))

ggplot(data = data_cars, mapping = aes(x = factor(gear), y = mpg)) +
  geom_boxplot() +
  geom_jitter(width = 0.2)

ggplot(data = data_cars, mapping = aes(x = factor(gear), y = mpg)) +
  geom_boxplot(aes(color = factor(am))) +
  coord_flip()

ggplot(data = data_cars, mapping = aes(x = factor(gear), y = mpg)) +
  geom_boxplot(notch = TRUE)


##########Add different points shapes, color and fill in scatter plots############
#Refer video: "GGPlot_Video11.mp4" here onwards
ggplot(data = data_cars, mapping = aes(x = mpg, y = wt, shape = factor(am), color = factor(am))) +
  geom_point(size = 5)

ggplot(data = data_cars, mapping = aes(x = mpg, y = wt, shape = factor(am), color = factor(am))) +
  geom_point(size = 5) + 
  scale_shape_manual(values = c(10, 8))

ggplot(data = data_cars, mapping = aes(x = mpg, y = wt, shape = factor(am), color = factor(gear))) +
  geom_point(size = 5) + 
  scale_shape_manual(values = c(21, 22)) +
  scale_color_manual(values = c("orange", "blue", "yellow"))

ggplot(data = data_cars, mapping = aes(x = mpg, y = wt, shape = factor(am), fill = factor(gear))) +
  geom_point(size = 5) + 
  scale_shape_manual(values = c(21, 22)) +
  scale_fill_manual(values = c("orange", "blue", "yellow"), guide = guide_legend(override.aes = list(shape = 21)))


