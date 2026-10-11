#1
#oprav nasledujici kod tak aby matice obsahovala cisla od jedne dale v osmi radcich
matrix (1:24, nrow = 8)

#2
#pojmenujte radky a sloupce v nasledujicim data frame
#provedte pojmenovani alespon dvemi ruznymi zpusoby
#nazvy radku: prvni, druhy, treti, ctvrty
#nazvy sloupcu: vek, overeni, symboly
cisla <- c(15:18)
boolean <- rep(c(TRUE, FALSE), 2)
text <- c("alpha", "beta", "omega", "gamma")

#data.frame(cisla, boolean, text, 
#Sposob1        
tabulka1 <- data.frame(cisla, boolean, text, 
           row.names = c("prvni", "druhy", "treti", "ctvrty"))
colnames(tabulka1) <- c("vek", "overeni", "symboly")
tabulka1

#Sposob2
tabulka2 <- data.frame(cisla, boolean, text) 
dimnames(tabulka3) <- list(c("prvni", "druhy", "treti", "ctvrty"),
                           c("vek", "overeni", "symboly"))
tabulka2

#3
#vytvorte objekt auta, ktery bude mit dvacet hodnot
#hodnoty v objektu pak musi byt faktory a peti kategoriich
auta1 <- as.factor (c("audi","audi","audi","audi",
           "bmw","bmw","bmw","bmw",
           "opel","opel","opel","opel",
           "seat","seat","seat","seat",
           "skoda","skoda","skoda","skoda"))
auta1     
str(auta1)

#4
#opravte nasledujici kod, ktery vytvari data frame
oprava <- cbind.data.frame(1:3, rep(TRUE, 3), c("a", "b", "c"))
oprava

#5
#vytvorte matici, ve ktere se budou stridat radky s cislem 0 a radky s cislem 1
#rozmery matice budou 5 radku a 4 sloupce
#pojmenujte jednotlive dimenze pomoci argumentu dimnams

matrix(rep(rep(0:1,length.out=5),times=4),
       byrow=FALSE, 
       nrow=5, 
       ncol=4,
       dimnames=list(c("jedna","dva","tri","stryri","pet"),
                     c("I","II","III","IV")))
       