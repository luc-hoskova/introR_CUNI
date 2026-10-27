# Domaci ukol, lekce 3 (Indexace)
# Eva Kamenna


# 1) Vyber z nasledujiciho vektoru kazdou patou hodnotu
fifth <- seq(15.2, 45.7, 0.56)

div <- c( (1: length(fifth)) %% 5 == 0 ) # TRUE na kazde pate pozici

fifth[div]



# 2) Z datasetu v baseR airquality, ktery obsahuje informace o mereni
#    kvality vzduchu v NYC, vyber hodnoty ze sloupce Temp z prvniho
#    tydne v kvetnu.

head(airquality)
str(airquality) 
airquality[airquality$Month == 5 & airquality$Day <= 7, "Temp"] # tady jsem se zasekala s definicí 1:7, <= je lepší

# 3) K datasetu airquality pridejte novy sloupec s nazvem Weather, ktery
#    bude obsahovat informaci (text hot), zda hodnoty ve sloupci Temp jsou
#    vyssi nez 70. Pokud neni vyssi jako 70, bude obsahovat text cold.

airquality$Weather <- "cold"                               # v prezentaci je přepis hodnot, jinak bych asi použila funkci ifelse 
airquality$Weather[airquality$Temp > 70] <- "hot" 
head(airquality) 

# Bonus: Pokuste se zjistit, jak si v napovede muzete najit seznam
#        nahranych datasetu v R (iris, cars, dplyr::starwars a jine).

