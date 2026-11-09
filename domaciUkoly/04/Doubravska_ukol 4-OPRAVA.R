# funkce v dplyr, ktera umozni prepis hodnot na NA
# na_if(x,y) ... hodnota y ve vektoru x bude prepsana na NA


typBydleni <- read_csv("typBydleni.csv", 
                       na = "NA")
str(typBydleni)
View(typBydleni)
head(typBydleni) 
ukol1 <- typBydleni %>% #tato pipe nam nebude fungovat bez library(dplyr)
  mutate(vek_txt = readr::parse_number(vek_txt))
head(ukol1)
ukol1 <- ukol1 %>%
  dplyr::rename(vek = vek_txt,
                pohlavi = pohlavi_txt,
                uzemi = uzemi_txt,
                bydleni = bydleni_txt); ukol1
head(ukol1)
#uzemiLevels <- ukol1 %>%
#  select(uzemi); uzemiLevels
#unique(uzemiLevels)
#bydleniLevels <- ukol1 %>%
#  select(bydleni)
#unique(bydleniLevels)
#vekLevels <- ukol1 %>%
#  select(vek)
#unique(vekLevels)
#procpak mame tuto vec v poznamce? pokud je to nefunkcni kod, tak neni dobre ho ve skriptu nechavat
ukol1B <- ukol1 %>%
  filter(vek %in% 18:26,
         uzemi == "Jihomoravský kraj",
         bydleni == "Bezdomovci")
head(ukol1)
count(ukol1B) # 27 rows vsichni bezdomovci z JK ve veku 18-26
#hm, a co ty "NA" hodnoty? Neni ten sloupec pohlavi nejaky zvlastni?
ukol1C <- ukol1B %>%
  filter(pohlavi == "muž") 
count(ukol1C) # 9 rows jsou muzi
procentaMuzi <- (count(ukol1C) / count(ukol1B)) *100; procentaMuzi # 33.3%
ukol1D <- ukol1B %>%
  filter(pohlavi == "žena")
count(ukol1D) # 9 rows jsou zeny
procentaZeny <- (count(ukol1D) / count(ukol1B) * 100); procentaZeny ## 33.3%
#zbytek jsou hodnoty, kde nevime jestli jde o zenu nebo muze
#to je nejake zvlastni, ze bychom meli na cloveka stejne muzu a zen bez domova...
#opravdu to pocita pocet lidi? ne pocet radku?

ukol2 #ktery kraj ma nejmin lidi zijicich v ubytovacich zarizenich?
#uoh, nemame objekt ukol2, skript se nam zastavi
bydleniLevels <- typBydleni %>%
select(bydleni_txt)
unique(bydleniLevels) #k cemu vytvarime tento objekt?
ukol2 <- typBydleni %>%
     filter(bydleni_txt == "Osoby žijící v ubytovacím zařízení") %>%
     select(uzemi_txt) 
levels(as.factor(ukol2$uzemi_txt))
table(ukol2$uzemi_txt) # to je blbost, ze vsude 303, ne? 
#ano, podivej se jeste jednou na ty hodnoty v uzemi_txt :]

ukol3 #jaky je median veku bezdomovcu v Praze a jaky v CR?
#opet pozor, objekt ukol3 neni a skript se zastavi
ukol1 <- typBydleni %>%
  mutate(vek_txt = readr::parse_number(vek_txt))
#nebylo by dobre 
head(ukol1)
ukol1 <- ukol1 %>%
  dplyr::rename(vek = vek_txt,
                pohlavi = pohlavi_txt,
                uzemi = uzemi_txt,
                bydleni = bydleni_txt); ukol1
#nebylo by dobre vytvorit si takto upraveny dataset uz na zacatku a pak ho opakovane pouzivat?
ukol3 <- ukol1 %>%
  filter(bydleni == "Bezdomovci",
         uzemi == "Hlavní město Praha") %>% #jak vis, ze to ma byt zrovna Hl. m. Praha?
  select(vek)
median(ukol3$vek) # 50 let v Praze
#a je to median vsech beku pro kazdeho cloveka, a nebo median cisel ve sloupci vek?
ukol3B <- ukol1 %>%
  filter(bydleni == "Bezdomovci",
         uzemi == "Česká republika") %>%
  select(vek)
median(ukol3B$vek) # 50 let v CR 
#vsechno mi vychazi stejne, to je divny, mam dobre nactena data???
#nactena ano, ale vybrana ne - tohle byl jeden ze tri chytaku v tomto datasetu

ukol4 #jaky je najcastejsi zpusob ubytovani osob pod 18 v CR?
ukol1 <- typBydleni %>%
  mutate(vek_txt = readr::parse_number(vek_txt))
head(ukol1)
ukol1 <- ukol1 %>%
  dplyr::rename(vek = vek_txt,
                pohlavi = pohlavi_txt,
                uzemi = uzemi_txt,
                bydleni = bydleni_txt); ukol1
ukol4 <- ukol1 %>%
  filter(vek %in% 1:17,
         uzemi == "Česká republika") %>%
  select(bydleni)
table(ukol4$bydleni) #zase vsude stejny vysledek :-((()))




  







