mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C")

print(mereni)
priemer_vzorku <- apply(mereni, 1, mean)

print(priemer_vzorku)

max_reaktivita <- apply(mereni, 2, max)

print(max_reaktivita)

max(max_reaktivita)

names(max_reaktivita[max_reaktivita == max(max_reaktivita)])
