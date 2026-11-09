seniori_kraje <- typBydleni %>%
  filter(
    bydleni_txt == "Bezdomovci",
    uzemi_txt %in% c("Liberecký kraj", "Moravskoslezský kraj")
  )

print(seniori_kraje)

seniori_kraje <- seniori_kraje %>%
  mutate(vek = as.numeric(sub(" .*", "", vek_txt)))

head(seniori_kraje)

seniori_65 <- seniori_kraje %>%
  filter(vek >= 65)

print(seniori_65)

pocet_seniorov <- seniori_65 %>%
  group_by(uzemi_txt) %>%
  summarise(pocet_osob = sum(hodnota, na.rm = TRUE))

print(pocet_seniorov)

rozdiel <- max(pocet_seniorov$pocet_osob) -
  min(pocet_seniorov$pocet_osob)

print(rozdiel)
#opravdu tolik? za vsechna pohavi i ona "NA"?