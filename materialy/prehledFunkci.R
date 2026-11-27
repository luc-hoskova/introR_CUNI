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
head() #zobraz mi prvnich 6 hodnot objektu
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
any() #nachazi se kdekoliv v objektu urcita hodnota?
dim() #dimenze objektu
dplyr::distinct() #vyber jedinecne radky/hodnoty z data frame
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
sum() #secti vsechny hodnoty v x
unique() #vrat vektor/data frame/array bez duplikovanych hodnot
unlist() #zmen objekt na vektor osahujici vse hodnoty v x
which() #ktery radek splnuje podminky
within() #uprav nebo pridej prvky listu ci sloupce data frame

#4.lekce
complete.cases() #TRUE/FALSE na zaklade toho, zda radek ma chybejici (NA) hodnoty
data() #jake datasety jsou dostupne z nactenych balicku
grepl() #nachazi se dany text v jinem character stringu
dplyr::group_by() #seskup data podle kategorii
ifelse() #pokud je hodnota x TRUE, zmen na y, pokud FALSE tak na z
dplyr::last_col() #vyber posledni sloupec
dplyr::mutate() #zmen hodnoty ve sloupci ci pridej novy sloupec
na.omit() #odstran radky s NA hodnotami
readr::parse_number() #vyber cislo z hodnoty
pull() #funkce varianta symbolu $
read.csv() #nacteni csv dat
readr::read_csv() #nacteni csv dat, vhodne pro vetsi data
read.table() #vseobecna fce k nacitani talukovych dat
readxl::read_xlsx() #nacti excelovy xlsx format, je i read_xls varianta
dplyr::relocate() #presun sloupec na jine misto
dplyr::rename() #prejmenuj nazev hodnoty
replace() #nahrad hodnoty za jine
startsWith() #zacina charakter string s temito znaky?
dplyr::summarise() #vytvor novy dataframe obsahujici vysledky funkci provedenych na grouped datech

#5. funkce
any() #je alespon jedna hodnota z x TRUE
apply() #aplikuj funkci x na vsechny radky/sloupce data frame - jsou podtypy pro specificke input data
dplyr::case_when() #promen hodnoty na zaklade podminek
ceiling() #zaokrouhli k nejblizsimu vyssimu celemu cislu
floor() #zaokrouhli k nejblizsimu nizsimu celemu cislu
function() #vytvor funkci
ifelse() #pokud je podminka TRUE, proved x, jinak proved y
dplyr::na_if(x, y) #pokud x a y jsou identicke, x zmeneno na NA
print() #zobraz x - totozne jako zavolani jmena ulozene promenne
dplyr::slice_max() #vyber radek s nejvetsi hodnotou v x
dplyr::slice_min() #vyber radek s nejmensi hodnotou v x
which.max() #ktera hodnota je nejvetsi

#6. funkce
barplot() #barplot v baseR vizualizaci
colors() #barvy v baseR
ggplot2::ggplot() #vytvor graf v ggplot
ggplot2::geom_bar() #barplot vrstva v ggplot
ggplot2::geom_histogram() #histogram vrstva v ggplot
ggplot2::geom_line() #line chart vrstva v ggplot
ggplot2::geom_point() #scatterplot vrstva v ggplot
ggplot2::geom_text() #popisky hodnot v ggplot
ggplot2::geom_vline() #referenci linie v ggplot
ggplot2::facet_grid() #rozdeli grafy do jednotlivych subgrafu podle kategorii v ggplot
ggplot2::labs() #popisky os v ggplot
ggplot2::scale_fill_manual() #manualni urceni barev kategorii v ggplot
ggplot2::theme_minimal() #jeden z moznych vizualu grafu v ggplot
legend() #vytvoreni legendy pro plot()
plot() #genericka funkce pro vizualizaci v R
nclass.Sturges() #spocitej pocit tridicich kontejneru z hodnot pro histogram
rgb() #vytvor barvu podle RGB hodnot
table() #vytvor kontingencni tabulku kategorialnich hodnot
text() #vytvoreni popisku hodnot pro plot()
hist() #hstogram v baseR vizualizaci