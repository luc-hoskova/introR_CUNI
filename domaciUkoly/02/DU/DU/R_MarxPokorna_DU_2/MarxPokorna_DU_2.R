#Vytvořte vektor, který v sobě bude mít větu “Tea is better than coffee”. Pokuste se přijít na to, jakým způsobem byste mohli z tohoto vektoru vytvořit druhý vektor, co bude obsahovat hodnoty “Tea” “is” “better” “than” “coffee”. Nezapomeňte, StackOverflow a jiné stránky jsou vaši nejlepší kamarádi ;)
vektor1_veta <- "Tea is better than coffee"
strsplit (vektor1_veta, split = " ")
#Vytvořte list, který bude obsahovat informace o vašem oblíbeném filmu; jeho název, kdo jej režiséroval, kdy byl vydán, alespoň tři jména herců a hereček, kteří v něm hráli, na jaké ceny byl nominován a jaké společnosti se angažovaly jako jeho producenti. Jakmile budete mít list vytvořený, připojte do seznamu herců/hereček Zaphoda Beeblebroxe.
oblibeny_film <- list( nazev = "Shrek", rok_vydani = 2001, rezie = "Vicky Jenson", herci = c("Mike Myers", "Eddie Murphy" , "Cameron Diaz"), nominace = c( "Oscar", "Zlatý glóbus", "BAFTA"), produkce = c("DreamWorks Animation", "DreamWorks"))

oblibeny_film$herci <- c(oblibeny_film$herci, "Zaphod Beeblebrox")
#Kolik odlišných hodnot je v následujícím vektoru?
viktor <- c(3, 2, 7, 45, 2, 6, 11, 7,
  90, 76, 4, 3, 46, 45, 7,
  89, 6, 45, 1, 55, 12, 90,
  2, 67, 2, 8, 7, 4, 34, 6)
unique(viktor)
length(unique(viktor))
