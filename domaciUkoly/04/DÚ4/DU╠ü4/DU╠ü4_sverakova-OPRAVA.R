library(readr)
typBydleni <- read_csv("~/Desktop/RStudio/typBydleni.csv")
View(typBydleni)
str(typBydleni)
head(typBydleni)

# 1. Osoby 18–26 let v Jihomoravském kraji
vek <- as.numeric(sub(" .*", "", typBydleni$vek_txt))
#a neni i jednodussi funkce na to?
unique(typBydleni$pohlavi_txt)
muzi <- sum(typBydleni$hodnota[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Jihomoravský kraj" &
    !is.na(typBydleni$pohlavi_txt)& #procpak toto kdyz dole mame "muž"?
    vek >= 18 & vek <= 26 &
    typBydleni$pohlavi_txt == "muž"]) 
zeny <- sum(typBydleni$hodnota[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Jihomoravský kraj" &
    !is.na(typBydleni$pohlavi_txt) & #totozne i zde
    vek >= 18 & vek <= 26 &
    typBydleni$pohlavi_txt == "žena"])
bezdomovci <- zeny+muzi
muzi / sum(bezdomovci) * 100
zeny / sum(bezdomovci) * 100
#vyslo ti to, ale sla si na to mozna trochu komplikovane

#2. Který kraj má nejmenší počet obyvatel žijících v ubytovacích zařízení?
unique(typBydleni$bydleni_txt)
unique(typBydleni$uzemi_txt)
praha <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Hlavní město Praha"]
stredocesky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Středočeský kraj"]
jihocesky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Jihočeský kraj"]
plzensky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Plzeňský kraj"]
karlovarsky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Karlovarský kraj"]
ustecky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Ústecký kraj"]
liberecky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Liberecký kraj"]
kralovehradecky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Královéhradecký kraj"]
pardubicky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Pardubický kraj"]
vysocina <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Kraj Vysočina"]
jihomoravsky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Jihomoravský kraj"]
olomoucky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Olomoucký kraj"]
zlinsky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Zlínský kraj"]
moravskoslezsky <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt) &
    typBydleni$uzemi_txt == "Moravskoslezský kraj"]
vysledky <- c(
  "Praha" = sum(praha),
  "Středočeský kraj" = sum(stredocesky),
  "Jihočeský kraj" = sum(jihocesky),
  "Plzeňský kraj" = sum(plzensky),
  "Karlovarský kraj" = sum(karlovarsky),
  "Ústecký kraj" = sum(ustecky),
  "Liberecký kraj" = sum(liberecky),
  "Královéhradecký kraj" = sum(kralovehradecky),
  "Pardubický kraj" = sum(pardubicky),
  "Kraj Vysočina" = sum(vysocina),
  "Jihomoravský kraj" = sum(jihomoravsky),
  "Olomoucký kraj" = sum(olomoucky),
  "Zlínský kraj" = sum(zlinsky),
  "Moravskoslezský kraj" = sum(moravskoslezsky))
sort(vysledky) #výsledek je Karlovarský kraj 6269

# Jaký je medián věku osoby bez domova v Praze, a jaký je v celé ČR?
vek <- as.numeric(sub(" .*", "", typBydleni$vek_txt))
pocetBezdomovciVPraze <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Praha" &
    is.na(typBydleni$pohlavi_txt)]
vekBezdomovcuVPraze <- vek[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Praha" &
    is.na(typBydleni$pohlavi_txt)]
vekOsobVPraze <- rep(vekBezdomovcuVPraze, pocetBezdomovciVPraze)
#velka pochvala, jsi treti clovek ktery si uvedomil ze nejde dat jednoduse pouze median
median(vekOsobVPraze)

pocetBezdomovciVCR <- typBydleni$hodnota[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Česká republika" &
    is.na(typBydleni$pohlavi_txt)]
vekBezdomovcuVCR <- vek[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Česká republika" &
    is.na(typBydleni$pohlavi_txt)]
vekOsobVCR <- rep(vekBezdomovcuVCR, pocetBezdomovciVCR)
median(vekOsobVCR)

# Jaký je nejčastější typ ubytování osob pod 18 let v ČR?
osobyPod18 <- typBydleni$hodnota[
  vek < 18 &
    typBydleni$uzemi_txt == "Česká republika" &
    is.na(typBydleni$pohlavi_txt)]
unique(typBydleni$bydleni_txt)
byt <- sum(typBydleni$hodnota[
  vek < 18 &
    typBydleni$uzemi_txt == "Česká republika" &
    typBydleni$bydleni_txt == "Byt" &
    is.na(typBydleni$pohlavi_txt)], na.rm = TRUE)

ubytovaciZarizeni <- sum(typBydleni$hodnota[
  vek < 18 &
    typBydleni$uzemi_txt == "Česká republika" &
    typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení" &
    is.na(typBydleni$pohlavi_txt)], na.rm = TRUE)

jinaObydli <- sum(typBydleni$hodnota[
  vek < 18 &
    typBydleni$uzemi_txt == "Česká republika" &
    typBydleni$bydleni_txt == "Osoby žijící v jiných obydlích" &
    is.na(typBydleni$pohlavi_txt)], na.rm = TRUE)

bezdomovci <- sum(typBydleni$hodnota[
  vek < 18 &
    typBydleni$uzemi_txt == "Česká republika" &
    typBydleni$bydleni_txt == "Bezdomovci" &
    is.na(typBydleni$pohlavi_txt)], na.rm = TRUE)
c(byt, ubytovaciZarizeni, jinaObydli, bezdomovci) # byt je nejčastější

# O kolik více seniorů (65+ let) bez domova žije v Libereckém než v Moravskoslezském kraji či naopak?
libereckySeniori <- sum(typBydleni$hodnota[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Liberecký kraj" &
    vek >= 65 &
    is.na(typBydleni$pohlavi_txt)], na.rm = TRUE)

moravskoslezskySeniori <- sum(typBydleni$hodnota[
  typBydleni$bydleni_txt == "Bezdomovci" &
    typBydleni$uzemi_txt == "Moravskoslezský kraj" &
    vek >= 65 &
    is.na(typBydleni$pohlavi_txt)], na.rm = TRUE)
moravskoslezskySeniori-libereckySeniori
