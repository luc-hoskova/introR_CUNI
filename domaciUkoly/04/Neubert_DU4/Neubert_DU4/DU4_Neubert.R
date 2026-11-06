

#lekce 4 DU Jana Neubert

library(dplyr)
library(readr)
typBydleni <- read_csv("C:/Users/jkrac/Downloads/DU_4/DU_4/typBydleni.csv")
View(typBydleni)
str(typBydleni)
#1 Kolik osob ve věku 18-26 včetně v Jihomoravském kraji jsou evidováni jako osoby bez domova, a jakou procentuální část z nich tvoří muži a jakou ženy

typBydleni_vekNubmer<-tibble(typBydleni%>% mutate(vek_txt=parse_number(vek_txt)))
bezdomovci<-filter(typBydleni, uzemi_txt=="Jihomoravský kraj", bydleni_txt=="Bezdomovci", vek_txt >= 18 & vek_txt <= 26)
count(bezdomovci)
count(filter(bezdomovci, pohlavi_txt=="žena"))

#pomer zen
9/27*100
#pomer muzi
(27-9)/27*100

#2Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízení? chci zjisti pocet bezdomovcu na kraj (fce sum?count?) a pak vybrat nejvyssi hodnotu (max?)

bezdomovci_CR<-filter(typBydleni, bydleni_txt=="Bezdomovci")
kraje<-table(bezdomovci_CR$uzemi_txt)
View(kraje)
which.max(kraje)

#tady jsem v koncich , kontrolovala jsem to i v xls a proste vsude mi vychazi 303


#3 Jaký je medián věku osoby bez domova v Praze, a jaký je v celé ČR?

praha<-filter(typBydleni_vekNubmer, bydleni_txt=="Bezdomovci", uzemi_txt=="Hlavní město Praha")
median(praha$vek_txt, na.rm = TRUE)

CR<-filter(typBydleni_vekNubmer, bydleni_txt=="Bezdomovci", uzemi_txt=="Česká republika")

median(typBydleni_vekNubmer$vek_txt, na.rm = TRUE)

#4 Jaký je nejčastější typ ubytování osob pod 18 let v ČR?

unique(typBydleni_vekNubmer$bydleni_txt)
nezletily<-filter(typBydleni_vekNubmer, vek_txt <=18)

table(nezletily$bydleni_txt)
max(table(nezletily$bydleni_txt))

#porad mi to hazi vsude stejnou hodnotu, nevim proc

#5 O kolik více seniorů (65+ let) bez domova žije v Libereckém než v Moravskoslezském kraji či naopak?
libKraj65<-filter(bezdomovci_CR, uzemi_txt=="Liberecký kraj", vek_txt>=65)
MSKraj65<-filter(bezdomovci_CR, uzemi_txt=="Moravskoslezský kraj", vek_txt>=65)
count(libKraj65)-count(MSKraj65)


