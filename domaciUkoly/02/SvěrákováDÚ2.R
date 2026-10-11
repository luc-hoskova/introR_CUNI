#první část úkolu
veta <- c("Tea is better than coffee");veta
slova <- c("Tea", "is", "better", "than", "coffee"); slova
veta <- c("Tea is better than coffee");veta
strsplit(veta, " ")
veta <- c("Tea is better than coffee")
slova <- unlist(strsplit(veta, " "))
slova

#druhá část úkolu
film <- list(
  nazev = "Mary Oliver: Saved by the Beauty of the World",
  reziser = "Sasha Waters",
  rokVydani = 2026,
  herci = c("Helena Bonham Carter","Steve Buscemi","Stephen Colbert"),
  producenti = c("American Masters Pictures","Pieshake Pictures"))
film$herci <- c(film$herci, "Zaphod Beeblebrox");film

#třetí část úkolu
cisla <- c(3, 2, 7, 45, 2, 6, 11, 7,
           90, 76, 4, 3, 46, 45, 7,
           89, 6, 45, 1, 55, 12, 90,
           2, 67, 2, 8, 7, 4, 34, 6)
length(unique(cisla))
