# Vytvorenie vektora s vetou
veta <- c("Tea is better than coffee")

# Rozdelenie vety na jednotlivé slová
slova <- strsplit(veta, " ")[[1]]

# Zobrazenie výsledku
slova






# Vytvorenie listu s informáciami o filme Dokonalé dni

film <- list(
  nazov = "Dokonalé dni (Perfect Days)",
  
  reziser = "Wim Wenders",
  
  rokVydania = 2023,
  
  herci = c(
    "Koji Yakusho",
    "Tokio Emoto",
    "Arisa Nakano",
    "Aoi Yamada",
    "Yumi Aso"
  ),
  
  nominacieNaCeny = c(
    "Oscar - najlepší medzinárodný film",
    "Zlatá palma - filmový festival v Cannes",
    "César - najlepší zahraničný film"
  ),
  
  produkcneSpolocnosti = c(
    "Master Mind Ltd.",
    "Spoon Inc.",
    "Wenders Images"
  )
)

# Pridanie Zaphoda Beeblebroxa do zoznamu hercov
film$herci <- c(film$herci, "Zaphod Beeblebrox")

# Zobrazenie celého listu
film





x <- c(3, 2, 7, 45, 2, 6, 11, 7,
       90, 76, 4, 3, 46, 45, 7,
       89, 6, 45, 1, 55, 12, 90,
       2, 67, 2, 8, 7, 4, 34, 6)

x <- as.factor(x)

length(levels(x))
