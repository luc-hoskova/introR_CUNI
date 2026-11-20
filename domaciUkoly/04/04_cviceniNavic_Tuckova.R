#Pracujte se souborem dojizdeniSkola.csv. Popis jednotlivých sloupců naleznete v JSON souboru dojizdeniSkolaPopis.json.
library(dplyr)
library(readr)
dojizdeniSkola <- read_csv("R/Lekce_4/dojizdeniSkola.csv")
View(dojizdeniSkola)

glimpse(dojizdeniSkola)
head(dojizdeniSkola)
str(dojizdeniSkola)

dojizdeniSkola %>% count(bydliste_typ, cil_dojizdky_typ)
dojizdeniSkola %>% count(ukaz_txt, aktivita_txt)
unique(dojizdeniSkola$bydliste_typ)
unique(dojizdeniSkola$cil_dojizdky_typ)

dojizdeniSkola %>%
  filter(grepl("Praha", cil_dojizdky_txt)) %>%
  distinct(cil_dojizdky_txt, cil_dojizdky_typ)

do_prahy <- dojizdeniSkola %>%
  filter(
    cil_dojizdky_txt == "Praha",
    cil_dojizdky_typ == "správní obvod obce s rozšířenou působností",
    bydliste_typ == "správní obvod obce s rozšířenou působností",
    bydliste_txt != "Praha"
  )
# 1. Kolik osob dojíždí do Prahy za studiem?

do_prahy %>%
  filter(is.na(pohlavi_txt)) %>%
  summarize(celkem_osob = sum(hodnota))

# 2. Z kolika obcí se takto do Prahy dojíždí?

do_prahy %>%
  filter(is.na(pohlavi_txt), hodnota > 0) %>%
  summarize(pocet_obci = n_distinct(bydliste_kod))

# 3. Z jaké obce dojíždí do Prahy nejvíce žen, z jaké mužů, a kolik to je osob?

do_prahy %>%
  filter(!is.na(pohlavi_txt)) %>%
  group_by(pohlavi_txt, bydliste_kod, bydliste_txt) %>%
  summarize(osob = sum(hodnota), .groups = "drop") %>%
  group_by(pohlavi_txt) %>%
  filter(osob == max(osob))