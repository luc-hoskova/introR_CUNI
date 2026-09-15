#2
##faktory
#ukládá se to jako číslo tzn když se dá as.numeric() tak je to zobrazí tak jak je to srovnané (asi podle abecedy)


#3 hodina
#přidání sloupců a řádků
#dataframe vs tibble
# $, [] a [[]]
  #$ a [[]] dají hodnoty, [] podvýběr


#4 hodina
#nahravani dat nejenom z hlavni slozky
#Use of the relative path. Accesses data in the Data folder
#read.csv('./Data/Dataset.csv')
# Goes up a folder first, then into the Data folder
#read.csv('../Data/Dataset.csv')
#dir()
#library(waldo)
  #compare(s2, s3)
  #if identical() == FALSE, what are the differences?
#select() a mutate()

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

#10. hodina
#doporučení jupiterHub na HPC od MFF pokud potřebují pracovat s velkými daty
