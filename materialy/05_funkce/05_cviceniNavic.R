#1
#Vytvor funkci, ktera spocita objem valce a aplikuj ji na nasledujici mereni tri valcu.
polomer <- c(2, 3, 4)
vyska <- c(10, 12, 15)

#2
#Vyber z tabulky pouze ty pacienty, kteri maji alespon jednu z hodnot vyssi jak prumer.
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

#3
#Mas pacienty s nasledujicimi informacemi:
pacienti <- data.frame(
  jmeno = paste0("Pacient_", 1:15),
  vek = c(25, 45, 65, 72, 30, 55, 60, 40, 80, 35, 50, 68, 22, 75, 58),
  tlak = c(115, 145, 165, 180, 95, 155, 135, 125, 190, 140, 150, 170, 110, 185, 130),
  BMI = c(22, 31, 28, 42, 17, 35, 26, 24, 45, 29, 33, 38, 20, 41, 27),
  cholesterol = c(180, 240, 220, 260, 170, 245, 195, 190, 280, 210, 230, 255, 165, 275, 200))

#Mame tabulku, na zaklade ktere se vypocitava skore rizika.
#Za kazdou splnenou podminku se pricte 1 bod; finalni skore muze byt 0-4.
  #vek alespon 60 let
  #tlak 140 mmHg
  #BMI alespon 30
  #cholesterol alespon 240

#Podle skore rizika se pak urcuji kategorie doporucovaneho postupu
  #Doporucena kontrola pri skore alespon 3
  #Bezne sledovani pri skore nizsim nez 3

#Pripis ke kazdemu pacientovi jeho risk skore a doporuceny postup