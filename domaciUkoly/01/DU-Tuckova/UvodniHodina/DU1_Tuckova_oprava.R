load("promenne.RData")

pocetZamestnancu <- rozpocet%/%plat%/%pocetMesicu
veta <- "Mohu najmout"
veta2 <- "zaměstnance/zaměstnanců"
cat(veta,pocetZamestnancu,veta2)

#chvalim nahrani dat a pokus o vytvoreni vety, ale mene je obcas vice ;)
#samotny vypocet totiz neni spravne; melo by se jednat o 3 zamestnance
#neukladala si nejak znovu ty promenne.RData?
  #maji byt 549480, ty tvoje ale nahraji rozpocet 5e+05
  #vysledek vypoctu tak neni presny
