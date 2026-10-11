# 1. Ukol

veta <- "Tea is better than coffee"

# fce unlist
slova <- unlist(strsplit(veta, " "))

print(slova) #procpak jsi pouzila funkci print, a ne jen zavolani nazvu promenne? :)


# 2. Ukol

film <- list(
  nazev = "Avatar",
  rezisie = "James Cameron",
  rok_vydani = 2009,
  herci = c("Sam Worthington", "Zoe Saldana", "Sigourney Weaver"),
  nominace = c("Academy Award for Best Picture", "Golden Globe Award for Best Motion Picture"),
  producenti = c( "Dune Entertainment", "20th Century Fox")
)

film$herci <- c(film$herci, "Zaphod Beeblebrox")
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak existuje within()

# 3. Ukol

vektor <- c(3, 2, 7, 45, 2, 6, 11, 7, 90, 76, 4, 3, 46, 45, 7, 89, 6, 45, 1, 55, 12, 90, 2, 67, 2, 8, 7, 4, 34, 6)

pocet_unikatnich <- length(unique(vektor))

print(pocet_unikatnich) 
