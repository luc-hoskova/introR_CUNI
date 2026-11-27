#Zadání
library(dplyr)

rodicky_cesko <- read_csv("Otevrena-data-NR-12-16-rodicky-cesko.csv")

str(rodicky_cesko)

#1) Kolik rodiček, u kterých byla diagnostikována porucha vcestné placenty, utrpělo při porodu komplikaci v podobě abrupce placenty,  ztrátu krve více než 500 ml a nakonec jim byla provedena porodní hysterektomie? A v jakých letech byly tyto porody provedeny?

x <- as.data.frame(rodicky_cesko)
x1 = x[which(as.character(x[, 25]) == "1"), ]
x2 <- x1[which(x1[, 22] > 0 & x1[, 22] < 2), ]
x3 = subset(x2, x2[, 36] == TRUE)
x3[which(x3[, 38] == 1), ] -> x4

pocet = 0; roky = NULL
for (i in 1:nrow(x4)) {pocet = pocet + 1; roky = c(roky, x4[i, 1])}
print(table(roky))
  
#2) Jaký je medián kategorie všech rodiček rodících císařským řezem pro délku hospitalizace?

d2 <- as.data.frame(rodicky_cesko)
jen_cisar = d2[which(is.na(d2[, 46]) == FALSE), ]
hospitalizace = as.numeric(jen_cisar[, 56])
hospitalizace = hospitalizace[which((hospitalizace %in% c(0, 1, 2, 3, 4, 5, 6, 7, 8)) == TRUE)]

rada <- sort(hospitalizace)
vysledek = rada[round(length(rada) / 2)]; vysledek

  
#3) Jaká je nejčastější kombinace rodinného stavu a vzdělání? Např.: nejvíce dětí se narodilo vdovám se základním vzděláním.

as.data.frame(rodicky_cesko) -> treti
stavy = unique(treti[, 5])
vzdelani = unique(treti[, 6])

nejvic_deti = -1; vitez_s = NA; vitez_v = NA

for (s in stavy) {
  if (is.na(s) == FALSE) {
    for (v in vzdelani) {
      if (is.na(v) == FALSE) {
        radky = which(treti[, 5] == s & treti[, 6] == v)
        kolik_deti = sum(as.numeric(treti[radky, 9]), na.rm = TRUE)
        if (kolik_deti > nejvic_deti) {
          kolik_deti -> nejvic_deti; s -> vitez_s; v -> vitez_v}}}}}

text_stav = ifelse(vitez_s == 1, "Svobodná", ifelse(vitez_s == 2, "Vdaná (vč. družky)", ifelse(vitez_s == 3, "Rozvedená", ifelse(vitez_s == 4, "Vdova"))))
text_vzdelani = ifelse(vitez_v == 1, "Základní i neukončené", ifelse(vitez_v == 2, "Střední bez maturity", ifelse(vitez_v == 3, "Střední i s maturitou", ifelse(vitez_v == 4, "Vysokoškolské"))))

paste("Nejvíce dětí (", nejvic_deti, ") se narodilo: ", text_stav, " + ", text_vzdelani)

#4) Jaký je rozdíl v počtu narozených dětí mezi roky s nejvyšším a nejnižším počtem porodů?

ctverka <- data.frame(rodicky_cesko)
posledni <- sort(table(ctverka[, 1])) # jako posledni otazka :)

rozdil_porodu <- as.numeric(posledni[length(posledni)]) - as.numeric(posledni[1]) # 1 řádek = 1 dítě

rok_min <- as.numeric(names(posledni)[1]) 
rok_max <- as.numeric(names(posledni)[length(posledni)])
deti_max <- sum(ctverka[which(ctverka[, 1] == rok_max), 9], na.rm = TRUE)
deti_min <- sum(ctverka[which(ctverka[, 1] == rok_min), 9], na.rm = TRUE)
rozdil_deti = deti_max - deti_min   # Rozdíl narozenych dětí podle sloupce 9 (cetnost_tehotenstvi) pokud budeme 2 považovat za dvojčata, ale defakto to nejde zjistit, protože v tabulce rozlišuji pouze jedno a vícečetné

paste("Rozdil poctu porodu:", rozdil_porodu)
paste("Rozdil v poctu narozenych deti:", rozdil_deti)

#Řešení
#1)
#2012 1
#2015 1
#2016 4
#2017 2
#2021 2
#2023 1

#2)
#5 dní

#3)
#Nejvíce dětí se narodilo vdaným ženám s ukončenou střední školou s maturitou.

#4)
#41412