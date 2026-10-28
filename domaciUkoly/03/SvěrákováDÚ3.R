# Vyber z následujícího vektoru každou pátou hodnotu
seq(15.2, 45.7, 0.56)
cisla <- seq(15.2, 45.7, 0.56); cisla
seq(5,length(cisla),5)
cisla[seq(5,length(cisla),5)]
# Z datasetu v baseR airquality, který obsahuje informace o měření kvality vzduchu v NYC, vyber hodnoty ze sloupce Temp z prvního týdne v květnu.
data.frame(airquality)
airquality[airquality$Month == 5 &airquality$Day <= 7, "Temp"]
# K datasetu airquality přidejte nový sloupec s názvem Weather který bude obsahovat informaci (text hot), 
# zda hodnoty ve sloupci Temp jsou vyšší než 70. Pokud není vyšší jako 70, bude obsahovat text cold.
airquality$Weather <- "cold"
airquality$Weather[airquality$Temp > 70] <- "hot"; airquality
