#DOMACI UKOL
#1
#2
#3
starwars$name[
  !is.na(starwars$name) &
    starwars$homeworld == "Tatooine" &
    starwars$species != "Droid"]
#nebo
as.vector(
  na.omit(starwars$name[
    starwars$homeworld == "Tatooine" &
      starwars$species != "Droid"
  ])
)
#nebo
swJmena <- na.omit(starwars)
swJmena$name[swJmena$homeworld == "Tatooine" &
               swJmena$species != "Droid"]


#INDEXACE
#výběr sloupce s mezerou
#můžeme si polohu vybrat a pak ji upravit, tím pádem i přidat
#pamatujete na přepisování?
#Přidávání a odebírání hodnot podle pozice
#y <- 1:5
#y[6] <- 7; y

#PROCVICOVANI INDEXACE VEKTORY
#1
x <- c(15, 87, 23, 91, 42, 68, 54, 78, 54, 45, 10, 98, 54, 98)
length(x)
x[11:14]
#nebo
x[(length(x)-3):length(x)]

#2
vektor2 <- c(gender = NA, ageGroup = NA, activeVoters = NA,
             country = "CZ", region = "Ostravsko", city = "Havířov")
vektor2[-2]
#co ale s jmenem?
#proc nejde vektor2[-"ageGroup"]
vektor2[names(vektor2) != "ageRestriction"] #vyber vsech jmen krome ageGroup

#SAMOSTATNE CVIČENÍ INDEXACE VEKTORY
#1)
hodnoty <- seq(15.2, 45.7, 0.56)
hodnoty[seq(0, length(hodnoty), by = 5)]

#2)
cisla <- 1878:2324
length(cisla[cisla %% 3 == 0])
#nebo
length((1878:2324)[1878:2324 %% 3 == 0])

#PROCVICOVSNI INDEXACE MATICE
#1
matice[matice > 30]

#2
matice[1, matice[1, ] > 25 | matice[1, ] < 15]

#3
matice[matice[,"c"] == 20,]

#4
dim(matice)
matice[matice[,1] %% 2 == 1,seq(0, 6, by = 2)]
#co kdyz to chceme udelat v jednom radku
matice[matice[,1] %% 2 == 1,seq(0,ncol(matice), by = 2)]


#´pouzivani apostrofu u nazvu s mezerou´
  #rename funkce?
#sort() a order()
#merge()
#as.numeric a tak funkce
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

#funkce which vybere cidla radku podle podminky
df <- data.frame(
  name = c("Anna", "Bob", "Carl", "Dan"),
  age = c(18, 25, 17, 30))
which(df$age >= 18)

