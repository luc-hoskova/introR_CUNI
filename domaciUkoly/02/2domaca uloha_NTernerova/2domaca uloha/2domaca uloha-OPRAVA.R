#1
veta <- "Tea is better than coffee"
slova <- strsplit(veta, " ")[[1]] #defacto spravne, ale vis co se tady stalo? ;)
slova

#2
film <- list(
  nazov = "Jurassic Park",
  reziser = "Steven Spielberg",
  rok_vydania = 1993,
  herci_a_herecky = c(
    "Sam Neill",
    "Laura Dern",
    "Jeff Goldblum",
    "Richard Attenborough",
    "Zaphod Beeblebrox"
  ),
  nominacie_na_ceny = c(
    "Oscar za zvuk",
    "Oscar za strih zvukových efektov",
    "Oscar za vizuálne efekty"
  ),
  produkcne_spolocnosti = c(
    "Amblin Entertainment",
    "Universal Pictures"
  )
)

film$herci_a_herecky <- c(
  film$herci_a_herecky,
  "Zaphod Beeblebrox"
)
film
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak existuje within()

#3
length(unique(c(3, 2, 7, 45, 2, 6, 11, 7,
         90, 76, 4, 3, 46, 45, 7,
         89, 6, 45, 1, 55, 12, 90,
         2, 67, 2, 8, 7, 4, 34, 6)))
  