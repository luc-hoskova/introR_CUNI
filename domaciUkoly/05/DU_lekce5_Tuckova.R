library(dplyr)
library(readr)

#1. Pokud je koncentrace vyšší než 100 mg/l, vypište „Vysoká koncentrace“.
#Pokud je koncentrace mezi 50 a 100 mg/l včetně, vypište „Normální koncentrace“.
#Jinak vypište „Nízká koncentrace“.

koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")

hodnoty <- parse_number(koncentrace)

hodnoceni <- case_when(
  hodnoty > 100 ~ "Vysoká koncentrace",
  hodnoty >= 50 & hodnoty <= 100 ~ "Normální koncentrace",
  hodnoty < 50 ~ "Nízká koncentrace"
)

names(hodnoceni) <- names(koncentrace)
print(hodnoceni)


#2. V laboratorní kultuře je na začátku 200 bakterií. Počet bakterií se každou hodinu zvýší o 30 %. Kolik jich bude po osmi hodinách?


bakterie <- 200
for (i in 1:8) {
  bakterie <- bakterie * 1.3
}
print(bakterie)

#3. 
mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C")

#Jaká je průměrná reaktivita každého vzorku?
rowMeans(mereni)

#Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku a která látka způsobila největší reaktivitu?
apply(mereni, 2, max)

#Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku a která látka způsobila největší reaktivitu?
names(which.max(max_latky))

#4. glukoza

glukoza <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)

pacienti <- data.frame(
  ID = 1:length(glukoza)
) %>%
  mutate(
    Stav = case_when(
      glukoza >= 3.9 & glukoza <= 5.5 ~ "Norma nalačno",
      glukoza >= 5.6 & glukoza <= 6.9 ~ "Prediabetes",
      glukoza >= 7.0 ~ "Cukrovka",
      .default = "Mimo rozsah"
    )
  )

print(pacienti)




