#Ukol 1 Funkce z dplyr prepisujici hodnoty na NA
#na_if{dplyr}
na_if(c(-99, 1, 4, 3, -99, 5), -99)
na_if(c("a", "b", "", "d"), "")

#Ukol 2

#Ukol 2.1 Pocet osob ve veku 18-26 v Jihomoravskem kraji bez domova, 
# procento muzu a procento zen
data <- read.csv("typBydleni.csv") #nacteni dat
str(data) #kontrola struktury
head(data)

#prepis datoveho typu sloupce vek_txt a kontrola typu
data <- data %>%
  mutate(vek_txt = readr::parse_number(vek_txt)) 
str(data)

# urceni skupin dat ve sloupcich tykajicich se uzemi, bydleni a pohlavi
uzemi <- as.factor(data$uzemi_txt)
levels(uzemi)
bydleni <- as.factor(data$bydleni_txt)
levels(bydleni)
pohlavi <- as.factor(data$pohlavi_txt)
levels(pohlavi)

# vyber dat podle zadani
data1 <- data %>%
  filter(
    vek_txt %in% 18:26,
    uzemi_txt == "Jihomoravský kraj",
    bydleni_txt == "Bezdomovci"
  )
data1

# vyber dat pro muze a vypocet poctu muzu pro dana kriteria
muzi <- data1 %>% 
  filter(
    pohlavi_txt == "muž"
  )
muzi
pocetmuzu <- sum(muzi$hodnota)
pocetmuzu

# vyber dat pro zeny a vypocet poctu zen pro dana kriteria
zeny <- data1 %>%
  filter(
    pohlavi_txt == "žena"
  )
zeny
pocetzen <- sum(zeny$hodnota)
pocetzen

# vypocet procenta muzu a zen a kontrola vypoctu
procentomuzu <- pocetmuzu/(pocetmuzu+pocetzen)*100
procentomuzu
procentozen <- pocetzen/(pocetmuzu+pocetzen)*100
procentozen
kontrolavypoctu <- procentomuzu+procentozen
kontrolavypoctu

# zaokrouhleni dat
vysledekmuzi <- round(procentomuzu, digits = 2)
vysledekzeny <- round(procentozen, digits = 2)

# zapis vysledku
vysledek1 <- paste0("Vysledne procentualni podily muzu a zen ve veku 18 az 26 zijicich v Jihomoravskem kraji jako bezdomovci jsou ", vysledekmuzi," a ", vysledekzeny, ".")
vysledek1

# Ukol 2.2 Vyber kraje s nejmensim poctem obyvatel zijicich v ubytovacich zarizenich
# kontrola dat
str(data)
bydleni <- as.factor(data$bydleni_txt)
levels(bydleni)
uzemi <- as.factor(data$uzemi_txt)
levels(uzemi)

# vyber vsech osob zijicich v ubytovacim zarizeni
data2 <- data %>%
  filter(
    bydleni_txt == "Osoby žijící v ubytovacím zařízení",
    pohlavi_txt == ""
  )
data2

# definovani kraju
kraje <- c("Hlavní město Praha", "Jihočeský kraj", "Jihomoravský kraj", "Karlovarský kraj", "Kraj Vysočina", "Královéhradecký kraj", "Liberecký kraj", "Moravskoslezský kraj", "Olomoucký kraj", "Pardubický kraj", "Plzeňský kraj", "Středočeský kraj", "Ústecký kraj", "Zlínský kraj")
kraje

# vyber kraje - filtr radku s kraji, tvorba skupin podle kraju, 
# secteni poctu osob v kazdem kraji, vyber minimalni hodnoty, zobrazeni vysledku
min_uz <- data2 %>%
  filter(uzemi_txt %in% kraje) %>%
  group_by(uzemi_txt) %>%
  summarise(pocet=sum(hodnota)) %>%
  filter(pocet == min(pocet))
min_uz
str(min_uz)

# zapis vysledku
vysledek2 <- paste0("Kraj s nejmensim poctem obyvatel zijicich v ubytovacich zarizeni je ", min_uz$uzemi_txt, ".")
vysledek2

# Ukol 2.3 Vypocet medianu veku osoby bez domova v Praze a v CR
# kontrola struktury dat
str(data)
head(data)
levels(bydleni)

# vypocet medianu v Praze
praha <- data %>%
  filter(
    uzemi_txt == "Praha",
    bydleni_txt == "Bezdomovci",
    pohlavi_txt == "",
    hodnota != 0
  )
praha
praha_median <- median(praha$vek_txt)
praha_median

# vypocet medianu v CR
ceska_republika <- data %>%
  filter(
    uzemi_txt == "Česká republika",
    bydleni_txt == "Bezdomovci",
    pohlavi_txt == "",
    hodnota != 0
  )
ceska_republika
ceska_republika_median <- median(ceska_republika$vek_txt)
ceska_republika_median

# zapis vysledku
vysledek3 <- paste0("Median veku osoby bez domova v Praze je ", praha_median," a v Ceske republice ", ceska_republika_median, ".")
vysledek3

# Ukol 2.4 Vyber nejcastejsiho typu ubytovani osob pod 18 let v CR
# kontrola dat, zjisteni typu ubytovani
str(data)
head(data)
typ_bydleni <- as.factor(data$bydleni_txt)
levels(typ_bydleni)

# vyber podle zadanych kriterii, vynechani obecnych dat Obyvatelstvo podle zpusobu...
data4 <- data %>%
  filter(
    uzemi_txt == "Česká republika",
    pohlavi_txt == "",
    vek_txt %in% 0:17,
    bydleni_txt != "Obyvatelstvo podle způsobu bydlení celkem (kromě bezdomovců)"
  )
data4

# kontrola spravneho vyfiltrovani
typ_bydleni <- as.factor(data4$bydleni_txt)
levels(typ_bydleni)
str(data4)
head(data4)

# vyber nejcastejsiho typu bydleni, seskupeni dat podle typu bydleni,
# secteni poctu osob v kazde kategorii, vyber nejvyssi hodnoty
bydleni_max <- data4 %>%
  group_by(bydleni_txt) %>%
  summarise(pocetosob = sum(hodnota)) %>%
  filter(pocetosob == max(pocetosob))
bydleni_max

# zapis vysledku
vysledek4 <- paste0("Nejcastejsi typ ubytovani pro osoby mladsi 18 let v Ceske republice je typ ", bydleni_max$bydleni_txt, ".")
vysledek4

# Ukol 2.5 Rozdil v poctu senioru (65+) bez domova mezi Libereckym
# a Moravskoslezskym krajem
# zobrazeni veku v tabulce
data$vek_txt

# vyber senioru-bezdomovcu v Libereckem a Moravskoslezskem kraji
# seskupeni dle kraje a vypocet poctu osob, zobrazeni vysledne tabulky
seniori <- data %>%
  filter(
    vek_txt >= 65,
    uzemi_txt %in% c("Liberecký kraj", "Moravskoslezský kraj"),
    bydleni_txt == "Bezdomovci",
    pohlavi_txt == "") %>%
  group_by(uzemi_txt) %>%
  summarise(pocet = sum(hodnota))
seniori
str(seniori)

# vyber kraje s vyssi a nizsi hodnotou, vypocet rozdilu
max <- seniori[which.max(seniori$pocet),]
max
min <- seniori[which.min(seniori$pocet),]
min
rozdil <- max$pocet - min$pocet
rozdil

# zapis vysledku
vysledek5 <- paste0(max$uzemi_txt, " ma o ", rozdil, " vice senioru bez domova nez ", min$uzemi_txt, ".")
vysledek5
