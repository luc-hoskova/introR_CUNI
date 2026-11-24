#1 Byla naměřena následující koncentrace látky:
koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")
is.numeric(koncentrace) #to jde poznat uz z uvozovek ;]
library(tidyverse)
#bylo by lepsi to mit nahore pro prehled
#a aby sis pred to omylem nehodil kod co to potrebuje

koncentrace2 <- parse_number(koncentrace)
is.numeric(koncentrace2)
ifelse (koncentrace2 > 100, "Vysoká koncentrace",
        ifelse(koncentrace2 >= 50 & koncentrace2 <= 100, "Normální koncentrace","Nízká koncentrace"))
#bylo by dobre si tady zachovat i ta jmena jednotlivych vzorku
        
#2 V laboratorní kultuře je na začátku 200 bakterií. Počet bakterií se každou hodinu zvýší o 30 %. 
#Kolik jich bude po osmi hodinách?

bakterie <- 200
bakterie8h <- NULL

for (i in 1:8) {
  bakterie <- bakterie * 1.3
  bakterie8h[i] <- bakterie}
bakterie8h[8]
#ano, takto by to slo, ale nedalo by se to zjednodusit?
#musime si v tomto pripade opravdu vytvaret novou promennou
  #nebo staci prepsat bakterie?

#3. Během pokusu jsme čtyři vzorky vystavily 
#třem látkám a změřili jejich reaktivitu.
mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C")

#3.1 Jaká je průměrná reaktivita každého vzorku?
mereni
apply(mereni, 1, mean)
#3.2 Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku 
apply(mereni, 2, max)
#a která látka způsobila největší reaktivitu?
top <- apply(mereni, 2, max)
which.max(top) #chvalim kouknuti se po nove funkci!

#4 U pacientů byly naměřeny následující hodnoty glukózy v krvi (mmol/l):
tabulka1 <- c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
tabulka1 <- as.data.frame(tabulka1)
tabulka1 
#Vytvořte přehlednou tabulku, kdy pro každého pacienta napíšete jejich 
#ID dle pořadí, jejich naměřenou hodnotu a stav podle tabulky.
vyslednaTabulka <- tabulka1 %>% 
  mutate (ID = 1:length(tabulka1),
          stav = case_when(
            tabulka1 >= 3.9 & tabulka1 <= 5.5 ~ "Norma nalačno",
            tabulka1 >= 5.6 & tabulka1 <= 6.9 ~ "Prediabetes",
            tabulka1 >= 7 ~ "Cukrovka"
          ))
vyslednaTabulka


