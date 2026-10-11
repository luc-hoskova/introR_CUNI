#1. vektory
veta1<-c("Tea is better than coffee"); veta1
veta2<-strsplit(veta1," "); veta2 #toto nam vektor rozlozi na jednotlive casti, ale jaky nam to vrati vysledek?
str(veta2) #list, chteli jsme ale vektor
#jakou funkci bychom k tomu poutili? rekneme si na hodine
  
#2. oblibeny film
herci<- c("Russel Crowe", "Marion Cotillard", "Albert Finney")
oblibenyfilm<-list(jmeno ="Good Year",
                   reziser ="Ridley Scott",
                   vydani =2006,
                   jmenahercu =herci,
                   ceny ="netusim, ale zaslouzil by",
                   producenti=c("20th Century Studios")); oblibenyfilm
oblibenyfilm$jmenahercu = c(herci,"Zaphod Beeblebrox", "Arthur Dent"); oblibenyfilm
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak rxistuje within()

#3. odlisne hodnoty
vektor1<-c(3, 2, 7, 45, 2, 6, 11, 7,
           90, 76, 4, 3, 46, 45, 7,
           89, 6, 45, 1, 55, 12, 90,
           2, 67, 2, 8, 7, 4, 34, 6)
pocet <- as.factor(vektor1); pocet
str(pocet) #funkce str nam ukaze strukturu, ale neda nam presne cislo
#jakym zpusobem bychom mohli zjistit pocet neduplicitnich hodnot?
#specificky: jak bychom vytahli informaci o cisle 17?
