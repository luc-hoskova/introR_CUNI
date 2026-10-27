seq(15.2, 45.7, 0.56)
x <- seq(15.2, 45.7, 0.56)
x[seq(5, length(x), by = 5)]


data(airquality)
#dataset airquality uz je v R nacteny
#neni ho potreba znovu nahravat do globalniho prostredi
View(airquality)
airquality[1:7, "Temp"]
#sice spravne, ale trosku "podvadeni" ;]
#cilem prace v R je, abychom nemuseli hledat hodnoty v tabulce podle oka
#tady je opravdu potreba indexace
  #co kdyby byl dataset mnohonasobne vetsi?

airquality$Weather <- "cold"
airquality$Weather[airquality$Temp > 70] <- "hot"