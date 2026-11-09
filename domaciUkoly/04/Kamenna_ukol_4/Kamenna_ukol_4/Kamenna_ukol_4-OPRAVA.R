# Domaci ukol, lekce 4 (Nahravani a transformace dat)
# Eva Kamenna
#
# Data: sources/typBydleni.csv


# 1) Najděte specifickou funkci v balíčku dplyr, která umožňuje přepisování
#    hodnot na NA. -> https://dplyr.tidyverse.org/reference/na_if.html
library(dplyr)
na_if(x, y)
# `na_if()` is particularly useful inside `mutate()`
#  mutate(eye_color = na_if(eye_color, "unknown"))

# 2) Načti si dataset typBydleni.csv. Zjisti z něj následující údaje:

library(readr)
typBydleni <- read_csv("sources/typBydleni.csv")
str(typBydleni)
unique(typBydleni$bydleni_txt)
unique(typBydleni$uzemi_txt)
unique(typBydleni$vek_cis)
unique(typBydleni$pohlavi_txt)

#dataset evidentně sčítal lidi zvlášť za kraj, oblast i Čr celkově. 
# řádky muži+ ženy jsou také sečtené a poté je v pohlaví NA
# !!! POČET LIDÍ JE VE SLOUPCI "hodnota", NEMŮŽU SČÍTAT SLOUPCE

#velmi velka pochvala - jsi prvni, co si vsimnul jak pohlavi TAK tech kraju!!

# 3) Kolik osob ve věku 18-26 včetně v Jihomoravském kraji jsou evidováni jako
#    osoby bez domova, a jakou procentuální část z nich tvoří muži a jakou ženy.

# úprava datasetu
typBydleni <- typBydleni %>%
  mutate(vek = parse_number(vek_txt)) # převod věku textu na číslo

# sčítání specifických bezdomovců
bezdomovci_brno <- typBydleni %>% 
  filter(vek %in% 18:26) %>%
  filter(uzemi_txt == "Jihomoravský kraj") %>% 
  filter(bydleni_txt == "Bezdomovci") %>% 
  filter(!is.na(pohlavi_txt)) # vyřazuju bezpohlavní aby mi nevyšlo 130% jako když jsem je nevyřadila

celkem_bezd_brno <- sum(bezdomovci_brno$hodnota)
muzi_bezd_brno   <- sum(bezdomovci_brno$hodnota[bezdomovci_brno$pohlavi_txt == "muž"])
#neslo by jednoduseji? treba filtrem?
celkem_bezd_brno
perc_muzi <- muzi_bezd_brno / celkem_bezd_brno * 100
perc_zeny <- 100 - perc_muzi
perc_muzi
perc_zeny


# 4) Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízeních?
obyv_ubyt <- typBydleni %>% 
  filter(uzemi_cis == 100) %>%   #nechá jenom kraje, ne celou čr ani regiony 
  filter(bydleni_txt == "Osoby žijící v ubytovacím zařízení") %>% 
  filter(!is.na(pohlavi_txt)) %>%  # nechá jen řádky s vyplněným pohlavím, deduplikace
  group_by(uzemi_txt) %>% 
  summarise(pocet = sum(hodnota)) %>% 
  filter(pocet == min(pocet)) 

obyv_ubyt


# 5) Jaký je medián věku osoby bez domova v Praze, a jaký je v celé ČR?
bezdomovci_median <- typBydleni %>% 
  filter(bydleni_txt == "Bezdomovci") %>%
  filter(uzemi_txt %in% c("Hlavní město Praha", "Česká republika")) %>% 
  filter(!is.na(pohlavi_txt)) %>%  # nechá jen řádky s vyplněným pohlavím, deduplikace
  group_by(uzemi_txt) %>% 
  summarise(median_vek = median(rep(vek, hodnota)))

bezdomovci_median


# 6) Jaký je nejčastější typ ubytování osob pod 18 let v ČR?
ubytovani_nezletilych <- typBydleni %>% 
  filter(vek < 18) %>% 
  filter(uzemi_txt == "Česká republika") %>% 
  filter(!is.na(pohlavi_txt)) %>%
  filter(bydleni_txt != "Obyvatelstvo podle způsobu bydlení celkem (kromě bezdomovců)") %>% 
  group_by(bydleni_txt) %>% 
  summarize(pocet = sum(hodnota)) %>% 
  filter(pocet == max(pocet)) # když tu použiju "summarize", tak mi zahodí zbytek tabulky a vyplivne jenom číslo 

ubytovani_nezletilych


# 7) O kolik více seniorů (65+ let) bez domova žije v Libereckém než
#    v Moravskoslezském kraji či naopak?
seniori_bezdomova <- typBydleni %>%
  filter(vek >= 65) %>% 
  filter(bydleni_txt == "Bezdomovci") %>%
  filter(uzemi_cis == 100) %>%   #nechá jenom kraje, ne celou čr ani regiony
  filter(!is.na(pohlavi_txt)) %>%
  filter(uzemi_txt %in% c("Liberecký kraj", "Moravskoslezský kraj")) %>% 
  group_by(uzemi_txt) %>% 
  summarise(pocet = sum(hodnota))
seniori_bezdomova

rozdil_seniori <- seniori_bezdomova %>%
  summarise(rozdil = pocet[uzemi_txt == "Liberecký kraj"] - pocet[uzemi_txt == "Moravskoslezský kraj"])
  
abs(rozdil_seniori) #liberecký - MS kraj
#chvalim za abs funkci!!