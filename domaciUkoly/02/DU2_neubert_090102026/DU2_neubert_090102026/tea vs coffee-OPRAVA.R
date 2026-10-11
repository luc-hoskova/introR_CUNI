#1
vector <- c("Tea", "is", "better", "than", "coffee")
#spravne melo byt nacteno nasledujici:
c("Tea is better than coffee")
vector_num <- c #copak ma znamenat tento prikaz? Nemame zadny objekt c
vector_2 <- c("tea", "is", "better", "than", "coffee")
statement <-c ("I don´t agree that tea is better than coffee")
statement_num <- as.numeric(factor(statement [Tea, is, better, than, coffee])
#pozor sviti nam vlevo u cisla radku vystrazny krizek; neco je spatne s kodem
#procpak faktorizujeme a prevadime na numeric?
                           
sentence <- c ("i", "dont", "think", "that", "tea", "is", "better", "than", "coffee")
sentence_num <- as.numeric(sentence)
#procpak prevadime na numeric?

#2
neubert_movie <- list(
  nazev = c("The Fountain"),
  director = c("Darren Aronofsky"),
  year = c(2006),
  actor = c("Hugh Jackman", "Rachel Weisz", "Ellen Burstyn"),
  nominace = c("Saturn Awards", "Zlaty Lev", "Golden Globe", 
               "Critics Choice Awards", "Chicago Film Critics Awards", 
               "Satellite Awards"),
  producent = c("Regency Enterprises", "Protozoa Pictures", "New Regency Pictures")
)
neubert_movie$actor <- c(neubert_movie$actor, "Zaphoda Beeblebroxe")
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak existuje within()

#3
hodnoty<- c(3, 2, 7, 45, 2, 6, 11, 7,
            90, 76, 4, 3, 46, 45, 7,
            89, 6, 45, 1, 55, 12, 90,
            2, 67, 2, 8, 7, 4, 34, 6)
unique(hodnoty)
lenght<-(unique(hodnoty)) #copak vytvarime tady? ma to nejakou spojitost s funkci length? :)
lenght(unique(hodnoty)) #je to length, nikoliv lenght

#spravne
length(unique(hodnoty))
