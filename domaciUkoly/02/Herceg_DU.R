#ukol_1
#Vytvořte vektor, který v sobě bude mít větu 
#“Tea is better than coffee”. Pokuste se přijít na to, 
#jakým způsobem byste mohli z tohoto vektoru vytvořit 
#druhý vektor, co bude obsahovat hodnoty “Tea” “is” “better” “than” “coffee”.
#Nezapomeňte, StackOverflow a jiné stránky jsou vaši nejlepší kamarádi ;)

#funkcia strsplit + unlist zdroj:https://www.statology.org/strsplit-function-in-r/

veta <- c("Tea is better than coffee")
veta2 <- strsplit(veta, " ")

class(veta2)

veta3 <- unlist(veta2,recursive = TRUE, use.names = TRUE)
veta3
class(veta3)


#ukol_2
#Vytvořte list, který bude obsahovat informace o vašem oblíbeném filmu; 
#jeho název, kdo jej režiséroval, kdy byl vydán, alespoň tři jména herců a hereček,
#kteří v něm hráli, na jaké ceny byl nominován a jaké společnosti se angažovaly jako
#jeho producenti. Jakmile budete mít list vytvořený, připojte do seznamu herců/hereček 
#Zaphoda Beeblebroxe.

#zdroj: https://www.sarthaks.com/3521171/how-do-i-add-elements-to-an-existing-list-in-r 

listFilm1 <- list(nazov = c("Shutter Island"),
             reziser = c("Martin Scorsese"),
             vydanie = c("2010"),
             herci = c("Leonardo DiCaprio", "Mark Ruffalo", 
                       "Ben Kingsley", "Max von Sydow", 
                       "Michelle Williams", "Emily Mortimer",
                       "Patricia Clarkson", "Jackie Earle Haley",
                       "Ted Levine" ),
             ceny = c("Saturn Award", "Satellite Award", 
                      "National Board of Review", "Scream Award", 
                      "Teen Choice Award", "Art Directors Guild Award", 
                      "Visual Effects Society Award"),
             spolocnosti = c("Phoenix Pictures", "Sikelia Productions",
                             "Appian Way Productions", "Paramount Pictures"))
listFilm1
listFilm1$herci <- c(listFilm1$herci, "Zaphoda Beeblebroxe")
listFilm1

#ukol_3
#Kolik odlišných hodnot je v následujícím vektoru?

ukol3 <- as.factor (c (3, 2, 7, 45, 2, 6, 11,
                       7,90, 76, 4, 3, 46, 45,
                       7,89, 6, 45, 1, 55, 12,
                       90,2, 67, 2, 8, 7, 4, 34, 6))
ukol3
str(ukol3)
