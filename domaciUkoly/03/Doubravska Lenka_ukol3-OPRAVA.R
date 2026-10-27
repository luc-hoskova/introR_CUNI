#homework1
vektor <- c(seq(15.2, 45.7, 0.56))
length(vektor) #kolik je hodnot ve vektoru
#vyber kazdou 5. hodnotu
vektor[c(5,10,15,20,25,30,35,40,45,50,55)]
#slo by to lip?
vektor[seq(5,length(vektor),by=5)]
#presne tak, vypisovani kazde hodnoty neni prilis udrzitelne
           
#homework2
airquality #vyber hodnoty ze sloupce Temp z prvního týdne v květnu
str(airquality) #je to data frame, 153 objektu a 6 promennych, dva rozmery kdyz data frame
airquality[c(1:7),"Temp"] # radek 1 az 7 protoze to je 1. tyden 5. mesice tedy kvetna
# slo by vic univerzalne bez prohlizeni dat?
airquality[airquality[c(1:7),"Month"]==5, "Temp"] # tohle mi ukaze vsechny teploty...
#pojdme se podivat krok po kroku na to, co se stalo
airquality[c(1:7),"Month"]
  #vyber prvnich 7 hodnot ze sloupce Month
  #vysledkem je 7x cislo 5
airquality[c(1:7),"Month"]==5
  #jsou hodnoty uvnitr tohoto vyberu presne 5?
  #vznikne nam vektor, co v sobe ma 7x TRUE
airquality[airquality[c(1:7),"Month"]==5, "Temp"]
  #vyber hodnoty z airquality
  #vyber sloupec Temp
  #vyber radky podle vektoru c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE)
    #to je totiz vysledek podminky, kterou mame v radcich
    #k vyberu radku je ale potreba definovat podminky pro vsechny radky    
      #R se nam snazi pomahat, proto aplikuje hodnotu TRUE uplne na vsechny radky
      #dojde nam k vyberu hodnot ze sloupce Temp u VSECH radku
kveten <- airquality[airquality$Month == 5, "Temp"]; kveten # takze vyberu nejdriv vsechny dny 5. mesice a jejich teplotu
length(kveten) # je to 31 hodnot?
kveten[1:7] # vyberu prvnich 7 dni mesice kvetna
# muzu pouzit i funkci head
head(kveten, 7)
#prestoze je vysledek spravny, postup az zase uplne tak ne
#proc vybirame prvnich sedm hodnot?
#co kdyz by mereni nemerila kazdy den, ale jen nejake dny?
#co kdyz by nektere dny byly mereny vickrat?

#homework3
#k airquality pridej sloupec Weather, kde bude text hot kdyz Temp>70 a text cold kdyz Temp<70
airquality
airquality$Weather <- "cold"; airquality # pridat sloupec "Weather", kde bude text "cold"
airquality$Weather[airquality$Temp > 70] <- "hot"; airquality # do sloupce "Weather" text "hot" tam, kde ve sloupci Temp>70
#chvalim elegantni a usporne psani kodu u pridavani sloupce

# slo by to i najednou nejakou fuknci?
airquality$Weather <- ifelse(airquality$Temp > 70, "hot", "cold"); airquality #if element selection ifelse(test, yes, no)
#funkce tohoto typu budeme probirat v pate lekci, ale cenim si proaktivnosti :]

# jake datasety jsou ulozene v Rbase? Help rika, ze ma The R Datasets Package plnou ruznych datasetu
library(help = "datasets")
#toto nam da informace o balicku datasets, nikoliv o samotnych dostupnych datasetech v nahranych baliccich





