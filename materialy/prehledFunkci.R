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
dimnames() #pojmenovani jednotlivych dimenzi objektu
install.packages("název balíčku") #instaluje balicek
length() #zjisti delku x
levels() #kategorie faktoru
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
toupper() #zmeni hodnoty textu na upper case

#3. lekce
dim() #dimenze objektu
dplyr::filter() #vyfiltruj hodnoty dle podminek
is.array() #je objekt array
is.na() #je hodnota NA?
max() #maximum
mean() #aritmeticky prumer
median() #median
min() #minimum
nlevels() #pocet levels u faktoru
round() #zaokrouhli
dplyr::select() #vyber sloupec
strsplit() #rozdel charakterovy vektor
unique() #vrat vektor/data frame/array bez duplikovanych hodnot
unlist() #zmen objekt na vektor osahujici vse hodnoty v x
within() #uprav nebo pridej prvky listu ci sloupce data frame