seq(15.2, 45.7, 0.56) #pro zobrazeni si staci nahrat v konzoli, neni treba drzet ve skriptu
KazdePiate <- seq(15.2, 45.7, 0.56)
KazdePiate #pro zobrazeni si staci nahrat v konzoli, neni treba drzet ve skriptu
KazdePiate[seq(5, length(KazdePiate), 5)]
#doporucuji si nejak oddelovat jednotlive casti kodu
#at to nevypada jako ze je to vse k jedne veci

load(airquality)
#neni treba nahravat, dataset je v R defaultne pritomny
#takto provedena fce load nam stejne vrati error, jelikoz nemame zadny definovany objekt airquality
View(airquality)
head(airquality)
airquality$Temp[airquality$Month == 5 & airquality$Day <= 7]
#elegantne vyreseno :]

airquality$Weather <- "cold"
airquality$Weather[airquality$Temp > 70] <- "hot"
View(airquality)
#opatrne s nechavanim toho View ve skriptu
#je opravdu potreba pri kazdem projeti skriptu tento dataset opakovane otevirat?
