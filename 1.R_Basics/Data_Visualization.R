#Refer to Video: "Video-12.mp4"
# Data Visualiztion using R Base library
x = 5:7
y = 8:10

plot(x,y)

plot(lynx)  #lynx is pre-installed time-series dataset in R

plot(lynx, main = "Lynx Trappings", col = "orange", col.main = 52, cex.main = 1.5, ylab = "Lynx Trappings", xlab = "Time", las = 2)
#here, above "main" is title, "col" is for color of plotted line, "col.main is the color of title", "cex.main 
#is the magnification of title font", "ylab is for y-axis label", "xlab is for x-axis label", "las is for orientation of ticks. It can take 4 values 0,1,2,3"

par(mfrow=c(2,2), col.axis = "red")  #par() function set the configuration of your plot. Here, we have given 2*2 matrix
                                     #means that we want 4 plots like as 2*2 matrix

plot(1:8, las = 0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
plot(1:8, las = 1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
plot(1:8, las = 2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
plot(1:8, las = 3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")

colors()  #it will give list of colors
?pch  #it will return symbols and their values for your plot
x = 2:4
plot(x, pch = "c")
plot(x, pch = 11)  #it will give symbol corresponding to value 11

par(mfrow=c(1,1), col.axis = "red")

library(plotrix)

plot(1:7, ylab = "", main = "Line Type lty 0:6", xlab = "lty 0:6")

ablineclip(v=1, lty = 0, col = "red", lwd = 2) #blank
ablineclip(v=2, lty = 1, col = "red", lwd = 2) #solid
ablineclip(v=3, lty = 2, col = "red", lwd = 2) #dashed
ablineclip(v=4, lty = 3, col = "red", lwd = 2) #dotdash
ablineclip(v=5, lty = 4, col = "red", lwd = 2) #long-short dash
ablineclip(v=6, lty = 5, col = "red", lwd = 2) #longdash
ablineclip(v=7, lty = 6, col = "red", lwd = 2) #long-short dash
#here, 'v' is the position on x-axis, 'lty' is the line type, 'lwd' is a thickness of vertical line

?plot

plot(lynx, type='p', main='Type P') #points
plot(lynx, type='l', main='Type P') #lines
plot(lynx, type='b', main='Type P') #both
plot(lynx, type='c', main='Type P') #discontinuous lines
plot(lynx, type='o', main='Type P') #overplotted
plot(lynx, type='h', main='Type P') #histogram’ like (or ‘high-density’) vertical lines
plot(lynx, type='s', main='Type P') #stair steps
plot(lynx, type='S', main='Type P') #steps
plot(lynx, type='n', main='Type P') #no plotting.


par(mar = c(4,3,3,3), col.axis = 'darkgreen') #change plot margins

cars  #this is a dataset of car speed and car stopping distance
plot(cars$speed, type='s', bty='n',col = 'red', xlab='Cars ID', ylab = "")  #here, we have plotted car speed with a step plot
                                                                #here, bty is a box around plot which we have removed
text(8, 14, "Speed in mph", cex=1.85, col='red') #this will add a text "Speed in mph" at position 8, 14 with 
                                                 #magnification 1.85 and color = red
par(new=T) #it will allow Two lines in one plot.

plot(cars$dist, type='s', bty='n', col='blue', ann=F, axes=F, xlab='Cars ID', ylab = "")
text(40, 30, "Dis in miles", cex=1.85, col='blue')
axis(side=4)
title(main = 'Spped and stopping Distance of cars')

par()   #it will return you all the default values in par() function
