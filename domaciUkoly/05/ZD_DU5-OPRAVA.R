# Ukol 1 
koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")
# vytvoreni tabulky, kontrola vcetne struktury a sloupce koncentrace
df <- data.frame(koncentrace)
df
str(df)
df$koncentrace
#musime si opravdu vytvaret tabulku?
#nemuzeme spustit case_when i na vektor?

# nacteni balicku s funkcemi
library(tidyverse) #doporucuji davat na zacatek

# odstraneni jednotek a prevod koncentrace z typu character 
# na typ numeric, kontrola
df$koncentrace <- str_remove(df$koncentrace, " mg/l")
df
df$koncentrace <- as.numeric(df$koncentrace)
df
#a nezname funkci, ktera by toto cele udelala v jednom pokynu za nas? ;]

str(df)
# kategorizace hodnot
df %>%
  mutate(koncentrace = case_when(
    koncentrace < 50 ~ "Nizka koncentrace",
    koncentrace < 100 ~ "Normalni koncentrace",
    koncentrace > 100 ~ "Vysoka koncentrace"
    )) #ale ten case_when mas hezky popsany :]

# Ukol 2
# prirazeni pocatecni a konecne hodnoty do globalniho prostredi
bakterie <- 200
konecna_hodnota <- NULL
# vytvoreni smycky
for (i in 1:8) {
  bakterie <- bakterie * 1.3
  konecna_hodnota[i] <- bakterie
}
# zaokrouhleni a vypsani konecne hodnoty
konecna_hodnota[i] <- round(konecna_hodnota[i])
konecna_hodnota[i]
#mozna az trosku zbytecne slozite - neslo by to jednoduseji?
#nemuzeme si proste v tomto pripade vypsat osmou pozici?

# Ukol 3
mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)
rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C")
# kontrola struktury dat
str(mereni)
#neni uplne treba kdyz je to neco tak maleho
  #co jsme si navic sami vytvorili
mereni
# vypocet prumerne reaktivity kazdeho vzorku
prumer_vzorku <- apply(mereni, 1, mean)
prumer_vzorku
# vyber nejvyssi hodnoty pro kazdou latku
max_latka <- apply(mereni, 2, max)
max_latka
# vyber latky zpusobujici nejvetsi reaktivitu 
# urceni pozice nejvyssi hodnoty se zachovanim rozmeru, vypsani souradnic
maxim <- which(mereni == max(mereni), arr.ind = TRUE)
maxim
# poradi sloupce s maximem
maxim[, "col"]
# nazev sloupce s maximem
colnames(mereni)[maxim[, "col"]]
#ano, mas to spravne, ale je to mozna zbytecne slozite
#zkusila ses podivat, jestli na toho neni fce?

# Ukol 4
mnozstvi <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
# vytvoreni tabulky
cukr <- data.frame(mnozstvi)
# pojmenovani vzorku, kontrola
rownames(cukr) <- paste0("ID_", 1:nrow(cukr))
cukr
str(cukr)
# pridani sloupce a kategorizace dat podle velikosti hodnot
cukr %>% 
  mutate(
    stav = case_when(
      mnozstvi < 3.9 ~ NA, #a co pouzit default?
      mnozstvi < 5.6 ~ "Norma nalacno",
      mnozstvi < 7.0 ~ "Prediabetes",
      mnozstvi >= 7.0 ~ "Cukrovka"
    ))
#netradicne ale velmi hezky udelano
#je hezke videt, ze premyslis nad moznostma kombinovani funkci