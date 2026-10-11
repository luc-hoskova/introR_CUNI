sentence <- c("Tea is better than coffee"); sentence
words <- c(strsplit(sentence, " ")); words

Amelie <- list(title = c("Le fabuleux destin d'Amelie Poulain"), 
      director = c("Jean-Pierre Jeunet"), 
      year = c(2001), 
      actors =  c("Audrey Tatou","Mathieu Kassovitz", "Rufus"), 
      prizes = c("Academy Awards", "European Film Awards", "Cesar Awards", "Cesky lev"), 
      producers = c("Claudie Ossard")); Amelie
Amelie$actors <- append(Amelie$actors, "Zaphod Beeblebrox")
Amelie

hodnoty <- as.factor(c(3, 2, 7, 45, 2, 6, 11, 7,
  90, 76, 4, 3, 46, 45, 7,
  89, 6, 45, 1, 55, 12, 90,
  2, 67, 2, 8, 7, 4, 34, 6))
nlevels(hodnoty)
