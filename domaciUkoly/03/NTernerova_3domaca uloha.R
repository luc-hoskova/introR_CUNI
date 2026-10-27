seq(15.2, 45.7, 0.56)
KazdePiate <- seq(15.2, 45.7, 0.56)
KazdePiate
KazdePiate[seq(5, length(KazdePiate), 5)]
load(airquality)
View(airquality)
head(airquality)
airquality$Temp[airquality$Month == 5 & airquality$Day <= 7]
airquality$Weather <- "cold"
airquality$Weather[airquality$Temp > 70] <- "hot"
View(airquality)
