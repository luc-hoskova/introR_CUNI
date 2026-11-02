#1

data = c("Tea is better than coffee")

data = sapply(data, function(x) strsplit(x, split = " ")) %>%  
  unlist() %>% unique()

data

#2


filmBrazil <- list(
  nazev = "Brazil",
  reziser = "Terry Gilliam",
  rok_vydani = 1985,
  herci = c("Jonathan Pryce", "Robert De Niro", "Katherine Helmond")
)

filmBrazil

filmBrazil$herci <- c(filmBrazil$herci, "Zaphod Beeblebrox")

filmBrazil

#3

mnozina = c(3, 2, 7, 45, 2, 6, 11, 7,
            90, 76, 4, 3, 46, 45, 7,
            89, 6, 45, 1, 55, 12, 90,
            2, 67, 2, 8, 7, 4, 34, 6)

length(unique(mnozina))
