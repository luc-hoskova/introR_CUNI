### 1)Vyber z následujícího vektoru každou pátou hodnotu

seq(15.2, 45.7, 0.56)
# ulozim do promenne
x <- seq(15.2, 45.7, 0.56)
#vytvorim index na kazde pate pozici a vyberu cisla s indexem
x[seq(5, length(x), by = 5)]

### 2) Z datasetu (co je nahraný v R) jménem airquality, který obsahuje informace o měření kvality vzduchu v NYC, vyber hodnoty ze sloupce Temp z prvního týdne v květnu.

data(airquality)
airquality

# ve sloupci temp vyberu hodnoty kdy mesic odpovida hodnote 5 a den je mensi nebo rovno 7
airquality[airquality$Month == 5 & airquality$Day <= 7, "Temp"]

### 3) K datasetu airquality přidejte nový sloupec s názvem Weather který bude obsahovat informaci (text hot), zda hodnoty ve sloupci Temp jsou vyšší než 70. Pokud není vyšší jako 70, bude obsahovat text cold.

# pouziji funkci ifelse, ktera podle podminky (teplota vyssi nez 70) priradi bud hot (TRUE) nebo cold (FALSE)
airquality$Weather <- ifelse(airquality$Temp > 70, "hot", "cold")
airquality

## bonus
data()
help(data)