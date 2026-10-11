#1
#oprav nasledujici kod tak aby matice obsahovala cisla od jedne dale v osmi radcich
matrix(1:32, nrow = 8) #v poradku

#2
#pojmenujte radky a sloupce v nasledujicim data frame
#provedte pojmenovani alespon dvemi ruznymi zpusoby
#nazvy radku: prvni, druhy, treti, ctvrty
#nazvy sloupcu: vek, overeni, symboly
cisla <- c(15:18)
boolean <- rep(c(TRUE, FALSE), 2)
text <- c("alpha", "beta", "omega", "gamma")

data.frame (cisla, boolean, text, row.names = c("prvni", "druhy", "treti", "ctvrty"))
data.frame (vek = cisla, overeni = boolean, symboly = text, row.names = c("prvni", "druhy", "treti", "ctvrty"))          
#opravdu mame spravne nazvy sloupcu? ;]

#3
#vytvorte objekt auta, ktery bude mit dvacet hodnot
#hodnoty v objektu pak musi byt faktory a peti kategoriich
kategorie <- c("skoda","tesla","dacia","opel","fiat")
auta <- factor(rep(kategorie, length.out = 20))
auta
#hezky vymysleno! hlavne je to usporne :]

#4
#opravte nasledujici kod, ktery vytvari data frame
data.frame(cisla = 1:3, vyrok = rep(TRUE, 3), kategorie = c("a", "b", "c"))
#spravne, na zamysleni: existuje i varianta cbind fce co by slo pouzit?

#5
#vytvorte matici, ve ktere se budou stridat radky s cislem 0 a radky s cislem 1
#rozmery matice budou 5 radku a 4 sloupce
#pojmenujte jednotlive dimenze pomoci argumentu dimnams

opakovani <-rep(c(0, 1), length.out = 5) #hezky usporne!
matice <- matrix((data = opakovani), nrow = 5,ncol = 4, dimnames = list(c("I", "II", "III", "IV", "V"), c("a", "b", "c", "d")))
matice

