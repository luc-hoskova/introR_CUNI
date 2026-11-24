#
setwd("/home/filip/Dokumenty/kurz_R_2026/DU_5/")

#úkol 1 
koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")

koncentrace_cisla <- as.numeric(sub(" mg/l", "", koncentrace))
names(koncentrace_cisla) <- names(koncentrace)

for (vzorek in names(koncentrace)) {
  hodnota <- koncentrace_cisla[[vzorek]]
  
  if (hodnota > 100) {
    print(paste(vzorek, ": Vysoká koncentrace"))
  } else if (hodnota >= 50 & hodnota <= 100) {
    print(paste(vzorek, ": Normální koncentrace"))
  } else {
    print(paste(vzorek, ": Nízká koncentrace"))
  }
}


#úkol 2
bakterie <- 200
bakterie_8_hodin <- bakterie

for (i in 1:8 ) {
  bakterie_8_hodin  <- bakterie_8_hodin * 1.3
  print(bakterie_8_hodin)
}

print(paste("bakterie po 8 hodinach:",bakterie_8_hodin))

#úkol 3
mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C")
mereni      
apply (mereni, 1, mean)
apply (mereni, 2, max)

maxima_latek <- apply(mereni, 2, max);maxima_latek
nejvyssi_reaktivita <- names(which.max(maxima_latek));nejvyssi_reaktivita

#úkol 4
glukoza <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)

stav <- ifelse(glukoza >= 7.0, "Cukrovka", 
        ifelse (glukoza >= 5.6, "Prediabetes",
        ifelse (glukoza >= 3.9, "Norma nalačno")))

tabulka <- data.frame(
  ID = 1:length(glukoza),
  Glukoza = glukoza,
  Stav = stav
)
tabulka        
