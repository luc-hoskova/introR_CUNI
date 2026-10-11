#úkol číslo 1

vektorN1 <- c ("Tea is better than coffee")
vektorN1
vektorN2 <- c (strsplit(vektorN1, " "))
vektorN2#toto nam vektor rozlozi na jednotlive casti, ale jaky nam to vrati vysledek?
str(vektorN2) #list, chteli jsme ale vektor
#jakou funkci bychom k tomu pouzili? rekneme si na hodine

#úkol číslo 2

film <- list(nazev = "Out of Africa",
             reziser = "Sydney Pollack",
             rok_vydani = 1985,
             herci = c("Meryl Streep", "Klaus Maria Brandauer","Malick Bowensn",    "Michael Gough"),
             
             nominace_na_ceny = c(
               "Academy Awards – Nejlepsi film roku",
               "Academy Awards – Nejlepsi rezie",
               "Academy Awards – Nejlepsi adaptovaný scenar",
               "Academy Awards – Nejlepší kamera"  ),
             
             produkce = c(
               "Mirage Enterprises",
               "Universal Pictures" )
)

film


film$herci <- c(film$herci, "Zaphod Beeblebrox")

film
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak existuje within()

#úkol číslo 3

cisla <- as.factor (c(3, 2, 7, 45, 2, 6, 11, 7,
                      90, 76, 4, 3, 46, 45, 7,
                      89, 6, 45, 1, 55, 12, 90,
                      2, 67, 2, 8, 7, 4, 34, 6))
str(cisla) # ve vectoru je 17 čísel
#funkce str nam ukaze strukturu, ale neda nam presne cislo
#jakym zpusobem bychom mohli zjistit pocet neduplicitnich hodnot?
#specificky: jak bychom vytahli informaci o cisle 17?