#Zjistěte, kolik zaměstnanců lze z rozpočtu platit po uvedenou dobu měsíců:
rozpocet / pocetMesicu
rozpocet / pocetMesicu / plat
rozpocet / pocetMesicu %/% plat
(rozpocet / pocetMesicu) %/% plat
#v posledním řádku, kde jsem to chtěla udělat beze zbytku, jsem udělala chybu kvůli hierarchii početních úkonů, ať žijí závorky:) 
#Odpověď jsou tři zaměstanci z vzorce (rozpocet / pocetMesicu) %/% plat. 

#OPRAVA
#a odkud se nam vzaly nahrane hodnoty? ;)
#Doporucuji na zacatku bud ponechat skript nahrani (aka load) nebo do skriptu napdat informaci o tom, ze byl RProjekt ulozen tak, ze automaticky nahrava promenne do globalniho prostredi
#pokud nejaky kod je napsany chybne a opravujeme ho, neni dobre nechavat chybny kod ve skriptu
#zvlast kdyz ho nekomu posilame
#skript by tak z radek 2-5 mel obsahovat bud pouze radek 5 ci popisky u zbylych