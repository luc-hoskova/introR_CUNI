#03. lekce
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

#PROCVICOVSNI INDEXACE MATICE
#1
matice[1, matice[1, ] > 25 | matice[1, ] < 15]

#2
matice[matice[,"c"] == 20,]

#PROCVICOVSNI INDEXACE DATA FRAME
#1
vzorek[,1] #vektor
vzorek[[1]] #vektor
vzorek[1] #df
vzorek[,1, drop = FALSE] #df

#2
vzorek[c(1, nrow(vzorek)), ]

#PROCVICOVANI $
#1
library(dplyr)
str(storms)
storms$wind[storms$year == 1998]
mean(storms$wind[storms$year == 1998])

#2
iris[iris$Sepal.Length < 5, ]
iris[iris$Sepal.Width > 3.5 & iris$Species == "setosa", ]
iris[iris$Sepal.Length < 5 |
       (iris$Sepal.Width > 3.5 & iris$Species == "setosa"), ]

#3
vyber <- iris[iris$Sepal.Length < 5 |
                (iris$Sepal.Width > 3.5 & iris$Species == "setosa"), ]

vyber$Petal.Length
vyber$Petal.Length[vyber$Species == "setosa"]
mean(vyber$Petal.Length[vyber$Species == "setosa"])

#SAMOSTATNE PROCVICOVANI

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

