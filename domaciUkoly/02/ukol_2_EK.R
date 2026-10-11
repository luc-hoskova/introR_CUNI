
# 1
# Tea is better than coffee
tea_1 <- c("Tea is better than coffee")

# vezme obsah první položky v zadaném vektoru
tea_2 <- strsplit(tea_1, " ")[[1]]

#unlist by fungoval i na víc vět
tea_2b <- unlist(strsplit(tea_1, " "))

# 2
film <- list(nazev = "Shrek", 
             rok = 2001, 
             rezie = c("Andrew Adamson","Vicky Jenson"), 
             herci = c("Mike Myers", "Eddie Murphy","Cameron Diaz","John Lithgow"), 
             nominace = c("Best animated feature", "Grammy", "BAFTA - best adapted screenplay"),
             produkce = "Dream Works")

film$herci <- c(film$herci, "Zaphod Beeblebrox")

print(film)
str(film)


# 3 
#Kolik odlišných hodnot je v následujícím vektoru?
  
letsCount <- c(3, 2, 7, 45, 2, 6, 11, 7,
    90, 76, 4, 3, 46, 45, 7,
    89, 6, 45, 1, 55, 12, 90,
    2, 67, 2, 8, 7, 4, 34, 6)

print(length(table(letsCount)))

# druhá možnost 
# length(unique(letsCount))
