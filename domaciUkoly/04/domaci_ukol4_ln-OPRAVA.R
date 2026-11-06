#ukol1
#Najděte specifickou funkci v balíčku dplyr,
#která umožňuji přepisování hodnot na NA

library(dplyr)
seznam<-ls("package:dplyr")
str(seznam)
grep("na",seznam,value = TRUE)
help(na_if)
#hezky ukazano pomoci funkci, ale stacilo si jen zagooglit xD
#a nebo na v help najit rovnou

#ukol2
#Načti si dataset typBydleni.csv
library(readr)
typBydleni <- read_csv("typBydleni.csv")
View(typBydleni)
str(typBydleni)
library(readr) #procpak znovu nacitame balicek readr?

#opravuju do noveho datasetu, aby mi puvodni zustal k opravam
  #chytre!
#oprava typu dat u veku z charakteru na numeric
#vytvoreni faktoru u uzemi, bydleni a pohlavi
bydleni1 <- typBydleni %>% 
  mutate(
    vek_txt = parse_number(vek_txt),
    uzemi_txt = as.factor(uzemi_txt),
    pohlavi_txt = as.factor(pohlavi_txt),
    bydleni_txt = as.factor(bydleni_txt)
      ) #a neni nejaky argument v nektere read fci
          #co by takto vsechny character hodnoty zmenil na faktory?
str(bydleni1)
#kontrola typu uzemi a bydleni
  #kontrola za jakym ucelem? co se snazime zjistit?
  #ano, je dobre ze ji delas, ale vsimla sis jednoho detailu?
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
  count(pohlavi_txt) %>% #toto nam spocita kolik mame radku pro kazdou kategorii pohlavi
                          #nikoliv kolik jich mame
                            #napoveda: co treba pouzit filtrovani a funkci sum?
  mutate(procentualni_zastoupeni = (n / sum(n)) * 100) #tady nam to proto spocita (9 / 27) * 100

#NAPOVEDA
#podivej se prvnich nekolik radku poradne - neni na nich neco zvlastniho?
bydleni1 %>%
  select(hodnota, pohlavi_txt, vek_txt) %>%
  head()
################################

#varianta s odstranenim NA (ale to je asi blbost, ti lidi existuji)
  #a co je to za lidi zac ;]? opravdu existuje tolik jedincu, u kterych ve scitani lidu nezname pohlavi?
   #a vzdycky se najdou u vsech kombinaci kategorii?

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

#prvni problem - opravdu jsou vsechny hodnoty v uzemi_txt kraje?
levels(bydleni1$uzemi_txt)
  #co treba uz ten prvni vysledek?
  #jakym zpusobem si zjistime, ktere z techto hodnot jsou kraje?
    #nemuzeme k tomu pouzit i jiny radek?
      #zkus se podivat do JSONu, co jednotlive sloupce znamenaji

#druhy problem
  #funkce count pocita vyskyt neceho - pocet radku
    #stejny problem jako u predchoziho ukolu
  #co treba zkusit funkci group_by ;]?

      