#1. vektory
veta1<-c("Tea is better than coffee"); veta1
veta2<-strsplit(veta1," "); veta2
  
  
#2. oblibeny film
herci<- c("Russel Crowe", "Marion Cotillard", "Albert Finney")
oblibenyfilm<-list(jmeno ="Good Year",
                   reziser ="Ridley Scott",
                   vydani =2006,
                   jmenahercu =herci,
                   ceny ="netusim, ale zaslouzil by",
                   producenti=c("20th Century Studios")); oblibenyfilm
oblibenyfilm$jmenahercu = c(herci,"Zaphod Beeblebrox", "Arthur Dent"); oblibenyfilm

#3. odlisne hodnoty
vektor1<-c(3, 2, 7, 45, 2, 6, 11, 7,
           90, 76, 4, 3, 46, 45, 7,
           89, 6, 45, 1, 55, 12, 90,
           2, 67, 2, 8, 7, 4, 34, 6)
pocet <- as.factor(vektor1); pocet
str(pocet)