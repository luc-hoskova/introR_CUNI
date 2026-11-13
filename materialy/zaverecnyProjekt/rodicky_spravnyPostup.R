library(tidyverse)
data <- read.csv("rodicky.csv")
str(data)
data[] <- lapply(data, as.factor)
str(data)

sort(data$rodinny_stav, decreasing = TRUE)

#1
data %>%
  filter(poruchy_placentace_vcestna_placenta == 1,
         komplikace_por_hysterektomie == 1,
         komplikace_por_ztratakrve == 1,
         komplikace_teh_abrupce_placenty == 1) %>%
  count(rok_porodu)

#2
levels(data$delka_hospitalizace)

hosp <- data %>%
  filter(zpusob_porodu == 2,
         !is.na(delka_hospitalizace)) %>%
  count(delka_hospitalizace); hosp

str(hosp)
hosp$delka_hospitalizace <- as.numeric(as.character(hosp$delka_hospitalizace))
rep(hosp$delka_hospitalizace, hosp$n) %>% median() #5

#3
levels(data$vzdelani)
levels(data$rodinny_stav)

data %>%
  filter(vzdelani != 0,
         rodinny_stav %in% 1:4) %>%
  count(vzdelani, rodinny_stav) %>%
  slice_max(order_by = n) #vz 3 rs2

#4
levels(data$rok_porodu)

data %>%
  count(rok_porodu) %>%
  summarise(rozdil = max(n) - min(n)) #41412
