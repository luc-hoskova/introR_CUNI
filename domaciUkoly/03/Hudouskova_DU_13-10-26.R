sekvence1 <- seq(15.2, 45.7, 0.56);sekvence1
length(sekvence1)
sekvence2 <- sekvence1[c(seq(5, 55, 5))]; sekvence2
length(sekvence2)

airquality
airquality$Temp[airquality$Month==5&airquality$Day<=7]
airquality$Weather[airquality$Temp>70] <- "hot"
airquality$Weather[airquality$Temp<=70] <- "cold"
airquality

ls("package:datasets") #jen balicek "datasets"
data() #vsechny balicky, ktere jsou lodaded
data(package = .packages(all.available = TRUE)) #vsechny balicky, ktere jsou k dispozici (tedy i not-loaded)
