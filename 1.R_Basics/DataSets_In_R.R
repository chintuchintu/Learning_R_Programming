#In the package datasets, all the datasets are stored. You can check
#Refer to videos: Video-9.mp4, Video-10.mp4, Video-11.mp4
?airmiles
head(airmiles)
tail(airmiles)
airmiles
hist(airmiles)

?mtcars
head(mtcars)
sum(mtcars$wt)
attach(mtcars)
sum(wt)
detach(mtcars)
mtcars[2, 6]
mtcars[2, seq(1,11)] #it will give all the values of row 2

library(data.table)

mydata = fread("iris.csv")   #set working directory first in "Session" at the top.
mydata
mydata[1]
mydata[1:5]
mydata_sort = mydata[order(sepal_length)] #sorting in ascending order by sepal_length
mydata_sort_2 = mydata[order(-sepal_length)] #sorting in descending order by sepal_length
mydata_sort
mydata_sort_2

mydata(sepal_length)
