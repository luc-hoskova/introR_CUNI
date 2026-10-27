#ukol1
#pata hodnota
zadani<-seq(15.2, 45.7, 0.56)
ukol1<-zadani[seq(5, length(zadani), by = 5)]; ukol1

#ukol2
#teploty v prvnim kvetnovem tydnu (je prvni kvetnovy tyden 1-7? neni dany rok, abych zjistila, jak byly usporadany tydny)
library(dplyr)
head(airquality)
str(airquality)
datum<-filter(airquality, 
       Month ==5,
       Day %in% 1:7,)
ukol2<-select(datum, Temp); ukol2
str(ukol2)
#ukol3
#novy sloupec Weather, hot a cold
airquality$Weather <- "cold"
airquality$Weather[airquality$Temp > 70] <- "hot"
head(airquality)

#bonus
data()
