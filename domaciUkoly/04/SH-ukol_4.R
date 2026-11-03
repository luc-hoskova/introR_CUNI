library(dplyr)

#1 Najděte specifickou funkci v balíčku dplyr, která umožňuji přepisování hodnot na NA.
# na_if()
# zdroj: https://dplyr.tidyverse.org/reference/na_if.html

#2 Načti si dataset typBydleni.csv. 
read.csv("typBydleni.csv")
df <- read.csv("typBydleni.csv", na.strings = c("","N/A","NA"))

#Zjisti z něj následující údaje:
#1.Kolik osob ve věku 18-26 včetně v Jihomoravském kraji jsou evidováni 
# jako osoby bez domova, a jakou procentuální část z nich tvoří muži a jakou ženy. 
str(df)
head(df)
distinct(df,bydleni_txt)
distinct(df,uzemi_txt)
distinct(df, vek_txt)

ukol1 <- df %>%
  mutate(vek_txt = readr::parse_number(vek_txt)) %>%
  filter(uzemi_txt == "Jihomoravský kraj",
         bydleni_txt == "Bezdomovci",
         vek_txt >=18 & vek_txt <=26,
         pohlavi_txt %in% c("muž", "žena")) %>%
  select(pohlavi_txt, hodnota) %>%
  group_by(pohlavi_txt) %>%
  summarise(pocet = sum(hodnota)) 

ukol1$pocet / sum(ukol1$pocet) * 100

#2 Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízení?

ukol2 <- df %>%
  filter(grepl("kraj", uzemi_txt) | uzemi_txt == "Hlavní město Praha",
         bydleni_txt == "Osoby žijící v ubytovacím zařízení",
         pohlavi_txt %in% c("muž", "žena")) %>%
  group_by(uzemi_txt) %>%
  summarise(pocet = sum(hodnota)) %>%
  arrange(pocet)
ukol2


#3 Jaký je medián věku osoby bez domova v Praze, a jaký je v celé ČR?

praha <- df %>%
  mutate(vek_txt = readr::parse_number(vek_txt)) %>%
  filter(uzemi_txt == "Hlavní město Praha",
         bydleni_txt == "Bezdomovci",
         pohlavi_txt %in% c("muž", "žena"))

median(rep(praha$vek_txt, praha$hodnota))

cr <- df %>%
  mutate(vek_txt = readr::parse_number(vek_txt)) %>%
  filter(uzemi_txt == "Česká republika",
         bydleni_txt == "Bezdomovci",
         pohlavi_txt %in% c("muž", "žena")) 

median(rep(cr$vek_txt, cr$hodnota))

#priznám že pomohla AI - nevedel som ten median cez rep

#4 Jaký je nejčastější typ ubytování osob pod 18 let v ČR?

ukol4 <- df %>%
  mutate(vek_txt = readr::parse_number(vek_txt)) %>%
  filter(vek_txt < 18,
         uzemi_txt == "Česká republika",
         pohlavi_txt %in% c("muž", "žena")) %>%
  group_by(bydleni_txt) %>%
  summarise(pocet = sum(hodnota)) %>%
  arrange(desc(pocet))
ukol4

#5 O kolik více seniorů (65+ let) bez domova žije v Libereckém 
#než v Moravskoslezském kraji či naopak?

msKraj <- df %>%
  mutate(vek_txt = readr::parse_number(vek_txt)) %>%
  filter(vek_txt >= 65,
         uzemi_txt == "Moravskoslezský kraj",
         pohlavi_txt %in% c("muž", "žena"),
         bydleni_txt == "Bezdomovci") %>%
  summarise(pocetMsKraj = sum(hodnota))

libKraj <- df %>%
  mutate(vek_txt = readr::parse_number(vek_txt)) %>%
  filter(vek_txt >= 65,
         uzemi_txt == "Liberecký kraj",
         pohlavi_txt %in% c("muž", "žena"),
         bydleni_txt == "Bezdomovci") %>%
  summarise(pocetLibKraj = sum(hodnota))

msKraj
libKraj
msKraj$pocetMsKraj - libKraj$pocetLibKraj



