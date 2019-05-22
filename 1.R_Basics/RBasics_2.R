a = 5^3  #it will give cube of 5
a
c(5,6,7)->x  #it is equivalent to x = c(5,6,7)
x
y = c(2, x, 2)
y
assign("z", c(3,4,5)) #it is equivalent to z = c(3,4,5)
z
ls()  #it will list down all the objects created so far. In R, variables are objects

objects()

rm("x")  #it will remove the object x

objects()

y[2]  #y is an array

sum(y)

sqrt(y)

k = y<3
k

#seq() function
?seq()
se = seq(from = 1, to = 12, by = 2)  #this is like a for loop.
se
seq(from = 3, length = 8)


#paste() function
?paste()
paste(1:4)  #it converts elements into a character and creates a sequence
paste("xyz", 2:5) #it will fuse xyz with each element of a sequence
paste("xyz", c(1,2,"test", 6))
paste("xyz", 1:5, sep = "") #it will eliminate space


#rep() function 
?rep()
rep(c(3,4,5), 3) #it will replicate the values
rep(2, 5)
x = c(1,2,3)
rep(x, each = 3)
rep(x, each = 3, times = 2)


#which() function
?which()
x = 4:15
which(x==6)  #it will return the index position where the condition is true

#printing the string and variable in one line
a = 6
paste("Value of a =",a)
sprintf("Value of a is %i", a)