library(readr)
library(readr)

txt <- readLines("typBydleni.csv")
typBydleni <- read.csv(text=gsub('\"', "", txt))
str(typBydleni)
ncol(typBydleni)
head(typBydleni)

levels(as.factor(typBydleni$bydleni_txt))
levels(as.factor(typBydleni$uzemi_txt))

typBydleni <- typBydleni %>%
  mutate(vek_txt = readr::parse_number(vek_txt))
head(typBydleni$vek_txt)

bezdomovciJK <- typBydleni %>% 
  filter(vek_txt %in% 18:26, 
         uzemi_txt == "Jihomoravský kraj", 
         bydleni_txt == "Bezdomovci") %>%
  select(pohlavi_txt, hodnota)
bezdomovciJK

bezdomovciCelkemJK <- sum(bezdomovciJK$hodnota)
bezdomovciCelkemJK

bezdomovciZenyJK <- bezdomovciJK %>%
  filter(pohlavi_txt == "žena") %>%
  select(hodnota) %>%
  sum()
bezdomovciZenyJK

bezdomovciMuziJK <- bezdomovciJK %>%
  filter(pohlavi_txt == "muž") %>%
  select(hodnota) %>%
  sum()
bezdomovciMuziJK

bezdomovciZenyJK/bezdomovciCelkemJK*100
bezdomovciMuziJK/bezdomovciCelkemJK*100


# Z celkového počtu bezdomovců (N = 92) ve věku 18-26 
#je v JK 17,4% žen (N = 16) a 32,6% mužů (N = 30). U zbývajících 50% (N = 46) chybí údaj 
#o pohlaví.

ubytovnyKraje <- typBydleni %>% 
  filter(bydleni_txt == "Osoby žijící v ubytovacím zařízení") %>%
  group_by(uzemi_txt) %>%
  summarise (soucet=sum(hodnota))
ubytovnyKraje

ubytovnyKraje[ubytovnyKraje$soucet == min(ubytovnyKraje$soucet),]

#Nejnižší počet osob v ubytovacím zařízení (N = 12538)
#je v Karlovarském kraji.

typBydleni %>%
  filter(uzemi_txt == "Hlavní město Praha", 
         bydleni_txt == "Bezdomovci") %>%
  select(vek_txt)%>%
  summarise(median = median(vek_txt))

typBydleni %>%
  filter(bydleni_txt == "Bezdomovci") %>%
  select(vek_txt)%>%
  summarise(median = median(vek_txt))

#Medián věku bezdomovců v Praze i ČR mi vyšel 50 let.

druhBydleni <- typBydleni %>%
  filter(vek_txt <= 18) %>% 
  group_by(bydleni_txt) %>%
  summarise (soucet=sum(hodnota)) 
druhBydleni



SenioriLK <- typBydleni%>%
  filter(vek_txt >= 65, 
         bydleni_txt == "Bezdomovci",
         uzemi_txt == "Liberecký kraj") %>%
  summarise(soucet = sum(hodnota))
SenioriLK

SenioriMSK <- typBydleni%>%
  filter(vek_txt >= 65, 
         bydleni_txt == "Bezdomovci",
         uzemi_txt == "Moravskoslezský kraj") %>%
  summarise(soucet = sum(hodnota))
SenioriMSK

SenioriMSK - SenioriLK

# V Moravskoslezském kraji žije o 108 více
#seniorů-bezdomovců než v Libereckém kraji. 

#Najděte specifickou funkci v balíčku dplyr, 
#která umožňuji přepisování hodnot na NA.
mutate(object = na_if(object, "string-to-be-replaced-with-NA"))