# 1
vektor <- seq(15.2, 45.7, 0.56);vektor

vektor[seq(5, length(vektor), by = 5)]

#2
airquality <- airquality

str(airquality)

#výběr pouze teploty
airquality$Temp
#výběr pouze teploty za 5 měsíc
airquality$Temp[airquality$Month == 5]

#výběr z prvního týdne v květnu
airquality$Temp[airquality$Month == 5 & airquality$Day %in% 1:7]
# nebo 
airquality$Temp[airquality$Month == 5 & airquality$Day <= 7]


#3
airquality$Weather <- NA
airquality$Weather[airquality$Temp > 70] <- "hot"
airquality$Weather[airquality$Temp < 70] <- "cold"

# nebo
airquality$Weather <- ifelse(airquality$Temp > 70, "hot", "cold")

str(airquality)

head(airquality)

#bonus
data()
