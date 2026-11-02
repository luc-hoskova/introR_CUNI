#1
#oprav nasledujici kod tak aby matice obsahovala cisla od jedne dale v osmi radcich
matrix(1:25, nrow = 8)

#2
#pojmenujte radky a sloupce v nasledujicim data frame
#provedte pojmenovani alespon dvemi ruznymi zpusoby
#nazvy radku: prvni, druhy, treti, ctvrty
#nazvy sloupcu: vek, overeni, symboly
df <- data.frame(c(15:18),
                 rep(c(TRUE, FALSE), 2),
                 c("alpha", "beta", "omega", "gamma")); df

#3
#vytvorte objekt auta, ktery bude mit dvacet hodnot
#hodnoty v objektu pak musi byt faktory o peti kategoriich

#4
#opravte nasledujici kod, ktery vytvari data frame
cbind(1:3, rep(TRUE, 3), c("a", "b", "c"))

#5
#vytvorte matici, ve ktere se budou stridat radky s cislem 0 a radky s cislem 1
#rozmery matice budou 5 radku a 4 sloupce
#pojmenujte jednotlive dimenze pomoci argumentu dimnams
