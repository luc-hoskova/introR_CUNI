#SAMOSTATNE CVICENI VEKTORY
#1
c(1,2,3,1,2,3,9,8,7,2)
c(rep(1:3, 2), 9:7, 2)
c(rep(1:3, 2), seq(9, 7), 2)
#2
#names(kolo) <- c("jmeno", "prijmeni)
#fce: names(kolo) <- tolower(names(kolo))

#as.typ dat()

#PROCVICENI MATICE
#1
matrix(seq(2, 19, by = 3), 2, 3)

#2
LK3 <- c("Lukáš", "Krchov", "ID_003")
HG6 <- c("Helga", "Gdovinová", "ID_006")
TM7 <- c("Tomáš", "Marný")
rbind(LK3, HG6, TM7)

#SAMOSTATNE CVICENI MATICE
a <- 15:20
b <- 37:42
matrix(rep(c(a, b), 3), ncol = length(a),
       byrow = TRUE)

matrix(rep(c(15:20, 37:42), 3), ncol = length(15:20),
       byrow = TRUE)

#PROCVICENI LIST
#1
mouchaření <- list(název = "Pozorování množení octomilek",
                   výzkumníci = c(alfonsMucha = "id_1887", davidCroneberg = "id_1986"),
                   výsledek = c(TRUE, TRUE, FALSE, TRUE, FALSE)); mouchaření

#PROCVICENI DATA FRAME
#1
stainsLiveCells <- c(TRUE, TRUE, FALSE, NA) #přidat NA
stainingType <- c("NucSpot® Live 488", "Thiazole Green (SYBR® Green I)", "RedDot™2 Far-Red Nuclear Stain", "NucSpot® 750/780")
colorMinNm <- c(352, 498, 650, 750)
colorMaxNm <- c(461, 552, 675, 780)

staining <- cbind.data.frame(stainingType, stainsLiveCells, colorMaxNm, colorMinNm)
rownames(staining) <- c("pro studenty", "do laboratoře", "to mi neproplatí", "chybí info"); staining

#SAMOSTATNE CVICENI DATA FRAME
#1
vek <- c(27,35,30,47,42)
sex <- c("female","male","male","female","female")
strana <-c("sin","sin","dx","dx","dx")
id <- c("SC_001", "SC_007", "SC_013", "SC_014", "SC_020")
vzorek <- data.frame(vek, strana, sex, row.names = id); vzorek

#2
clearSample <- sample(c(TRUE, FALSE), size = length(strana), replace = TRUE)
vzorek <- cbind.data.frame(vzorek, clearSample); vzorek

#3
data.frame(znamky = sample(1:5, 6, replace = TRUE),
           jmenaZaku = c(jmenaZaku, NA, NA),
           predmety = rep(c("ČJ", "biologie", "španělština"), 2))

#BALÍČKY
#zkouška nahrání balíčku dplyr

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
vektor2 <- c(age = NA, ageRestriction = NA, group = "voters", region = "Vitkovice")
vektor2[-2]
#co ale s jmenem?
#proc nejde vektor2[-"ageRestriction"]
vektor2[names(vektor2) != "ageRestriction"] #vyber vsech jmen krome ageRestriction

#SAMOSTATNE CVIČENÍ INDEXACE VEKTORY
#1)
hodnoty <- seq(15.2, 45.7, 0.56)
hodnoty[seq(1, length(hodnoty), by = 5)]

#2)
cisla <- 1878:2324
cisla[cisla %% 3 == 0]
#nebo
(1878:2324)[1878:2324 %% 3 == 0]
