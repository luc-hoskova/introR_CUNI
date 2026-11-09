osoby_pod_18 <- typBydleni %>%
  filter(uzemi_txt == "Česká republika") %>%
  mutate(vek = as.numeric(sub(" .*", "", vek_txt))) %>%
  filter(vek < 18)

print(osoby_pod_18)

typy_ubytovania <- osoby_pod_18 %>%
  group_by(bydleni_txt) %>%
  summarise(pocet_osob = sum(hodnota, na.rm = TRUE)) %>%
  arrange(desc(pocet_osob))

print(typy_ubytovania)

typy_ubytovania <- osoby_pod_18 %>%
  filter(bydleni_txt != "Obyvatelstvo podle způsobu bydlení celkem (kromě bezdomovců)") %>%
  group_by(bydleni_txt) %>%
  summarise(pocet_osob = sum(hodnota, na.rm = TRUE)) %>%
  arrange(desc(pocet_osob))

print(typy_ubytovania)
