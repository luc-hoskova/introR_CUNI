# 1. Vyber z následujícího vektoru každou pátou hodnotu.
vektro <- seq(15.2, 45.7, 0.56)
vektro [seq(5, length(vektro), by = 5)]
# Z datasetu (co je nahraný v R) jménem airquality, který obsahuje informace o měření kvality 
# vzduchu v NYC, vyber hodnoty ze sloupce Temp z prvního týdne v květnu.
airquality
str(airquality) #data.frame
airquality$Temp[airquality$Month == 5 & airquality$Day <= 7]

# K datasetu airquality přidejte nový sloupec s názvem Weather který bude obsahovat informaci 
# (text hot), zda hodnoty ve sloupci Temp jsou vyšší než 70. Pokud není vyšší jako 70, 
# bude obsahovat text cold.
airquality <- within(airquality, {Weather <- ifelse(Temp > 70, "hot", "cold")})

