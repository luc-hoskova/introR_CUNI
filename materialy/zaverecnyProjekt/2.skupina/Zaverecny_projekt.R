# Nacteni dat pres nespravnou funkci, data se nactou v 1 sloupci oddelene carkou, 
# na toto nacteni a dalsi zpracovani dat jsem prisla diky nesnazim pri stazeni dat
data <- read_table("~/R course/Zaverecny projekt/Otevrena-data-NR-10-13-novorozenci-cesko.csv")
data

# Nacteni balicku pro usporadani dat, nadbytecne kroky
library(tidyr)

# Rozdeleni dat do sloupcu, nazvy sloupcu by zustaly dohromady, proto je 
# nezbytne rozdeli i sloupce
Data_rozdelena <- data %>%
  separate_wider_delim(
    cols = 1,
    delim = ",",
    names = strsplit(names(data)[1], ",")[[1]]
    )
Data_rozdelena

# Nutnost premeny datoveho typu a odstraneni uvozovek
Data_rozdelena <- type_convert(Data_rozdelena)
names(Data_rozdelena) <- gsub('"', '', names(Data_rozdelena))
Data_rozdelena <- Data_rozdelena %>%
  mutate(across(where(is.character), ~ gsub('"', '', .x)))
Data_rozdelena

# Umyslne nikde nenacitam strukturu nebo hlavicku tabulky, nacteni balicku
# pro vypocty uprostred skriptu
library(tidyverse)

# Ukol 1
# nevyuziti pipeline, zbytecna tvorba nekolik tabulek
D1.1 <- filter(Data_rozdelena, pohlavi == 2)
D1.2 <- filter(D1.1, gestacni_stari == 1)
D1.3 <- filter(D1.2, porodni_hmotnost == 1)
D1.4 <- filter(D1.3, vaginalne_spontanne == 1)
D1.5 <- filter(D1.4, lecba_sal_masaz == 1)
nrow(D1.5)

# Ukol 2
# nevyuziti pipeline, zanechani NA hodnot, zjisteni maxima bez urceni kategorie,
# prejmenovani jen jedne kategorie a pres souradnice, nespravne rekodovani 
# hodnot
D2.1 <- filter(Data_rozdelena, pohlavi == 1)
D2.2 <- filter(D2.1, lecba_sal_intubace == 1)
D2.3 <- filter(D2.2, lecba_odd_steroidy_BPD == 1)
D2.4 <- group_by(D2.3, porodni_hmotnost)
D2.5 <- count(D2.4)
max(D2.5$n)
D2.5$porodni_hmotnost <- as.character(D2.5$porodni_hmotnost)
D2.5[1,1] <- "Mene nez 1500 g"
D2.5[1,1]

# Ukol 3
# nevyuziti pipeline, odstraneni hodnoty NA vymazanim radku, 
# prepsani sloupce podle pozice
D3.1 <- filter(Data_rozdelena, vrozena_vada == 1)
D3.2 <- group_by(D3.1, gestacni_stari)
D3.2 <- count(D3.2)
D3.2
D3.2 <- D3.2[-5,]
D3.2
D3.2[[1]] <- c("<= 31+6 týden těhotenství", "32+0–36+6 týden těhotenství", "37+0–38+6 týden těhotenství", ">= 39+0 týden těhotenství") 
D3.2

# Ukol4
# nevyuziti pipeline, pouziti ifelse bez zajisteni jinych hodnot,
# pouziti funkce table() radici kategorie abecedne,
# porovnavani pozic ve vektoru, vysledek pres poradi pozic pomoci ifelse
D4.1 <- filter(Data_rozdelena, vrozena_vada == 1)
D4.2 <- filter(D4.1, propusteni_duvod == 3)
D4.2$pohlavi <- ifelse(D4.2$pohlavi == 1, "Chlapci", "Devcata")
D4.2
pohlavi <- table(D4.2$pohlavi)
pohlavi
vysledek4 <- ifelse(pohlavi[2] > pohlavi[1], "Chlapci", "Devcata")
vysledek4


