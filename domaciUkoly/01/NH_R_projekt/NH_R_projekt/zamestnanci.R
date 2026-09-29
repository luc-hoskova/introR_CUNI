rozpocetMesic <- rozpocet %/% pocetMesicu
pocetZamestnancu <- rozpocetMesic %/% plat

save(plat, pocetMesicu, pocetZamestnancu, rozpocet, rozpocetMesic, file = "zamestnanci.RData")

load("zamestnanci.RData")
