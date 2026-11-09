# funkce v dplyr, ktera umozni prepis hodnot na NA
# na_if(x,y) ... hodnota y ve vektoru x bude prepsana na NA


typBydleni <- read_csv("typBydleni.csv", 
                       na = "NA")
str(typBydleni)
View(typBydleni)
head(typBydleni) 
ukol1 <- typBydleni %>%
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
ukol1B <- ukol1 %>%
  filter(vek %in% 18:26,
         uzemi == "Jihomoravský kraj",
         bydleni == "Bezdomovci")
head(ukol1)
count(ukol1B) # 27 rows vsichni bezdomovci z JK ve veku 18-26
ukol1C <- ukol1B %>%
  filter(pohlavi == "muž") 
count(ukol1C) # 9 rows jsou muzi
procentaMuzi <- (count(ukol1C) / count(ukol1B)) *100; procentaMuzi # 33.3%
ukol1D <- ukol1B %>%
  filter(pohlavi == "žena")
count(ukol1D) # 9 rows jsou zeny
procentaZeny <- (count(ukol1D) / count(ukol1B) * 100); procentaZeny ## 33.3%
#zbytek jsou hodnoty, kde nevime jestli jde o zenu nebo muze

ukol2 #ktery kraj ma nejmin lidi zijicich v ubytovacich zarizenich?
bydleniLevels <- typBydleni %>%
select(bydleni_txt)
unique(bydleniLevels)
ukol2 <- typBydleni %>%
     filter(bydleni_txt == "Osoby žijící v ubytovacím zařízení") %>%
     select(uzemi_txt) 
levels(as.factor(ukol2$uzemi_txt))
table(ukol2$uzemi_txt) # to je blbost, ze vsude 303, ne? 

ukol3 #jaky je median veku bezdomovcu v Praze a jaky v CR?
ukol1 <- typBydleni %>%
  mutate(vek_txt = readr::parse_number(vek_txt))
head(ukol1)
ukol1 <- ukol1 %>%
  dplyr::rename(vek = vek_txt,
                pohlavi = pohlavi_txt,
                uzemi = uzemi_txt,
                bydleni = bydleni_txt); ukol1
ukol3 <- ukol1 %>%
  filter(bydleni == "Bezdomovci",
         uzemi == "Hlavní město Praha") %>%
  select(vek)
median(ukol3$vek) # 50 let v Praze
ukol3B <- ukol1 %>%
  filter(bydleni == "Bezdomovci",
         uzemi == "Česká republika") %>%
  select(vek)
median(ukol3B$vek) # 50 let v CR 
#vsechno mi vychazi stejne, to je divny, mam dobre nactena data???

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




  







