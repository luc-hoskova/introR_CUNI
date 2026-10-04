####################################
#PREHLED FUNKCI Z JEDNOTLIVYCH HODIN
####################################
#1. lekce
getwd() #jake je nastavene working directory
identical() #je x, y, z... totozne?
load() #nahraj RData soubor do R
save() #uloz hodnoty jako
setwd() #nastav cestu do working directory

#2. lekce
as.character() #zmen hodnoty na character
as.factor() #zmen hodnoty na faktory
as.logical() #zmen hodnoty na boolean
as.numeric() #zmen hodnoty na ciselne
as.vector() #zmen strukturu na vektor
array() #vytvori datove pole
c() #shrn hodnoty do vektoru
cbind() #spoji objektx po sloupcich
cbind.data.frame() #spoji objektx po sloupcich do dataframe
class() #jak se R vuci objektu chova
colnames() #nazvy sloupcu x
data.frame() #vytvori data frame
install.packages("název balíčku") #instaluje balicek
length() #zjisti delku x
library() #nahrání balíčku do R
list() #vytvori list/seznam
lsf.str("package:jmenoBalicku") #vypis vsechny funkce v balicku a ukaz jejich strukturu
matrix() #vytvori matici
mode() #jaky je datovy typ x
names() #jake jsou jmena/stitky x
ncol() #pocet sloupcu
nrow() #pocet radku
paste0() #spoj bez mezery dva a vice charakterovych hodnot dohromady
rbind() #spoji objekty po radcich
rep() #zopakuje x
rownames() #nazvy radku x
sample() #provede nahodny vyber z x
seq() #vytvori sekvenci dle dannych parametru
str() #jaka je struktura x
tibble::tibble() #vytvori tibble
tolower() #zmeni hodnoty textu na lower case