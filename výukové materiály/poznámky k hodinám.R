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
#x[3] <- 10
  #nahrazení třetí pozice v x číslem 10
#sort() a order()
#názvy sloupců a řádků
#přidání sloupců a řádků
#dataframe vs tibble

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
