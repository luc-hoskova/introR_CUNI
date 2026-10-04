df <- as.data.frame(matrix(1:10, nrow = 5)); df
rownames(df) <- paste0("id_", 1:nrow(df))
#pro kazde cislo radku v df vytvor textovou hodnotu zacinajici id_
#vysledny vektor uloz jako nazvy radku pro df
df
