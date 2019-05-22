# Refer to videos: GGPlot_Video1.mp4, GGPlot_Video2.mp4

#ggplot 2 contains two parts. One is aesthetic mapping and other is geometric object. 
#Aesthetic mapping is like an open canvas. You can specify what you want to represent at x-axis
#and what you want to represent at y-axis. It also represents what type of group data you want 
#to fill. 
#In order to represent your data on x and y -axis you need certain geometric objects. Like shape:
#line, bar, square etc

library(ggplot2)

data(BOD)

str(BOD)

ggplot(data = BOD, mapping = aes(x = Time, y = demand)) + 
  geom_bar(stat = 'identity')

#here, even though there is no value for 6 in time still ggplot shows it. In order,
#to get rid of this 6 value, we need to encode time variable as a categorical variable
#by using a function factor


#############################
######SIMPLE PLOTS###########
#############################
ggplot(data = BOD, mapping = aes(x = factor(Time), y = demand)) + 
  geom_bar(stat = 'identity')
 
ggplot(data = BOD, mapping = aes(x = factor(Time), y = demand)) + 
  geom_bar(stat = 'identity', fill = 'gold', colour = 'black')

##Grouping the plots##
experiment = data.frame(exp_type = c('Exp1', 'Exp1', 'Exp2', 'Exp2'), 
                        date = c('Jan7', 'Jan14', 'Jan7', 'Jan14'), 
                        speed_kmph = c(60, 45, 75, 90))
str(experiment)

ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
         geom_bar(stat = 'identity', position = 'dodge')


##Changing the fill colour##
ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
  geom_bar(stat = 'identity', position = 'dodge') + 
  scale_fill_brewer(palette = 18)

ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
  geom_bar(stat = 'identity', position = 'dodge') + 
  scale_fill_manual(values = c('red', 'blue'))

ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
  geom_bar(stat = 'identity', position = 'dodge') + 
  scale_fill_manual(values = c('red', 'blue'), guide = FALSE)  # it will remove the legend


#############################################
######ADJUST BAR WIDTH AND SPACING###########
#############################################
ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
  geom_bar(stat = 'identity', position = 'dodge', width = 0.4)

##to create gap among dodge plots##
ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
  geom_bar(stat = 'identity', position = position_dodge(0.5), width = 0.4)


#############################################
############STACKED BAR PLOTS################
#############################################
ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
  geom_bar(stat = 'identity') #by default it will take plots in stacked form


##change the order to stack##
ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) +
  geom_bar(stat = 'identity', position = position_stack(reverse = TRUE)) +
  guides(fill = guide_legend(reverse = TRUE))


#############################################
############ADD LABEL TO BAR PLOT############
#############################################
ggplot(data = experiment, mapping = aes(x = interaction(date, exp_type), y = speed_kmph)) + 
  geom_bar(stat = 'identity') + geom_text(aes(label = speed_kmph), vjust = 1.5, 
                                          color = 'white', size = 5)
#here above, interaction() means that on x-axis there will be an interaction both 
#date and exp_type will be plotted.

ggplot(data = experiment, mapping = aes(x = interaction(date, exp_type), y = speed_kmph)) + 
  geom_bar(stat = 'identity') + geom_text(aes(label = speed_kmph), vjust = -0.2, 
                                          color = 'black', size = 5)

#making y-limit a bit higher
ggplot(data = experiment, mapping = aes(x = interaction(date, exp_type), y = speed_kmph)) + 
  geom_bar(stat = 'identity') + geom_text(aes(label = speed_kmph), vjust = -0.2, 
                                          color = 'blue', size = 5) + 
  ylim(0, max(experiment$speed_kmph)*1.1)

#add labels on grouped bar plot
ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) + 
  geom_bar(stat = 'identity', position = 'dodge') + geom_text(aes(label = speed_kmph), vjust = 1.5, 
                                          color = 'black', size = 5, position = position_dodge(0.9)) + 
  ylim(0, max(experiment$speed_kmph)*1.1)

#add labels in stacked bar
ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) + 
  geom_bar(stat = 'identity', color = 'black') +   #add black outline 
  geom_text(aes(label = speed_kmph), colour = 'black', size = 5, position = position_stack(vjust = 0.5))

ggplot(data = experiment, mapping = aes(x = date, y = speed_kmph, fill = exp_type)) + 
  geom_bar(stat = 'identity', color = 'black') +   #add black outline 
  geom_text(aes(label = paste(format(speed_kmph, nsmall = 2), 'Kmph')), colour = 'black', size = 5, position = position_stack(vjust = 0.5)) +
  scale_fill_brewer(palette = 18)

?format()
?ggplot()
?geom_bar()
?scale_fill_brewer()
