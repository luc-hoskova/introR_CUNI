#1
c ("jmeno", "prijmeni")
domaciuloha <- c ("Tee is better than coffee")

str(domaciuloha)

strsplit(domaciuloha, " ") #toto nam vektor rozlozi na jednotlive casti, ale jaky nam to vrati vysledek?
str(strsplit(domaciuloha, " ")) #list, chteli jsme ale vektor


#2
domaciulohalist <- list(name = "The Odyssey",
     rezie = "Cristopher Nolan",
rok = 2026,
     herci = c("Matt Damon","Tom Holland","Anne Hathaway","Robert Pattinson","Zendaya","Charlize Theron"),
     ceny = c ("Astra Midseason Movie Awards 2026", "Heartland Film 2026"),
     producenti = c("Christopher Nolan", "Emma Thomas", "Universal Pictures", "Wildside"))

domaciulohalist$herci <- c(domaciulohalist$herci, "Zaphoda Beeblebroxe")
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak rxistuje within()

#3
domaciulohadelka <- c(3, 2, 7, 45, 2, 6, 11, 7,
  90, 76, 4, 3, 46, 45, 7,
  89, 6, 45, 1, 55, 12, 90,
  2, 67, 2, 8, 7, 4, 34, 6)

length(domaciulohadelka)
length(unique(domaciulohadelka)) #jednoduse vyreseno :]
