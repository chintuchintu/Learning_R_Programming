# Refer to video: GGPlot_Video3.mp4

library(ggplot2)

data(BOD)

#############################
#########Line Graph##########
#############################

ggplot(data = BOD, mapping = aes(x = Time, y = demand)) +
  geom_line()

#here we have converted time into a categorical variable and group = 1 means treat
#each point as a group and connect all these group points by a line
ggplot(data = BOD, aes(x = factor(Time), y = demand, group = 1)) +
  geom_line()


#here below I have created a small dataset and then played with that dataset using ggplot

speed = c()
for(i in 1:85){
  rand_num = sample(15:100, 1)   #taking a random number from 15 to 100
  speed = c(speed, rand_num)   #append rand_num to speed
}

vehicle_type = c()
for(i in 1:85){
  if(i<30){
    vehicle_type = c(vehicle_type, 'Car') 
  }
  else if(i>29 & i<58){
    vehicle_type = c(vehicle_type, 'Auto') 
  }
  else{
    vehicle_type = c(vehicle_type, 'two-wheeler')
  }
}

road_width = c()
for(i in 1:85){
  rand_num = sample(c(3.75, 7.00, 10.50), 1)
  road_width = c(road_width, rand_num) 
}


dataset1 = data.frame(speed = speed, 
                      vehicle_type = vehicle_type, 
                        road_width = road_width)

library(dplyr)

testset1 = dataset1 %>% 
  group_by(vehicle_type, road_width) %>%
  summarise(speed = mean(speed))

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, color = vehicle_type)) + 
  geom_line()

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, linetype = vehicle_type)) + 
  geom_line()

#here, we have given group as vehicle type. Now since we have converted road_width as
#a categorical variable hence we have to tell ggplot that treat each category of 
#vehicle_type separately and connect them with a line
ggplot(data = testset1, mapping = aes(x = factor(road_width), y = speed, color = vehicle_type, group = vehicle_type)) + 
  geom_line()

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, shape = vehicle_type)) + 
  geom_line() + geom_point(size = 4)

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, fill = vehicle_type)) + 
  geom_line() + geom_point(size = 4, shape = 25)

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, fill = vehicle_type)) + 
  geom_line(position = position_dodge(0.5)) + 
  geom_point(position = position_dodge(0.5), size = 4, shape = 25)

#################################################
#########Change appearance of line plot##########
#################################################
ggplot(data = BOD, mapping = aes(x = Time, y = demand)) +
  geom_line(linetype = 'dotted', size = 2, color = 'red')

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, color = vehicle_type)) +
  geom_line() + 
  scale_color_brewer(palette = 17)

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, group = vehicle_type)) +
  geom_line(color = 'orange', size = 1.5) #here, it will group the lines based on vehicle type and
                              #all the lines will get same color because we have provided
                              #color in geom_line, as geom_line is used for plotting
                              #so therefore all the lines will get same color.
            
ggplot(data = testset1, mapping = aes(x = road_width, y = speed, color = vehicle_type)) +
  geom_line(linetype = 'dotted') + 
  geom_point(shape = 21, size = 4, fill = 'white')


# Refer to video: "GGPlot_Video4.mp4" from here onwards
#################################################
########Change appearance of line points#########
#################################################
ggplot(data = BOD, mapping = aes(x = Time, y = demand)) +
  geom_line() + 
  geom_point(shape = 21, size = 4, fill = 'orange', color = 'darkgreen')
#here, above in geom_point() 'fill' is the color of inside of the point and 'color'
#is the outer color of the points.

ggplot(data = BOD, mapping = aes(x = Time, y = demand)) +
  geom_point(shape = 21, size = 4, fill = 'orange', color = 'darkgreen') +
  geom_line() 
#here, above line will cross the points

ggplot(data = testset1, mapping = aes(x = road_width, y = speed, fill = vehicle_type)) +
  geom_line(position = position_dodge(0.5)) +
  geom_point(shape = 21, size = 4, position = position_dodge(0.5)) +
  scale_fill_manual(values = c('red', 'blue','green'))
#here, above in aes() function, fill = vehicle_type means that we want to fill the
#colors inside the points. So, keep the lines of vehicle_type separate based on the 
#color filled inside the points.
?aes()
