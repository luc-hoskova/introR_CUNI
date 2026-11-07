# funkce pro přepisování hodnot na NA funkci v balíčku dplyr na_if()
library(dplyr)
library(readr)
setwd("/home/filip/Dokumenty/kurz_R_2026/DU_4/")
#dobre nastaveni, ale pozor!
#pokud by se skript nekomu posilal na provedeni tak by tato cast mela byt bud pryc
#a nebo jako poznamka

typBydleni <- read_csv(
  "typBydleni.csv",
  col_types = cols(vek_txt = col_number())
) #chvalim nacteni a rovnou prepis na numericke hodnoty!

bezdomovci_18_26 <- typBydleni %>%
 filter(
    uzemi_txt == "Jihomoravský kraj",
    bydleni_txt == "Bezdomovci",
    vek_txt %in% 18:26
  )
#počet osob bez domova ve věku 18-26 včetně v Jihomoravském kraji
bezdomovci_18_26 %>%
summarise(pocet_osob = sum(hodnota))

# podíl mužů a žen 
bezdomovci_18_26 %>%
  filter(!is.na(pohlavi_txt)) %>% 
  count(pohlavi_txt, wt = hodnota, name = "pocet_osob") %>%
  mutate(procento = 100 * pocet_osob / sum(pocet_osob))
  #velka pochvala za projiti si argumentu k funkci count

# kraj s nejmenším počet obyvatel žijících v ubytovacích zařízení?
  
  
typBydleni %>%
  filter(
    bydleni_txt == "Osoby žijící v ubytovacím zařízení",
    is.na(pohlavi_txt) #chvalim praci s prazdnou hodnotou - si zatim prvni ktery pochopil, ze se nejedna o osoby u kterych se nezna pohlavi
  ) %>%
  group_by(uzemi_txt) %>%
  summarise(pocet_osob = sum(hodnota)) %>%
  arrange(pocet_osob) %>%
  slice_head(n = 1)
################################################################################
#sice ti vysel spravne kraj, ale podivej se na to, co se stane kdyz se nevybere jen nejmensi hodnota
typBydleni %>%
  filter(
    bydleni_txt == "Osoby žijící v ubytovacím zařízení",
    is.na(pohlavi_txt) #chvalim praci s prazdnou hodnotou - si zatim prvni ktery pochopil, ze se nejedna o osoby u kterych se nezna pohlavi
  ) %>%
  group_by(uzemi_txt) %>%
  summarise(pocet_osob = sum(hodnota))
#mame tam neco jako jihovychod a jihozapad... co to je?
typBydleni %>%
  filter(
    bydleni_txt == "Osoby žijící v ubytovacím zařízení",
    grepl("Praha", uzemi_txt),
    is.na(pohlavi_txt)) %>%
  group_by(uzemi_txt) %>%
  summarise(pocet_osob = sum(hodnota))
#no a Prahu mame dokonce dvakrat... bylo by dobre si asi zkontrolovat, co se tu deje

#######################################
#medián věku osoby bez domova v Praze

bezdomovci_praha <- typBydleni %>%
  filter(
    bydleni_txt == "Bezdomovci",
    uzemi_txt == "Hlavní město Praha", #jak vis, ze to ma byt Hl. m. Praha a ne Praha?
      )

bezdomovci_praha %>%
  summarise(
    median_vek = median(rep(vek_txt, hodnota))
  )
#velka chvala za to, ze sis vsimnul ze median neni mozne aplikovat rovnou
#jsi prvni, kdo se nenachytal ;]


bezdomovci_celorepublikove <- typBydleni %>%
  filter(
    bydleni_txt == "Bezdomovci",
    uzemi_txt == "Česká republika",
      )

bezdomovci_celorepublikove %>%
  summarise(
    median_vek = median(rep(vek_txt, hodnota))
  )


# nejčastější typ ubytování pod 18

typBydleni %>%
  filter(
    uzemi_txt == "Česká republika",
    vek_txt < 18,
    bydleni_txt != "Obyvatelstvo podle způsobu bydlení celkem (kromě bezdomovců)"
  ) %>%
  group_by(bydleni_txt) %>%
  summarise(pocet_osob = sum(hodnota)) %>%
  arrange(desc(pocet_osob))

#a hodnoty pokud budeme brát že N/A v kolonce pohlaví je součet mužů a žen (což mi nebylo jasné) - pořadí bude stejné ale hodnoty jiné 
typBydleni %>%
  filter(
    uzemi_txt == "Česká republika",
    vek_txt < 18,
    is.na(pohlavi_txt),
    bydleni_txt != "Obyvatelstvo podle způsobu bydlení celkem (kromě bezdomovců)"
  ) %>%
  group_by(bydleni_txt) %>%
  summarise(pocet_osob = sum(hodnota)) %>%
  arrange(desc(pocet_osob))
#chvalim za to, ze ti doslo ze prazdne hodnoty u pohlavi je soucet za obe
#toto je prikld toho, proc je potreba si dataset poradne prohlednout nez se s nim zacne pracovat

typBydleni %>%
  select(hodnota, pohlavi_txt, vek_txt) %>%
  head()
#tady si muzes vsimnout ze zvlastni, ze by se u scitani lidu nevedelo u tolika lidi pohlavi
#a to jeste u takhle malych deti
#a ze by se jich neznalo vice, nez se znalo...

#dulezita soucast analyzy neni jenom kod, ale i premysleni nad strukturou a hlavne puvodem dat

#O kolik více seniorů (65+ let) bez domova žije v Libereckém než v Moravskoslezském kraji či naopak?
seniori_bez_domova <- typBydleni %>%
  filter(
    bydleni_txt == "Bezdomovci",
    vek_txt >= 65,
    is.na(pohlavi_txt),
    uzemi_txt == "Liberecký kraj" | uzemi_txt == "Moravskoslezský kraj"
  ) %>%
  group_by(uzemi_txt) %>%
  summarise(pocet_osob = sum(hodnota));seniori_bez_domova


seniori_bez_domova$pocet_osob[seniori_bez_domova$uzemi_txt == "Moravskoslezský kraj"] -
  seniori_bez_domova$pocet_osob[ seniori_bez_domova$uzemi_txt == "Liberecký kraj"]
