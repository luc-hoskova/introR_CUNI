#1.Vyber z následujícího vektoru každou pátou hodnotu
vektor <- seq(15.2, 45.7, 0.56)

#každá piata pozícia
seq(from = 5, to = length(vektor), by = 5)

#indexovanie 
vektor[seq(from = 5, to = length(vektor), by = 5)]

#2. Z datasetu (co je nahraný v R) jménem airquality, 
#který obsahuje informace o měření kvality vzduchu 
#v NYC, vyber hodnoty ze sloupce Temp z prvního 
#týdne v květnu.
head(airquality,10)

#květen
airquality$Month == 5

#prvý týžden květen
airquality$Day <= 7

#teplota 
airquality$Temp[(airquality$Month == 5) & (airquality$Day <= 7)]

#3. K datasetu airquality přidejte nový sloupec s názvem Weather 
#který bude obsahovat informaci (text hot), zda hodnoty ve sloupci 
#Temp jsou vyšší než 70. Pokud není vyšší jako 70, bude obsahovat text cold.

#nižší
airquality$Temp <=70 
#vyšší
airquality$Temp >70 
#vytvorenie Weather 
airquality$Weather <- airquality$Temp
head(airquality,10)
#Cold
airquality$Weather [airquality$Temp <=70] <- "cold"
#Hot
airquality$Weather [airquality$Temp >70] <- "hot"

head(airquality,25)

#Bonus:Pokuste se zjistit, jak si v nápovědě můžete
#najít seznam nahraných datasetů v R (iris, cars, dplyr::starwars a jiné)
?data
data() 
data(package = "dplyr")
