

#lekce 4 DU Jana Neubert

library(dplyr)
library(readr)
setwd("C:/Users/jkrac/Downloads/DU_4/DU_4")
typBydleni <- read_csv("DU_4/DU_4/typBydleni.csv")
#procpak to mas zapsane ptimo takto a ne jenom jmenem? mas nastaveny WD? ;] to jsme puvodne delala, ale neustale mi to hlasilo chybu (asi neumim spravne zapsat tu cestu), takze jsem to pak udelala pres file ->import datasheet. Ted jsem to zkousela znova a zase mi to vyhodilo chybu
View(typBydleni)
str(typBydleni)
#hm, nebylo by dobre si tady nejake ty sloupce zmenit na faktory, kdyz to jsou ocividne kategorie? 

#1 Kolik osob ve věku 18-26 včetně v Jihomoravském kraji jsou evidováni jako osoby bez domova, a jakou procentuální část z nich tvoří muži a jakou ženy

typBydleni_vekNubmer<-tibble(typBydleni%>% mutate(vek_txt=parse_number(vek_txt))) %>%
#procpak z toho delas tibble? protoze tibble je lepsi "data frame"?
bezdomovciJMK<-filter(typBydleni, uzemi_txt=="Jihomoravský kraj", bydleni_txt=="Bezdomovci", vek_txt >= 18 & vek_txt <= 26)
count(bezdomovci) #opravdu nam to spocitalo vsechny bezdomovce, a nebo nam to spocitalo pocet radku? no tak evidentne jsem nepochopila tu tabulku.  ja jsem chtela spocitat radky, protoze jsem myslela, ze co radek to clovek, ale uz vidim, ze jsme mela vzit jeste v potaz ten sloupec hodnota
sum(bezdomovciJMK$hodnota)

ženy<-filter(bezdomovci, pohlavi_txt=="žena")
sum(ženy$hodnota)
muži<-filter(bezdomovci, pohlavi_txt=="muž")
sum(muži$hodnota)
#pomer zen
15/80*100
#pomer muzi
25/80*100 #puvodne Nevzala jsem v uvahu ty NA, takze jsem odecetla pocet zen od total

#2Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízení? chci zjisti pocet bezdomovcu na kraj (fce sum?count?) a pak vybrat nejvyssi hodnotu (max?)

bezdomovci_CR<-filter(typBydleni, bydleni_txt=="Bezdomovci")
bezdomovci_top<-filter(bezdomovci_CR,is.na(pohlavi_txt),(uzemi_kod !=19)) |> 
group_by(uzemi_txt) |> 
  summarise(celkemKraj = sum(hodnota, na.rm = TRUE)) |> 
  slice_max(celkemKraj)

View(bezdomovci_top)


#3 Jaký je medián věku osoby bez domova v Praze, a jaký je v celé ČR?

prahaMedian<-filter(typBydleni_vekNubmer, bydleni_txt=="Bezdomovci", uzemi_txt=="Hlavní město Praha", is.na(pohlavi_txt)) |> 
  summarise(medianVek=median(rep(vek_txt, hodnota)))
View(prahaMedian)

CRMedian<-filter(typBydleni_vekNubmer, bydleni_txt=="Bezdomovci", uzemi_txt=="Česká republika", is.na(pohlavi_txt)) |> 
  summarise(medianVek=median(rep(vek_txt, hodnota)))
View(CRMedian)
#jak si prisla na to, ze to ma byt Hl. m. Praha a ne Praha ;]? v tabulce jsem prahu nevidela

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

