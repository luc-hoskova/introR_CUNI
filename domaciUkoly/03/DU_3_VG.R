seq(15.2, 45.7, 0.56)
x <- seq(15.2, 45.7, 0.56)
x[seq(5, length(x), by = 5)]


data(airquality)
View(airquality)
airquality[1:7, "Temp"]



airquality$Weather <- "cold"
airquality$Weather[airquality$Temp > 70] <- "hot"