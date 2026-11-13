library(tidyverse)
data <- read.csv("novorozenci.csv", na.strings = c("", "NA"))
str(data)

data[is.na(data)] <- 0
data[] <- lapply(data, as.factor)
str(data)

#1
data %>%
  filter(pohlavi == 2,
         vaginalne_spontanne == 1,
         porodni_hmotnost == 1,
         gestacni_stari == 1,
         lecba_sal_masaz == 1) %>%
  count(lecba_sal_masaz) #40

#2
levels(data$porodni_hmotnost)
data %>%
  filter(pohlavi == 1,
         porodni_hmotnost != 0,
         lecba_sal_intubace == 1,
         lecba_odd_steroidy_BPD == 1) %>%
  count(porodni_hmotnost) %>%
  filter(n == max(n)) #1

#3
levels(data$gestacni_stari)

data %>%
  filter(vrozena_vada == 1,
         gestacni_stari != 0) %>%
  count(gestacni_stari)
#1  2854
#2 10081
#3 21555
#4 60255

#4
levels(data$pohlavi)

data %>%
  filter(vrozena_vada == 1,
         pohlavi != 3,
         propusteni_duvod == 3) %>%
  count(pohlavi) %>%
  filter(n == max(n)) #1
