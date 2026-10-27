# 1
vektor <- seq(15.2, 45.7, 0.56);vektor

vektor[seq(5, length(vektor), by = 5)]

#2
airquality <- airquality
#je potreba si takto dataset znovu nahravat?
#dataset airquality je jiz defaultne v pameti R pritomen
#zkuste si vycistit globalni prostredi a pak projet kod, ktery vytvari novy sloupec
  #pozorujte u toho globalni prostredi
str(airquality)
#chvalim za prohlednuti si struktury

#výběr pouze teploty
airquality$Temp
#výběr pouze teploty za 5 měsíc
airquality$Temp[airquality$Month == 5]

#výběr z prvního týdne v květnu
airquality$Temp[airquality$Month == 5 & airquality$Day %in% 1:7]
# nebo 
airquality$Temp[airquality$Month == 5 & airquality$Day <= 7]
#pochvala za pouziti obou moznosti
  #predevsim vzpomenuti si na %in%

#3
airquality$Weather <- NA
airquality$Weather[airquality$Temp > 70] <- "hot"
airquality$Weather[airquality$Temp < 70] <- "cold"
#je opravdu potreba nejdrive vytvaret prazde hodnoty?
#nemuzeme treba naplnit sloupec jednou z hodnot a pak jen doplnit druhou?

# nebo
airquality$Weather <- ifelse(airquality$Temp > 70, "hot", "cold")
#ifelse budeme probirat az v pate hodine, ale je dobre ze se divate na dalsi moznosti
str(airquality)

head(airquality)

#bonus
data()
#chvalim za bonus