# Domaci ukol, lekce 5 (Funkce)
# Eva Kamenna



# 1. Byla naměřena následující koncentrace látky:

koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")

#    Pokud je koncentrace vyšší než 100 mg/l, vypište „Vysoká koncentrace“.
#    Pokud je koncentrace mezi 50 a 100 mg/l včetně, vypište „Normální koncentrace“.
#    Jinak vypište „Nízká koncentrace“.

# nejdřív změním text na čísla
library(tidyverse)
#je lepsi si library davat vzdy na zacatek skriptu
koncentrace_cislo <- parse_number(koncentrace)
names(koncentrace_cislo) <- names(koncentrace)
koncentrace_cislo
  
#IFELSE
ifelse(koncentrace_cislo > 100, "Vysoká koncentrace", ifelse(koncentrace_cislo >= 50, "Normální koncentrace","Nízká koncentrace"))

# CASEWHEN
case_when(
  is.na(koncentrace_cislo) ~ NA, #mame ale nejaka NA?
  koncentrace_cislo > 100 ~ "Vysoká koncentrace",
  koncentrace_cislo >= 50 ~ "Normální koncentrace", 
  .default = "Nízká koncentrace"
)
#chvalim ukazani obou moznosti reseni

# 2. V laboratorní kultuře je na začátku 200 bakterií. Počet bakterií se každou
#    hodinu zvýší o 30 %. Kolik jich bude po osmi hodinách?

# editovatelné proměnné
bak_start <- 200
rust_hod <- 8


#neměnný výpočet
pocet_hodin <- c(1:rust_hod)
bak_rust <- bak_start
for(i in pocet_hodin) {
  bak_rust <- bak_rust * 1.3
}
paste("Po", rust_hod, "hodinách bude v kultuře", floor(bak_rust), "bakterií")
#chvalim za tuto vetu, ale samotny for cyklus je mozna trochu prekomplikovany


# 3. Během pokusu jsme čtyři vzorky vystavily třem látkám a změřili jejich
#    reaktivitu.

mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8, 10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)
rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C")

#    Jaká je průměrná reaktivita každého vzorku?
#    Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku a která
#    látka způsobila největší reaktivitu?

# 1 = řádek, 2 = sloupec

apply(mereni, 1, mean) # průměr každého řádku

max_latek <- apply(mereni, 2, max) # max každého sloupce
max_latek

max_latek[max_latek == max(max_latek)]

# problém: nepíše mi to název látky ale jen hodnotu 
#ale pojmenovanou nazvem latky, ne? ;]

# 4. U pacientů byly naměřeny následující hodnoty glukózy v krvi (mmol/l):


cukr_mereni <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
pocet_mereni <- length(cukr_mereni)

cukrovka <- data.frame(pacient = paste0("ID", 1:length(cukr_mereni)),
                       glukoza_mmol_l = cukr_mereni)
cukrovka <- cukrovka %>% 
  mutate(stav = case_when(
    glukoza_mmol_l >=7 ~ "Cukrovka",
    glukoza_mmol_l >= 5.6 ~ "Prediabetes",
    glukoza_mmol_l >= 3.9 ~ "Norma nalačno",
    .default = NA
     
  ))
head(cukrovka)
#hezky udelano s tim ID_ :]

#    Množství cukru v krvi se dělí dle následující tabulky:
#    Stav             Hodnoty
#    Norma nalačno    3.9 - 5.5
#    Prediabetes      5.6 - 6.9
#    Cukrovka         ≥ 7.0
#
#    Vytvořte přehlednou tabulku, kdy pro každého pacienta napíšete jejich ID
#    dle pořadí, jejich naměřenou hodnotu a stav podle tabulky.



