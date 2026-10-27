sekvence1 <- seq(15.2, 45.7, 0.56);sekvence1
length(sekvence1)
sekvence2 <- sekvence1[c(seq(5, 55, 5))]; sekvence2
#k cemupak ve fci seq potrebujeme jeste fci c?
#odkud se nam vzalo cislo 55? ;]
#nebylo by lepsi to rovnou napsat jako
sekvence1[seq(5, length(sekvence1), 5)]
length(sekvence2)

airquality
airquality$Temp[airquality$Month==5&airquality$Day<=7]
airquality$Weather[airquality$Temp>70] <- "hot"
airquality$Weather[airquality$Temp<=70] <- "cold"
#je potreba si takto podminecne definovat obe hodnoty?
#nestacilo by treba jen
#airquality$Weather <- "hot"
airquality

ls("package:datasets") #jen balicek "datasets"
data() #vsechny balicky, ktere jsou lodaded
data(package = .packages(all.available = TRUE)) #vsechny balicky, ktere jsou k dispozici (tedy i not-loaded)
#velmi chvalim za hezky vyresenou bonusovou ulohu!!!