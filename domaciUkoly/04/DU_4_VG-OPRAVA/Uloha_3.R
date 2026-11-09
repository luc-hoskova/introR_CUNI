unique(typBydleni$bydleni_txt)
unique(typBydleni$uzemi_txt)
unique(typBydleni$vek_txt)

median_praha <- typBydleni %>%
  filter(
    bydleni_txt == "Bezdomovci",
    uzemi_txt == "Praha"
  )

print(median_praha)

median_praha <- median_praha %>%
  mutate(vek = as.numeric(sub(" .*", "", vek_txt)))

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