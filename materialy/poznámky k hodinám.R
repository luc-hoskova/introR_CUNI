#kniha jazyk r a tvorba grafů

#1 hodina
#operátory
  #matematické
  #!, &, %in%, :, ten znak pro nebo
#ukládání do proměných
#etiketa psaní kódu
#ukládání souborů
  #projekty
  #RData, workspace, load()

#2 hodina
#syntax funkce argumenty a tak
#vektory mohou byt numeric integer char a logical
#vektor muze mit hodnoty pojmenovane
  # vektor <- c(jan = 22, dan = 667, sam = 6)
  #lze to prejmenovat  
    # names(vektor) <- c("josh", "lin", "abe")
#indexovat jde dalsim cislovym vektorem, charaktery a logical
  #vektor[dan]
    #tabulka jsou slozene sloupce proto muzeme podle jmena brat jen sloupce
  #vektor[c(TRUE, FALSE, TRUE)]
#x[3] <- 10
#co se stane kdyz si rekneme o vetsi cislo nez je length vektoru? NA
  #nahrazení třetí pozice v x číslem 10
#´pouzivani apostrofu u nazvu s mezerou´
#sort() a order()
#názvy sloupců a řádků
#přidání sloupců a řádků
#dataframe vs tibble
#nahravani dat nejenom z hlavni slozky
  #Use of the relative path. Accesses data in the Data folder
  #read.csv('./Data/Dataset.csv')
  # Goes up a folder first, then into the Data folder
  #read.csv('../Data/Dataset.csv')

#3 hodina
#faktory
  #ukládá se to jako číslo tzn když se dá as.numeric() tak je to zobrazí tak jak je to srovnané (asi podle abecedy)
#library(waldo)
  #compare(s2, s3)
  #if identical() == FALSE, what are the differences?

#4 hodina
#if-else, for, while

#7 hodina
#interaktivní grafy pomocí plotly
#grafy z ggplo2 lze převést na interaktivní pomocí funkce plotly::ggplotly()

#9 hodina
#balíček *psych*

library(psych)

# naměřené hodnoty
data <- c(3, 5, 6, 7, 8)

# výpočet souboru popisných charakteristik s funkcí describe
describe(data)
