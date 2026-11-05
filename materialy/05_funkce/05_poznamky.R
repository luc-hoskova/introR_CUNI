#05. poznamky
#############
# PROCVICENI
#############
# IF ... ELSE
#1
vek <- 44
souhlas <- FALSE

if (vek >= 15) {"Ano: splnilo věkovou hranici"} else
  if (souhlas == TRUE) {"Ano: splnilo podmínku o souhlasu rodičů"} else {"Ne: nesplnilo žádnou z podmínek vstupu"}

#2
fVek <- 53
seniori <- 65
studenti <- 26

if (fVek >= seniori) {"Franta má nárok na zlevněné jízdné pro seniory."} else
  if (fVek <= studenti) {"Franta má nárok na zlevněné jízdné pro studenty."} else {paste("Franta nemá nárok na zlevněné jízdné. Je mu totiž", fVek, "")}

######################################################
# SAMOSTATNE CVICENI
######################################################
# IF ... ELSE
znamka <- 5
pocetBodu <- 17
semestralka <- TRUE

if (znamka < 5 & pocetBodu != 0) {paste("Julie má známku", znamka, "a získala", pocetBodu, "bodů, má proto nárok na vyznamenání.")} else
  if (semestralka == TRUE & pocetBodu >= 50) {paste("Julie má počet bodů", pocetBodu, "a napsala seminárku, má proto nárok na vyznamenání.")} else {"Julie nemá právo na vyznamenání."}