#úkol číslo 1

vektorN1 <- c ("Tea is better than coffee")
vektorN1
vektorN2 <- c (strsplit(vektorN1, " "))
vektorN2

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


#úkol číslo 3

cisla <- as.factor (c(3, 2, 7, 45, 2, 6, 11, 7,
                      90, 76, 4, 3, 46, 45, 7,
                      89, 6, 45, 1, 55, 12, 90,
                      2, 67, 2, 8, 7, 4, 34, 6))
str(cisla)
# ve vectoru je 17 čísel