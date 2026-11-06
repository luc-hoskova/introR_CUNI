

#lekce 4 DU Jana Neubert

library(dplyr)
library(readr)
typBydleni <- read_csv("C:/Users/jkrac/Downloads/DU_4/DU_4/typBydleni.csv")
#procpak to mas zapsane ptimo takto a ne jenom jmenem? mas nastaveny WD? ;]
View(typBydleni)
str(typBydleni)
#hm, nebylo by dobre si tady nejake ty sloupce zmenit na faktory, kdyz to jsou ocividne kategorie?

#1 Kolik osob ve věku 18-26 včetně v Jihomoravském kraji jsou evidováni jako osoby bez domova, a jakou procentuální část z nich tvoří muži a jakou ženy

typBydleni_vekNubmer<-tibble(typBydleni%>% mutate(vek_txt=parse_number(vek_txt)))
#procpak z toho delas tibble?
bezdomovci<-filter(typBydleni, uzemi_txt=="Jihomoravský kraj", bydleni_txt=="Bezdomovci", vek_txt >= 18 & vek_txt <= 26)
count(bezdomovci) #opravdu nam to spocitalo vsechny bezdomovce, a nebo nam to spocitalo pocet radku?
count(filter(bezdomovci, pohlavi_txt=="žena"))

#pomer zen
9/27*100
#pomer muzi
(27-9)/27*100 #opravdu jich je 18? Jak si to zjistila? Zkus si to projet s "muž"

#2Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízení? chci zjisti pocet bezdomovcu na kraj (fce sum?count?) a pak vybrat nejvyssi hodnotu (max?)

bezdomovci_CR<-filter(typBydleni, bydleni_txt=="Bezdomovci")
kraje<-table(bezdomovci_CR$uzemi_txt) #hm, jsou vsechny hodnoty v uzemi_txt kraje?
View(kraje)
which.max(kraje)

#tady jsem v koncich , kontrolovala jsem to i v xls a proste vsude mi vychazi 303
  #co nam to totiz spocitalo? udaje ve sloupci hodnota a nebo pocet radku?

#3 Jaký je medián věku osoby bez domova v Praze, a jaký je v celé ČR?

praha<-filter(typBydleni_vekNubmer, bydleni_txt=="Bezdomovci", uzemi_txt=="Hlavní město Praha")
#jak si prisla na to, ze to ma byt Hl. m. Praha a ne Praha ;]?
median(praha$vek_txt, na.rm = TRUE)
#a jeje, prazdne hodnoty... tak to nam asi budou delat borcus i u predchoziho cviceni
  #a co vlastne vubec ty prazdne hodnoty jsou?

#podivejme se pak na samotne hodnoty, ze kterych delame median
praha$vek_txt
#hm... je toto opravdu vektor ktery v sobe obsahuje vek vsech lidi bez domova v Praze?
#a nebo jen vypis sloupce vek_txt, tim padem je to median z moznych kategorii?

CR<-filter(typBydleni_vekNubmer, bydleni_txt=="Bezdomovci", uzemi_txt=="Česká republika")
median(typBydleni_vekNubmer$vek_txt, na.rm = TRUE)
#totozne poznamky co nahore

#4 Jaký je nejčastější typ ubytování osob pod 18 let v ČR?

unique(typBydleni_vekNubmer$bydleni_txt)
nezletily<-filter(typBydleni_vekNubmer, vek_txt <=18)

table(nezletily$bydleni_txt)
#opet problem - je potreba podivat se na to, co dela fce table
#neexistuje nejaka jina funkce, ktera by nam to seSUMirovala?
max(table(nezletily$bydleni_txt))

#porad mi to hazi vsude stejnou hodnotu, nevim proc

#5 O kolik více seniorů (65+ let) bez domova žije v Libereckém než v Moravskoslezském kraji či naopak?
libKraj65<-filter(bezdomovci_CR, uzemi_txt=="Liberecký kraj", vek_txt>=65)
MSKraj65<-filter(bezdomovci_CR, uzemi_txt=="Moravskoslezský kraj", vek_txt>=65)
count(libKraj65)-count(MSKraj65)
#opet, dela count to co chceme?

