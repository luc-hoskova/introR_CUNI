rozpocetMesic <- rozpocet %/% pocetMesicu
pocetZamestnancu <- rozpocetMesic %/% plat
#DOBRA PRAXE
#odkud se nam vzali tyto promenne?
#nejdrive je potreba si je nacist
#i kdyz se posila cely projekt, vzdycky je dobre aby skript odpovidal tomu co se stalo
#bylo by proto dobre zacit nejdrive s load("promenne.RData")

save(plat, pocetMesicu, pocetZamestnancu, rozpocet, rozpocetMesic, file = "zamestnanci.RData")
load("zamestnanci.RData")
#procpak ukladame a nasledne znovu nacitame tyto promenne? Jaky je vyznam?

