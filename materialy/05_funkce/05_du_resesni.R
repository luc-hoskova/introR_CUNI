#1
koncentrace <- 75

if (koncentrace > 100) {
  print("Vysoká koncentrace")
} else if (koncentrace >= 50) {
  print("Normální koncentrace")
} else {
  print("Nízká koncentrace")
}

#2
bakterie <- 200
vysledky <- NULL

for (hodina in 1:8) {
  bakterie <- bakterie * 1.3
  vysledky[hodina] <- bakterie
  
  print(bakterie)
}

print(vysledky)

#3
mereni <- matrix(c(
  12, 15, 18,
  20, 25, 30,
  8,  10, 12,
  35, 40, 45
), nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")

colnames(mereni) <- c("Latka A", "Latka B", "Latka C")

apply(mereni, 1, mean)
maxima <- apply(mereni, 2, max)
max(maxima)

#4
#lepsi nejdrive vytvorit a pak pouzit case_when ale ukazka  jineho reseni jine hodnoty
glukoza <- c(85, 110, 95, 140, 125, 90, 160, 105, 70, 130)

klasifikace <- ifelse(glukoza <= 99,
                      "normální hodnota",
                      "zvýšená hodnota")

for (i in 1:length(glukoza)) {
  print(paste("Pacient", i,
              "- hodnota:", glukoza[i],
              "- klasifikace:", klasifikace[i]))
}
