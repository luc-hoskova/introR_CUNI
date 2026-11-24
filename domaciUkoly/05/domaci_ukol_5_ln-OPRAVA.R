#ukol1
library(tidyverse)
koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")
#Pokud je koncentrace vyšší než 100 mg/l, vypište „Vysoká koncentrace“.
#Pokud je koncentrace mezi 50 a 100 mg/l včetně, vypište „Normální koncentrace“.
#Jinak vypište „Nízká koncentrace“.
str(koncentrace)
koncentrace1 <- data.frame(
  hodnota = parse_number(koncentrace),
  row.names = names(koncentrace)) %>%
  mutate(
      hodnota = case_when(
      hodnota > 100 ~ "Vysoká koncentrace",
      hodnota >= 50 & hodnota <= 100 ~ "Normální koncentrace",
      TRUE ~ "Nízká koncentrace"
    )) %>%
print () #a nestacilo by dat za )); koncentrace1
#hezky postup s pretvorenim na data frame
  #ale nemohli bychom case_when aplikovat i na vektor?

#ukol2
#V laboratorní kultuře je na začátku 200 bakterií. Počet bakterií se každou hodinu zvýší o 30 %. 
#Kolik jich bude po osmi hodinách?

mnozstvi <- c(200, rep(1,8))
mnozstvi
for (i in 2:9) {
  mnozstvi [i] <- mnozstvi[i-1] * 1.3} 
  print(mnozstvi[9]) #opravdu zde potrebujeme print? ;]
#hezky vyresene, ale neslo by to treba i jednoduseji?
  
#ukol3
#Jaká je průměrná reaktivita každého vzorku?
#Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku
#a která látka způsobila největší reaktivitu?
  
mereni <- matrix(
    c(12, 15, 18, 20, 25, 30,
      8,  10, 12, 35, 40, 45),
    nrow = 4, byrow = TRUE)
  
  rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                        "Vzorek 3", "Vzorek 4")
  colnames(mereni) <- c("Latka A", "Latka B", "Latka C")
  

mereni
str(mereni)
#prumerna reaktivita vzorku
apply(mereni,1,mean)
#nejvyssi hodnoty reaktivity
apply(mereni,2,max)
#nejvetsi reaktivita
colMeans(mereni) #procpak zde mame toto?
names(which.max(colMeans(mereni)))
#velka pochvala za toto pouziti!

#ukol4
#hodnoty glukozy
glukoza <-c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
glu_tab<-data.frame(glykemie = glukoza,row.names = paste("ID", 1:length(glukoza)))
#skvely napad s rownames!
glu_tab
glu_tab %>%
  mutate(stav=case_when(
    glykemie >=7 ~ "cukrovka",
    glykemie >= 5.6 ~ "prediabetes",
    .default = "norma nalacno"))
#hm, opravdu jsou vsechny hodnoty pod 5.6 norma?
#co teba glukoza 1.7? mame k tomu info?
