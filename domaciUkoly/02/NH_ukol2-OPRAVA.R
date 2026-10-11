#Vytvořte vektor, který v sobě bude mít větu “Tea is better than coffee”. Pokuste se přijít na to, 
#jakým způsobem byste mohli z tohoto vektoru vytvořit druhý vektor, co bude obsahovat hodnoty “Tea” “is” “better” “than” 
#“coffee”. Nezapomeňte, StackOverflow a jiné stránky jsou vaši nejlepší kamarádi ;)

## našla jsem si funkci strsplit(), která mi rozdeli vektor podle mezer

help(strsplit)

veta <- c("Tea is better than coffee")
slova <- strsplit(veta, " "); slova

class(slova)
length(slova)

## ted jsou ale rozdlena slovo list a ja chci vektor

vektorSlova <- unlist(slova); vektorSlova


class(vektorSlova)
length(vektorSlova)

## v jednom radku tedy 

slova <- unlist(strsplit(veta, " ")); slova


#Vytvořte list, který bude obsahovat informace o vašem oblíbeném filmu; jeho název, kdo jej režiséroval, kdy byl vydán, 
#alespoň tři jména herců a hereček, kteří v něm hráli, na jaké ceny byl nominován a jaké společnosti se angažovaly jako 
#jeho producenti. Jakmile budete mít list vytvořený, připojte do seznamu herců/hereček Zaphoda Beeblebroxe.

## vytvoření listu
MulhollandDrive <- list(nazev = "Mulholland drive",
                        reziser = "David Lynch",
                        vydani = "2001",
                        obsazeni = c("Naomi Watts", "Laura Harring", "Ann Miller", "Dan Hedaya", "Justin Theroux", "Brent Briscoe"),
                        nominace = c("Oscar", "Golden Globes", "MFF Cannes", "BAFTA"),
                        produkce = c("Les Films Alain Sarde", "Asymmetrical Productions", "Babbo Inc.", "Canal+")
                        ); MulhollandDrive

## vytvoreni kopie listu, jen primo do kategorie obsazeni pridam Zaphoda Beeblebroxe tim, ze zkopiruji cele puvodni obsazeni a pridam jeho jmeno
MulhollandDriveABeeblebrox <- MulhollandDrive
MulhollandDriveABeeblebrox$obsazeni <- c(MulhollandDrive$obsazeni, "Zaphod Beeblebrox"); MulhollandDriveABeeblebrox
#$ symbol pokryjeme v uterni hodine, pokud bychom chteli vyuzit funkci tak existuje within()

#Kolik odlišných hodnot je v následujícím vektoru?
  
x <- c(3, 2, 7, 45, 2, 6, 11, 7,
    90, 76, 4, 3, 46, 45, 7,
    89, 6, 45, 1, 55, 12, 90,
    2, 67, 2, 8, 7, 4, 34, 6)

# jak bych to uděla já: převést na faktor a přes levels zjistit počet kategorií (17)
faktorX <- as.factor(x)
length(levels(faktorX))

## alternativa co jsem si našla:
length(unique(x))
  
#Skript zašlete nejpozději do pátku před příští hodinou na lucie.hoskova@ruk.cuni.cz