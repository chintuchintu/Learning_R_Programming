#user defined functions in 'R'
myfirstFN = function(x) {
  return(x+x)
}
myfirstFN(5)

mysecFN = function(a,b){
  print(a+b)
}
mysecFN(6,7)



#Loops in python
for(i in 2:10){
  print(i)
}

#R program to print prime numbers between 1 to n
primFunc = function(n){
  flag = 0
  numbers = seq(2, n)
  for(i in numbers){
    if(i>2){
      check_div = seq(2, i-1)
      for(j in check_div){
        if(i %% j == 0){
          flag = 1
          break
        }
      }
    }
    if(flag == 0){
      print(i)
    }
    else{
      flag = 0
    }
  }
}
primFunc(100)
