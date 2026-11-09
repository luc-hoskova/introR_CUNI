library(readr)
typBydleni <- read_csv("typBydleni.csv")
View(typBydleni)

names(typBydleni)
head(typBydleni)
str(typBydleni)

library(dplyr) 

osoby <- typBydleni %>%
  filter(
    vek_txt >= 18,
    vek_txt <= 26,
    uzemi_txt == "Jihomoravský kraj",
    bydleni_txt == "Bezdomovci"
  )


pocet_osob <- sum(osoby$hodnota, na.rm = TRUE)

osoby_bez_NA <- osoby[!is.na(osoby$pohlavi_txt), ]

muzi <- osoby_bez_NA[osoby_bez_NA$pohlavi_txt == "muž", ]
pocet_muzov <- sum(muzi$hodnota)

zeny <- osoby_bez_NA[osoby_bez_NA$pohlavi_txt == "žena", ]
pocet_zien <- sum(zeny$hodnota)

pocet_osob_bez_NA <- sum(osoby_bez_NA$hodnota)

print(pocet_muzov)
print(pocet_zien)

percenta_muzi <- (pocet_muzov * 100) / pocet_osob_bez_NA
percenta_zeny <- (pocet_zien * 100) / pocet_osob_bez_NA