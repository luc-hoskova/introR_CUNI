#SAMOSTATNE CVICENI VEKTORY
#1
c(1,2,3,1,2,3,9,8,7,2)
c(rep(1:3, 2), 9:7, 2)
c(rep(1:3, 2), seq(9, 7), 2)
#2
#names(kolo) <- c("jmeno", "prijmeni)
#fce: names(kolo) <- tolower(names(kolo))

#as.typ dat()

#SAMOSTATNE CVICENI MATICE
a <- 15:20
b <- 37:42
matrix(rep(c(a, b), 3), ncol = length(a),
       byrow = TRUE)

matrix(rep(c(15:20, 37:42), 3), ncol = length(15:20),
       byrow = TRUE)

#INDEXACE
#můžeme si polohu vybrat a pak ji upravit, tím pádem i přidat
#pamatujete na přepisování?
#Přidávání a odebírání hodnot podle pozice
#y <- 1:5
#y[6] <- 7; y