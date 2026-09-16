getwd()
setwd("/Users/samuelherceg/Desktop/domácí-úkol_Herceg")
#kdyz si dam ja sama zde toto nastaveni setwd, tak se mi ten skript nespusti
#zadna takovato slozka u me neni
#RProjekty uz maji working directory nastaveny
list.files()

load("promenne.RData")

#Počet zamestnancov metódou normálneho delenia
pocetZamestnancov = rozpocet / (plat * pocetMesicu) 
pocetZamestnancov

#Počet zamestnancov metódou delenia bez zvyšku
pocetZamestnancov2 = rozpocet %/% (plat * pocetMesicu)
pocetZamestnancov2
