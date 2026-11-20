# UKOL1
koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")
# chci tento charakterovy vektor predelat na dataframe a koncentrace predelat na cisla
koncentrace <- data.frame(
  vzorek = names(koncentrace),
  hodnota_mg_l = as.numeric(sub(" mg/l", "", koncentrace)), # odstranim jednotku
  row.names = NULL); koncentrace
str(koncentrace)
#   Pokud je koncentrace vyšší než 100 mg/l, vypište „Vysoká koncentrace“.
#   Pokud je koncentrace mezi 50 a 100 mg/l včetně, vypište „Normální koncentrace“.
#   Jinak vypište „Nízká koncentrace“.
library(dplyr)
koncentrace %>%
  mutate(hodnota_mg_l = case_when(
    is.na(hodnota_mg_l) ~ "NA",
    hodnota_mg_l > 100 ~ "vysoka koncentrace",
    hodnota_mg_l %in% 50:100 ~ "normalni koncentrace",
    hodnota_mg_l < 50 ~ "nizka koncentrace"
  ))

# UKOL2
# Na začátku 200 bakterií. Počet bakterií se každou hodinu zvýší o 30 %. Kolik po osmi hodinách?
bakterie <- 200
pocetZaOsmHodin <- NULL
for(i in 1:8) {
  bakterie <- bakterie*1.3
  pocetZaOsmHodin[i] <- bakterie}
pocetZaOsmHodin
pocetZaOsmHodin[8]


# UKOL3 ...čtyři vzorky vystavily třem látkám a změřili jejich reaktivitu
mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C"); mereni
# Jaká je průměrná reaktivita každého vzorku?
apply(mereni, 1, mean)
# Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku 
apply(mereni, 2, max)
# a která látka způsobila největší reaktivitu?
colnames(mereni)[which(mereni == max(mereni), arr.ind = TRUE)[, "col"]] # jmeno sloupce, kde je max hodnota


# UKOL4 ... U pacientů byly naměřeny následující hodnoty glukózy v krvi (mmol/l)
pacienti <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
length(pacienti)
# udelej tabulku pacientu s ID dle poradi, hodnotou glukozy a stavem
ukol4 <- tibble::tibble(
  id = c(1:12),
  glukoza_mmol_l = c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2),
  stav = c("zatim nic")
); ukol4 # tibble s poradim a hodnotami glukozy
# ted priradit "stav" tak, aby platily nasledujici podminky
library(dplyr)
ukol4 %>%
  mutate(stav = case_when(
    is.na(glukoza_mmol_l) ~ "NA",
    glukoza_mmol_l >= 7 ~ "cukrovka",
    glukoza_mmol_l %in% seq(5.6, 6.9, 0.1) ~ "prediabetes",
    glukoza_mmol_l %in% seq(3.9, 5.5, 0.1) ~ "norma nalacno"
  )); ukol4 # hodnota 5.9 mi vychazi jako NA, proc?





  
