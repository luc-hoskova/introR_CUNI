#03. lekce
#############################
#PROCVICOVANI
#############################
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
df[,1] #vektor
df[[1]] #vektor
df[1] #df
df[,1, drop = FALSE] #df

#2
df[c(1, nrow(df)), ]

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

#PROCVICOVANI LIST
#1
lst$povolani <- c(lst$povolani, "pruvodci")

#2
lst$deti$dite1 <- list(
  jmeno = "Petr",
  prijmeni = "Novotný")

lst$deti$dite2 <- list(
  jmeno = "Jana",
  prijmeni = "Novotná")

#PROCVICOVANI PIPES
#1
str(chickwts)
levels(chickwts$feed)
filter(chickwts, feed == "soybean")%>% select(weight) %>% min()

#2
str(quakes)
quakes %>% filter(mag > median(mag)) %>% filter(depth == max(depth)) %>% select(depth)

############################
#SAMOSTATNE CVICENI
############################
#VEKTORY
#1
cisla <- 1878:2324
cisla[cisla %% 3 == 0]
length(cisla[cisla %% 3 == 0])

#MATICE
#1
HairEyeColor["Blond", "Green", "Female"]

#DATA FRAME
#1
load("bikes.RData")
divneHodnoceni <- bikes[bikes$speed + bikes$dist < 50 & bikes$rating < 3,]

#2
rownames(divneHodnoceni)