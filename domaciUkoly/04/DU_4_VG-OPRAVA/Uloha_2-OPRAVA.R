unique(typBydleni$bydleni_txt)

ubytovanie <- typBydleni[
  typBydleni$bydleni_txt == "Osoby žijící v ubytovacím zařízení",
]

pocet_kraje <- ubytovanie %>%
  filter(!is.na(hodnota), !is.na(uzemi_txt)) %>%
  group_by(uzemi_txt) %>% #opravdu jsou vsechna tato uzemi kraje?
  summarise(pocet_osob = sum(hodnota))

print(pocet_kraje)

kraje_zoradene <- pocet_kraje %>%
  arrange(pocet_osob)

print(kraje_zoradene)

najmenej <- pocet_kraje %>%
  arrange(pocet_osob) %>%
  slice(1)

print(najmenej)
#postup hezky, ale ty kraje se mi nejak nezdaji... jihozapad? ;]