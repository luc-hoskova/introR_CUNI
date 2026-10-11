#homework1
homework1 <- c("Tea is better than coffee.")
# rozdelit na vektor slov podle mezer
strsplit(homework1, " ")


#homework2 vytvorit list 
film <- list(nazev = "Rose",
             rezie = "Markus Schleinzer",
             rok = 2026,
             herci = c("Sandra Huller", "Caro Braun", "Godehard Giese"),
             ceny = c("Silver Bear"),
             producenti = c("Schubert", "Row Pictures", "Walker+Worm Film")); film
# a pridat herce
film$herci <- c(film$herci, "Zaphod Beeblebrox"); film



#homework3  vysledek je 17
numbers <- as.factor(c(3, 2, 7, 45, 2, 6, 11, 7,
                          90, 76, 4, 3, 46, 45, 7,
                          89, 6, 45, 1, 55, 12, 90,
                          2, 67, 2, 8, 7, 4, 34, 6))
str(numbers); numbers
