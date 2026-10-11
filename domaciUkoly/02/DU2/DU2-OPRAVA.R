# Domaci ukol 1 - Zpusob 1
sentence <- c("Tea is better than coffee") #Vytvoreni vektoru
sentence #Overeni zapisu
mode(sentence) #Zjisteni datoveho typu
words <- strsplit(sentence, split = " "); words #Funkce pro rozdeleni

# Domaci ukol 1 - Zpusob 2, slozitejsi, ale vyborny pro pochopeni vektoru/listu
sentence2 <- c("Tea", "is", "better", "than", "coffee"); paste(sentence, collapse = "")
mode(sentence2)
words2 <- unlist(strsplit(sentence2, split =" ")); words2
#tento zpusob je presne ten, ktery se ma ouzit - chteli jsme vektor :]

#Domaci ukol 2
#Vytvoreni listu
film <- list(nazev = "Interstellar",
             reziser = "Christopher Nolan",
             rok = 2014,
             herci = c("Matthew McConaughey", "Anne Hathaway", "Michael Caine", "Matt Damon"),
             ceny = c("Oskar", "BAFTA", "Saturn Awards"),
             producenti = c("Syncopy Films", "Paramount Pictures", "Warner Bros", "Legendary Pictures")
             )
film
# Pripojeni dalsiho jmena do vektoru hercu/herecek 
film$herci <- append(film$herci, "Zaphod Beeblebrox", after=4)
film
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak existuje within()

#Domaci ukol 3
#Vytvoreni vektoru
vektor <- c(3,2,7,45,2,6,11,7,
            90,76,4,3,46,45,7,
            89,6,45,1,55,12,90,
            2,67,2,8,7,4,34,6)
#Vytvoreni vektoru s jedinecnymi hodnotami
vektor1 <- unique(vektor)
vektor1
# Pocet odlisnych hodnot ve vektoru
pocethodnot <- length(vektor1)
pocethodnot
