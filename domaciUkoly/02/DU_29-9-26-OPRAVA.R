#1
sentence <- c("Tea is better than coffee"); sentence
words <- c(strsplit(sentence, " ")); words #procpak vsledek davame do fce c?
#toto nam vektor rozlozi na jednotlive casti, ale jaky nam to vrati vysledek?
str(words) #list, chteli jsme ale vektor
#jakou funkci bychom k tomu pouzili? rekneme si na hodine

#2
Amelie <- list(title = c("Le fabuleux destin d'Amelie Poulain"), 
      director = c("Jean-Pierre Jeunet"), 
      year = c(2001), 
      actors =  c("Audrey Tatou","Mathieu Kassovitz", "Rufus"), 
      prizes = c("Academy Awards", "European Film Awards", "Cesar Awards", "Cesky lev"), 
      producers = c("Claudie Ossard")); Amelie
Amelie$actors <- append(Amelie$actors, "Zaphod Beeblebrox")
Amelie
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak existuje within()

#3
hodnoty <- as.factor(c(3, 2, 7, 45, 2, 6, 11, 7,
  90, 76, 4, 3, 46, 45, 7,
  89, 6, 45, 1, 55, 12, 90,
  2, 67, 2, 8, 7, 4, 34, 6))
nlevels(hodnoty) #hezka dedikovana funkce!
#je dobre videt, ze si jsi hledala vhodne fce :]
#doporucovala bych spis drzet se fce lenght, at si toho nemusis tolik pamatovat
#ukazka:
length(levels(hodnoty))
