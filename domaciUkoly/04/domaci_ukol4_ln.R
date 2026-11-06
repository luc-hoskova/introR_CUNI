#ukol1
#Najděte specifickou funkci v balíčku dplyr,
#která umožňuji přepisování hodnot na NA

library(dplyr)
seznam<-ls("package:dplyr")
str(seznam)
grep("na",seznam,value = TRUE)
help(na_if)

#ukol2
#Načti si dataset typBydleni.csv
library(readr)
typBydleni <- read_csv("typBydleni.csv")
View(typBydleni)
str(typBydleni)
library(readr)
#opravuju do noveho datasetu, aby mi puvodni zustal k opravam
#oprava typu dat u veku z charakteru na numeric
#vytvoreni faktoru u uzemi, bydleni a pohlavi
bydleni1 <- typBydleni %>% 
  mutate(
    vek_txt = parse_number(vek_txt),
    uzemi_txt = as.factor(uzemi_txt),
    pohlavi_txt = as.factor(pohlavi_txt),
    bydleni_txt = as.factor(bydleni_txt)
      )
str(bydleni1)
#kontrola typu uzemi a bydleni
levels(bydleni1$uzemi_txt)
levels(bydleni1$bydleni_txt)

#2.1.Kolik osob ve věku 18-26 včetně v Jihomoravském kraji 
#jsou evidováni jako osoby bez domova,
#a jakou procentuální část z nich tvoří muži a jakou ženy.
bydleni2<- bydleni1 %>%
filter(
  vek_txt %in% 18:26,
  uzemi_txt == "Jihomoravský kraj",
  bydleni_txt == "Bezdomovci") %>%
  select(pohlavi_txt,bydleni_txt, uzemi_txt)
bydleni2
#vypocet procentualniho zastoupeni
#varianta se zapoctenim NA
bydleni2 %>%
  count(pohlavi_txt) %>%
  mutate(procentualni_zastoupeni = (n / sum(n)) * 100)
#varianta s odstranenim NA (ale to je asi blbost, ti lidi existuji)
bydleni2 %>%
  filter(!is.na(pohlavi_txt)) %>% 
  count(pohlavi_txt) %>%
  mutate(procentualni_zastoupeni = (n / sum(n)) * 100)

#2.Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízení?
levels(bydleni1$bydleni_txt)
bydleni1 %>%
  #filtr ubytovaci zarizeni
  filter(
    bydleni_txt == "Osoby žijící v ubytovacím zařízení") %>%
  #pocet lidi v jednotlivych krajich
  count(uzemi_txt, name = "pocet_obyvatel")
#a tady jsem se zasekla, protoze takto maji vsechny kraje stejny pocet
#hledam chybu uz od zacatku a nemuzu najit



      