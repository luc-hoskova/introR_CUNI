c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
glukoza <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0,
             6.3, 5.1, 7.0, 4.8, 7.2, 4.2)

stav <- ifelse(glukoza >= 7.0, "Cukrovka",
               ifelse(glukoza >= 5.6, "Prediabetes",
                      "Norma nalacno"))

tabulka <- data.frame(
  ID = 1:length(glukoza),
  Glukoza = glukoza,
  Stav = stav
)

print(tabulka)