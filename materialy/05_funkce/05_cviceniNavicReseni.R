#1
#urceni hodnot
polomer <- c(2, 3, 4)
vyska <- c(10, 12, 15)

#vytvoreni fce
objem_valce <- function(r, h) {
  pi * r^2 * h
}

#aplikovani fce
mapply(objem_valce, polomer, vyska)

#2
#vytvoreni matice
laboratorniHodnoty <- matrix(
  c(4.5, 5.2, 6.1, 4.8, 7.0,
    5.5, 6.2, 4.9, 5.1, 6.8,
    13.2, 14.5, 12.8, 15.1, 16.0,
    11.9, 13.5, 14.2, 12.5, 15.8,
    80, 95, 110, 75, 130,
    90, 105, 85, 120, 100),
  nrow = 10,
  ncol = 3)

colnames(laboratorniHodnoty) <- c("glukoza", "hemoglobin", "cholesterol")
rownames(laboratorniHodnoty) <- paste0("Pacient_", 1:10)

laboratorniHodnoty

#spocitani prumeru
prumery <- apply(laboratorniHodnoty, 2, mean); prumery

#vyber pacienty, kteri maji alespon v jednom sloupci hodnoty vyssi nez prumer
nadPrumerem <- apply(laboratorniHodnoty, 1, function(x) any(x > prumery))
  #aplikuj funkci, ktera kontroluje ze alespon jedna hodnota v radku je vyssi nez prumer pro dany sloupec

#vypis pacientu splnujicich podminku
laboratorniHodnoty[nadPrumerem, ]

#3
#vytvoreni tabulky
pacienti <- data.frame(
  jmeno = paste0("Pacient_", 1:15),
  vek = c(25, 45, 65, 72, 30, 55, 60, 40, 80, 35, 50, 68, 22, 75, 58),
  tlak = c(115, 145, 165, 180, 95, 155, 135, 125, 190, 140, 150, 170, 110, 185, 130),
  BMI = c(22, 31, 28, 42, 17, 35, 26, 24, 45, 29, 33, 38, 20, 41, 27),
  cholesterol = c(180, 240, 220, 260, 170, 245, 195, 190, 280, 210, 230, 255, 165, 275, 200))

#vypocet skore
pacienti$risk_skore <- 
  (pacienti$vek >= 60) +
  (pacienti$tlak >= 140) +
  (pacienti$BMI >= 30) +
  (pacienti$cholesterol >= 240)

#prirazeni doporuceneho postupu
pacienti$doporuceny_postup <- ifelse(
  pacienti$risk_skore >= 3,
  "Doporucena kontrola",
  "Bezne sledovani")

#divite se vypoctu skore? projedte si nasledujici kod
#pamatujete, jak jsme si popisovali booleany? ;]
as.numeric(TRUE)
as.numeric(FALSE)