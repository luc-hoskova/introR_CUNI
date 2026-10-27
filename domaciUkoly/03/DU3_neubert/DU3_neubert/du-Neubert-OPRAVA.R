x<-seq(15.2, 45.7, 0.56)
y<-x[seq(5, length(x),5)]


data(airquality)
#dataset airquality je jiz v R defaultne nahrany
#neni ho proto treba znovu nahravat, i kdyz ho nevidime v globalnim prostredi
#zkus si s prazdnym globalnim prostedim projet kod, ktery vytvori novy sloupec
  #sleduj pritom co se stane v globalnim prostredi
airquality[airquality$Month==5 & airquality$Day<=7, "Temp"]

airquality$Weather<-airquality$Temp
#je potreba ho vytvaret rovnou takto "kompletne naplneny"?
#zkus si bez tohoto kroku projet nasledujici dva radky
airquality$Weather[airquality$Weather>70]<-"HOT"
airquality$Weather[airquality$Weather<=70]<-"COLD"

