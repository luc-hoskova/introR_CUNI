#1
koncentrace <- c("vzorek1" = "75 mg/l",
                 "vzorek2" = "101 mg/l",
                 "vzorek3" = "158 mg/l",
                 "vzorek4" = "48 mg/l")

koncentrace_num <- as.numeric(gsub("mg/l", "", koncentrace))
#slo by to, ale nemame i jednodussi funkci?
names(koncentrace_num)<-names(koncentrace)
      
print(koncentrace_num)
#a nebo staci jen:
koncentrace_num

library(dplyr) #je lepsi davat library vzdy nahoru, aby slo snadno nalezt co uz je nactene
case_when(koncentrace_num > 100 ~ "Vysoká koncentrace", koncentrace_num >=50 & koncentrace_num<=100 ~"Normalní koncentrace", .default = "Nízká koncentrace" )

#2
bakterie<-200
for (i in 1:8) {bakterie<-bakterie * 1.3}
print(bakterie)
#a nebo staci jen:
bakterie

#3
mereni <- matrix(
  c(12, 15, 18, 20, 25, 30,
    8,  10, 12, 35, 40, 45),
  nrow = 4, byrow = TRUE)

rownames(mereni) <- c("Vzorek 1", "Vzorek 2",
                      "Vzorek 3", "Vzorek 4")
colnames(mereni) <- c("Latka A", "Latka B", "Latka C")

mereni

#Jaká je průměrná reaktivita každého vzorku?
aver<-rowMeans(mereni) #ano, ale jak bychom to udelali pomoc fce apply?
print(aver)

#Jaké byly nejvyšší hodnoty způsobené reaktivity pro každou látku a která látka způsobila největší reaktivitu?
apply(mereni, 2, max )

colnames(mereni)[apply(mereni,1, which.max)]
#dokazala bys mi vysvetlit jednotlive tyto funkce a proc je pouzivas? :]


#4
Glc<-c(8.5, 3.9, 5.9, 4.0, 4.5, 9.0, 6.3, 5.1, 7.0, 4.8, 7.2, 4.2)
length(Glc)

ID<-c("01":"12")

stav<-case_when(Glc>=7 ~"Cukrovka", Glc>=5.67 & Glc <=6.9 ~ "Prediabetes", .default = "Norma")
#hm, opravdu jsou vsechny hodnoty pod 5.6 norma?
#a co kdyby mel nekdo hodnotu 6.92? co potom?
#a pozor, mas tam 5.67
tabulka<-cbind(ID, Glc, stav) #opravdu cbind?

tabulka #copak je na teto "tabulce" zvlastniho?

             
        
             
             