#1
#oprav nasledujici kod tak aby matice obsahovala cisla od jedne dale v osmi radcich
matrix(1:32, nrow = 8) #cislo musi byt delitelne 8

#2
#pojmenujte radky a sloupce v nasledujicim data frame
#provedte pojmenovani alespon dvemi ruznymi zpusoby
#nazvy radku: prvni, druhy, treti, ctvrty
#nazvy sloupcu: vek, overeni, symboly

#2.1. moznost
df1 <- data.frame(c(15:18),
                  rep(c(TRUE, FALSE), 2),
                  c("alpha", "beta", "omega", "gamma")); df1

rownames(df1) <- c("prvni", "druhy", "treti", "ctvrty"); df1
colnames(df1) <- c("vek", "overeni", "symboly"); df1

#2.2.moznost
vek <- c(15:18)
overeni <- rep(c(TRUE, FALSE), 2)
symboly <- c("alpha", "beta", "omega", "gamma")

df2 <- data.frame(vek, overeni, symboly,
                  row.names = c("prvni", "druhy", "treti", "ctvrty")); df2

#2.3. moznost
df3 <- data.frame(vek = c(15:18),
                  overeni = rep(c(TRUE, FALSE), 2),
                  symboly = c("alpha", "beta", "omega", "gamma"),
                  row.names = c("prvni", "druhy", "treti", "ctvrty")); df3

#2.4. moznost
df4 <- data.frame(c(15:18),
                  rep(c(TRUE, FALSE), 2),
                  c("alpha", "beta", "omega", "gamma")); df4

dimnames(df4) <- list(c("prvni", "druhy", "treti", "ctvrty"),
                      c("vek", "overeni", "symboly")); df4

#3
#vytvorte objekt auta, ktery bude mit dvacet hodnot
#hodnoty v objektu pak musi byt faktory o peti kategoriich

#jedna z mnoha moznosti
kategorie <- c("skoda","nissan","toyota","opel","fiat")
auta <- as.factor(rep(kategorie, length.out = 20)); auta
str(auta) #5 kategorii
length(auta) #20

#4
#opravte nasledujici kod, ktery vytvari data frame

#4.1. moznost
m1 <- data.frame(1:3, rep(TRUE, 3), c("a", "b", "c")); m1
str(m1)

#4.2. moznost
m2 <- cbind.data.frame(1:3, rep(TRUE, 3), c("a", "b", "c")); m2
str(m2)

#zpusobu samozrejme existuje i vice

#5
#vytvorte matici, ve ktere se budou stridat radky s cislem 0 a radky s cislem 1
#rozmery matice budou 5 radku a 4 sloupce
#pojmenujte jednotlive dimenze pomoci argumentu dimnams

#5.1. moznost
nulaJedna <- rep(0:1, length.out = 5); nulaJedna
matice1 <- matrix(rep(nulaJedna, 4),
                  nrow = 5,
                  ncol = 4,
                  dimnames = list(c("I", "II", "III", "IV", "V"),
                                  c("a", "b", "c", "d"))); matice1

#5.2. moznost
opakovani <- rep(c(0, 1), length.out = 5); opakovani
matice2 <- matrix(opakovani,
                 nrow = 5, #matice automaticky doplni hodnoty
                 ncol = 4,
                 dimnames = list(c("I", "II", "III", "IV", "V"),
                                 c("a", "b", "c", "d"))); matice2

#5.3. moznost
dlouheCislo <- rep(c(0, 0, 0, 0, 1, 1, 1, 1),
                   length.out = 20); dlouheCislo
matice3 <- matrix(dlouheCislo,
                  nrow = 5,
                  byrow = TRUE,
                  dimnames = list(c("I", "II", "III", "IV", "V"),
                                  c("a", "b", "c", "d"))); matice3

#a mnoho dalsich...
