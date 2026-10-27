#uloha č.1

seq <- seq(15.2, 45.7, 0.56)
seq[seq(5, length(seq), by = 5)]

#uloha č.2

airquality$Temp[airquality$Month == 5]

#uloha č.3

airquality$Weather <- "cold"                      
airquality$Weather[airquality$Temp > 70] <- "hot" 

airquality$Weather
