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
library(dplyr)
typBydleni <- read_csv("typBydleni.csv")
View(typBydleni)
str(typBydleni)
 #procpak znovu nacitame balicek readr? nojo, mela jsem to tam dvakrat

#opravuju do noveho datasetu, aby mi puvodni zustal k opravam
  #chytre!
#oprava typu dat u veku z charakteru na numeric
#vytvoreni faktoru u uzemi, bydleni a pohlavi
bydleni1 <- typBydleni %>% 
  mutate(
    vek_txt = parse_number(vek_txt), 
    across(where(is.character), as.factor)  )
  
  
    #a neni nejaky argument v nektere read fci
          #co by takto vsechny character hodnoty zmenil na faktory?
    # kdyz se ptas, tak asi je, opraveno

str(bydleni1)
#kontrola typu uzemi a bydleni
  #kontrola za jakym ucelem? co se snazime zjistit? - jak0 jsou tam typy udaju
  #ano, je dobre ze ji delas, ale vsimla sis jednoho detailu?
#jsou tam ruzne urovne celku - kraje, oblasti, republika, to same u bydleni - nadrazene a podrazene pojmy
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
  select(hodnota, pohlavi_txt,bydleni_txt, uzemi_txt) %>%
  group_by(pohlavi_txt) %>%
  summarise(all_ages = sum(hodnota, na.rm = TRUE))
bydleni2
#vypocet procentualniho zastoupeni

#NAPOVEDA
#podivej se prvnich nekolik radku poradne - neni na nich neco zvlastniho?
#nojo, jsou to muzi+zeny, pohlavi nelze urcit
bydleni1 %>%
  select(hodnota, pohlavi_txt, vek_txt) %>%
  head()


################################

#varianta s odstranenim NA (ale to je asi blbost, ti lidi existuji)
  #a co je to za lidi zac ;]? opravdu existuje tolik jedincu, u kterych ve scitani lidu nezname pohlavi?
   #a vzdycky se najdou u vsech kombinaci kategorii?
#uz chapu, NA je sum muzi+zeny

bydleni2 %>%
  filter(!is.na(pohlavi_txt)) %>% 
    mutate(procentualni_zastoupeni = (all_ages / sum(all_ages)) * 100)



#2.2Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízení?
levels(bydleni1$bydleni_txt)

#prvni problem - opravdu jsou vsechny hodnoty v uzemi_txt kraje?
levels(bydleni1$uzemi_txt)
  #co treba uz ten prvni vysledek?
  #jakym zpusobem si zjistime, ktere z techto hodnot jsou kraje?
    #nemuzeme k tomu pouzit i jiny radek?
      #zkus se podivat do JSONu, co jednotlive sloupce znamenajibydleni1 %>%
  #filtr ubytovaci zarizeni
bydleni1 %>%filter(
    bydleni_txt == "Osoby žijící v ubytovacím zařízení",
  #pocet lidi v jednotlivych krajich
  
 grepl("kraj",uzemi_txt) | grepl("Hlavní město Praha", uzemi_txt) ) %>%
    select(hodnota, uzemi_txt) %>%
    group_by(uzemi_txt) %>%
    summarise(all = sum(hodnota, na.rm = TRUE))%>%
     filter(all == min(all))  


#2.3 Jaký je medián věku osoby bez domova v Praze, a jaký je v celé ČR?

Praha <-bydleni1 %>%
  filter(
    bydleni_txt == "Bezdomovci",
    uzemi_txt == "Hlavní město Praha")
    
  
median(rep(Praha$vek_txt, Praha$hodnota,na.rm = TRUE))

CR <-bydleni1 %>%
  filter(
    bydleni_txt == "Bezdomovci",
    uzemi_txt == "Česká republika")

median(rep(CR$vek_txt, CR$hodnota, na.rm = TRUE))


#2.4 Jaký je nejčastější typ ubytování osob pod 18 let v ČR?
bydleni1 %>%
  filter(
    vek_txt <18,
    bydleni_txt !="Obyvatelstvo podle způsobu bydlení celkem (kromě bezdomovců)",
    uzemi_txt == "Česká republika") %>%
  select(bydleni_txt,hodnota) %>% 
  group_by(bydleni_txt) %>%
  summarise(pocet_deti = sum(hodnota, na.rm = TRUE)) %>% 
  filter(pocet_deti == max(pocet_deti))

#2.5 O kolik více seniorů (65+ let) bez domova žije v Libereckém
#než v Moravskoslezském kraji či naopak?
levels(bydleni1$uzemi_txt)
Lib<-bydleni1 %>%
  filter(uzemi_txt == "Liberecký kraj",
         bydleni_txt == "Bezdomovci",
         vek_txt >64)%>%
  summarise(Lib = sum(hodnota, na.rm = TRUE)); Lib

Mor <-bydleni1 %>%
  filter(uzemi_txt == "Moravskoslezský kraj",
         bydleni_txt == "Bezdomovci",
         vek_txt >64)%>%
  summarise(Mor = sum(hodnota, na.rm = TRUE)); Mor

Mor-Lib

