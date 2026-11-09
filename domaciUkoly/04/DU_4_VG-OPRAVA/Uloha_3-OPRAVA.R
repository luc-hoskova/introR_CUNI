unique(typBydleni$bydleni_txt)
unique(typBydleni$uzemi_txt)
unique(typBydleni$vek_txt)

median_praha <- typBydleni %>%
  filter(
    bydleni_txt == "Bezdomovci",
    uzemi_txt == "Praha" #oprabdu je Praha kraj?
  )

print(median_praha)

median_praha <- median_praha %>%
  mutate(vek = as.numeric(sub(" .*", "", vek_txt)))
  #a neni i nejaka jednodussi varianta?

head(median_praha)
View(median_praha)

median_praha <- median_praha %>%
  arrange(vek)

median_praha <- median_praha %>%
  mutate(kumulativny_pocet = cumsum(hodnota))

polovica <- sum(median_praha$hodnota) / 2
print(polovica)

median_vysledok <- median_praha %>%
  filter(kumulativny_pocet >= polovica) %>%
  slice(1)

print(median_vysledok$vek)
#velmi chvalim zjisteni si zpusobu, jak to obejit :D
#jde to ale i samotnou funkci median ;]
#jen ti tu porad robi sotky ten sloupec vek

median_praha$vek #opravdu je tohle vycet veku od kazde osoby?
