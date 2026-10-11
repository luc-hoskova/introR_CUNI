#04. lekce
#DOMACI UKOL
#1)
hodnoty <- seq(15.2, 45.7, 0.56)
hodnoty[seq(0, length(hodnoty), by = 5)]

#2)
filter(airquality, Month == 6, Day %in% 1:7) %>% select(Temp) %>% unlist()

#3
airquality$Weather[airquality$Temp > 70] <- "hot"
airquality$Weather[airquality$Temp <= 70] <- "cold"


#´pouzivani apostrofu u nazvu s mezerou´
#rename funkce?
#sort() a order()
#merge()
#grep funkce
#https://www.statology.org/r-grep-match-replace/
#slouží k vyhledávání vzorů ve vektorech a jejich nahrazení
#práce s vektorem jako s textem v 2 cvičení LP

#janitor package

#data.frame stringsAsFactors

#!is.na

#problém při vyhledávání pokud totožné názvy sloupců, potřeba kontroly a nebo u velkých datasetů alespoň prohnat check.names

#přidávání textu k číslům aka jak to udělat abych měl najendou 50 ID jako texty s "id_01", "id_02" a tak dál
#paste0()

#group by a ungroup
