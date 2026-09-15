getwd()
setwd("/Users/samuelherceg/Desktop/domácí-úkol_Herceg")
list.files()


load("promenne.RData")

#Počet zamestnancov metódou normálneho delenia
pocetZamestnancov = rozpocet / (plat * pocetMesicu) 
pocetZamestnancov

#Počet zamestnancov metódou delenia bez zvyšku
pocetZamestnancov2 = rozpocet %/% (plat * pocetMesicu)
pocetZamestnancov2
