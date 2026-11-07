library(readr)
library(readr)

txt <- readLines("typBydleni.csv")
typBydleni <- read.csv(text=gsub('\"', "", txt))
#toto bych asi potrebovala vysvetlit
  #za jakym ucelem si vytvarelaa txt a pak s tim pracovala?
  #vidis v tomto pristupu nejakou vyhodu oproti read.csv("typBydleni.csv")
str(typBydleni)
ncol(typBydleni) #a nezjistime toto nahodou uz na zacatku str? ;]
head(typBydleni)

levels(as.factor(typBydleni$bydleni_txt))
levels(as.factor(typBydleni$uzemi_txt))
#chvalim ale za kontrolu

typBydleni <- typBydleni %>%
  mutate(vek_txt = readr::parse_number(vek_txt))
#readr mame nacteny, neni treba ho znovu volat k funkci
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
#o pohlaví
  #chybi opravdu udaj o pohlavi?

#napoveda:
bezdomovciJK #neni na tech hodnotach neco zvlastniho?
  #opravdu by u scitani lidu chybeli u tolika lidí udaje, a navic tak pravidelne?
  #vzdyt jich je tolik, co obou pohlavi dohromady.... ;]

ubytovnyKraje <- typBydleni %>% 
  filter(bydleni_txt == "Osoby žijící v ubytovacím zařízení") %>%
  group_by(uzemi_txt) %>% #opravdu jsou hodnoty v uzemi_txt pouze kraje?
  summarise (soucet=sum(hodnota))
ubytovnyKraje

ubytovnyKraje[ubytovnyKraje$soucet == min(ubytovnyKraje$soucet),]
#velmi chytre se ti podarilo obejit to, ze si nevedela jak to seradit
#velka pochvala!

#Nejnižší počet osob v ubytovacím zařízení (N = 12538)
#je v Karlovarském kraji.
  #ano je to tento kraj, ale to cislo je trochu jine...

#napoveda
unique(typBydleni$uzemi_txt)
#hm, opravdu je Ceska republika kraj? A hele, Praha i Hl. m. Praha!

typBydleni %>%
  filter(uzemi_txt == "Hlavní město Praha",  #jak vis, ze mas pouzit Hl. m. Praha?
         bydleni_txt == "Bezdomovci") %>%
  select(vek_txt)%>%
  summarise(median = median(vek_txt))
#a je to median hodnoty veku pro kazdou osobu?

#napoveda
typBydleni$vek_txt
#to se mi nezda ze by tam byli presne tri lidi s vekem nula, pak tri lidi s jedna...
length(typBydleni$vek_txt)
#to bychom tam meli 34845 osob
  #a neni tam toto cislo nejak... povedome?
dim(typBydleni)
# ;]

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
#tyjo, to jsou nejaka velka cisla... v bytech nam zije pres 12 milionu deti?
#tady bude neco spatne... scitame opravdu pouze hodnoty za Ceskou republiku?


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