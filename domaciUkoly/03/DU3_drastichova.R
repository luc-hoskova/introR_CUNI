# Domaci ukol 1 Zpusob 1 
vektor <- seq(15.2, 45.7, 0.56) # vytvoreni vektoru s hodnotami
vektor # kontrola zapisu
length(vektor) # urceni poctu hodnot
vektor[c(5,10,15,20,25,30,35,40,45,50,55)] # vyber kazde 5. hodnoty pomoci funkce concatenate

# Domaci ukol 1 Zpusob 2
vektor <- seq(15.2, 45.7, 0.56) # vytvoreni vektoru s hodnotami
vektor # kontrola zapisu
length(vektor) # urceni poctu hodnot
vektor[seq(from =5, to = 55, by=5)] # vyber kazde 5. hodnoty pomoci funkce sequence

# Domaci ukol 2 Zpusob 1
head(airquality) #Zobrazeni tabulky k nahlednuti dat
airquality1 <- airquality[airquality$Month == 5 & airquality$Day %in% 1:7, ] # Vyber 1. tydne v kvetnu
airquality1 # Zobrazeni vybranych dat
airquality1$Temp # Zobrazeni hodnot teploty v 1. tydnu kvetna

# Domaci ukol 2 Zpusob 2 Soucasne vyfiltrovani a zobrazeni dat
airquality[airquality$Month == 5 & airquality$Day %in% 1:7, "Temp"]

#Domaci ukol 2 Zpusoby, ktere nejsou spravne
# airquality$Temp neni podminkou, proto je vypsana cela tabulka
airquality[airquality$Month == 5 & airquality$Day %in% 1:7 & airquality$Temp, ]
# hodnoty nejsou jako vektor, ale jako dataframe
airquality[airquality$Month == 5 & airquality$Day %in% 1:7, "Temp", drop=FALSE]

#Domaci ukol 3 Zpusob 1 Vyuziti $ a funkce ifelse
airquality$Weather <- ifelse(airquality$Temp > 70, "hot", "cold") 
airquality #Kontrola zapisu

#Domaci ukol 3 Zpusob 2 Kombinace funkci cbind a ifelse
airqualityweather <- cbind(airquality, Weather = ifelse(airquality$Temp > 70, "hot", "cold")) #Pridani sloupce
airqualityweather # Kontrola zapisu, zdvojeni sloupce Weather kvuli prepisu airquality prvnim zpusobem

#Domaci ukol Knihovna datasetu
# prvni dva zpusoby odpovidaji zadani, dalsi jsou zobrazeny jako skript, nikoliv v Help
help(package = "datasets") # Datasety v Help z baseR
help(package = "dplyr") # Datasety v Help z dplyr
data(package = .packages(all.available = TRUE)) # Objevi se jako skript
library(help = "datasets") # Objevi se jako skript
library(help = "dplyr") # Objevi se jako skript
data() # Objevi se jako skript
