library(dplyr)
#chvalim za libarary nahore!!!
#1. úkol:
koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")
data <- data.frame(
  vzorek = names(koncentrace),
  koncentrace = as.numeric(sub(" mg/l", "", koncentrace)))
  #hm, a nemame na tohle primo funkci co jsme si ukazovali?
data %>%
  mutate(hodnoceni = case_when(
    koncentrace > 100 ~ "Vysoká koncentrace",
    koncentrace >= 50 & koncentrace <= 100 ~ "Normální koncentrace",
    TRUE ~ "Nízká koncentrace" #v soucasne dobe se spise pouziva .default
  ))

#2. úkol: V laboratorní kultuře je na začátku 200 bakterií. 
# Počet bakterií se každou hodinu zvýší o 30 %. Kolik jich bude po osmi hodinách?

kultura <- 200
pocet <- NULL; pocet

for (i in 1:8) {
  kultura <- kultura * 1.3 
  pocet[i] <- kultura}
pocet
#a ted jeste zjistit primo pouze tu posledni hodnotu ;]

#3. úkol: Během pokusu jsme čtyři vzorky vystavily třem látkám a změřili jejich reaktivitu.
mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C"); mereni

#Jaká je průměrná reaktivita každého vzorku?
apply(mereni, 1, mean)
#Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku a která látka způsobila největší reaktivitu?
apply(mereni, 2, max)

#chybi ti tady posledni cast cviceni

# 4. úkol: U pacientů byly naměřeny následující hodnoty glukózy v krvi (mmol/l):
glykémie <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
#pozor, diakritika v nazvu opravdu neni dobry napad

#Množství cukru v krvi se dělí dle následující tabulky:
Stav	Hodnoty
Norma nalačno	3.9 - 5.5
Prediabetes	5.6 - 6.9
Cukrovka	≥ 7.0
#a tady je problem - zadny takovyto objekt neexistuje
#R se zastavi a dale nepocita
#je treba ulozit jako R necitelnou poznamku 

#Vytvořte přehlednou tabulku, kdy pro každého pacienta napíšete jejich ID dle pořadí,
#jejich naměřenou hodnotu a stav podle tabulky.
glykémie <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
data <- data.frame(ID = 1:length(glykémie), glykémie = glykémie);data
data <- data%>%
          mutate(hodnoceni = case_when(
                    glykémie >= 7 ~ "Diabetes mellitus", #hm, ale ja chtela pojem cukrovka :/
                    glykémie >= 5.6 & glykémie <= 6.9 ~ "Prediabetes",
                    glykémie >= 3.9 & glykémie <= 5.5 ~ "Norma",
                    glykémie < 3.9 ~ "Hypoglykémie", #a jak vime, ze neco takoveho je hypoglykemie?
                    .default = NA_character_)); data
#jdes na to hezky, ale opatrne s reinterpretaci analyz                 